import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/date_helper.dart';
import 'package:bulk_app/core/helpers/image_base_64_helper.dart';
import 'package:bulk_app/core/helpers/media.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/templates/data/models/add_template_request_body.dart';
import 'package:bulk_app/features/templates/data/repos/templates_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'add_template_cubit.freezed.dart';
part 'add_template_state.dart';

class AddTemplateCubit extends Cubit<AddTemplateState> {
  late final TemplatesRepo _templatesRepo;
  AddTemplateCubit(this._templatesRepo)
      : super(const AddTemplateState.initial());

  TextEditingController messageController = TextEditingController();
  TextEditingController templateNameController = TextEditingController();

  // Future<String?> getFileToSend() async {
  //   return pickedFile != null ? "data:${ImageBase64Helper.getFileMimeType(pickedFile!.path)};base64,${await ImageBase64Helper.imageToBase64(pickedFile!)}":'';
  // }

  void validateTemplate() {
    final isValid = templateNameController.text.isNotEmpty;
    // Replace with actual validation logic
    debugPrint('isValid: $isValid');
    emit(AddTemplateState.stateOfButton(isValid: isValid));
  }

  void emitAddTemplateStates() async {
    emit(const AddTemplateState.loading());
    final String imageToBase64 = pickedFile != null
        ? "data:${ImageBase64Helper.getFileMimeType(pickedFile!.path)};base64,${await ImageBase64Helper.imageToBase64(pickedFile!)}"
        : '';
    final response = await _templatesRepo.login(AddTemplateRequestBody(
      name: templateNameController.text,
      message: messageController.text,
      file: imageToBase64,
    ));
    response.when(
      success: (success) {
        emit(AddTemplateState.success(success));
        debugPrint('file: $imageToBase64');
        debugPrint('success----------$success');
      },
      failure: (error) => emit(
        AddTemplateState.error(error: error.error?.details ?? []),
      ),
    );
  }

  void emitRemoveImage() async {
    // if(pickedFiles != null) {
    pickedFile = null;
    // pickedFiles!.removeAt(index);
    emit(const AddTemplateState.pickedMultiMediaAndFiles(pickedFile: null));
  }

  XFile? pickedFile;
  Future<void> pickMultipleMedia(BuildContext context) async {
    final imagePicker = getIt<AppMedia>();
    try {
      final pickedXFile = await imagePicker.pickImage();
      if (pickedXFile != null) {
        pickedFile = XFile(pickedXFile.path);
        debugPrint(' file: ${pickedFile!.path}');
        if (context.mounted) {
          AppMedia.pickImageWithSizeLimit(context, pickedFile: pickedFile!);
        }
        emit(
            AddTemplateState.pickedMultiMediaAndFiles(pickedFile: pickedFile!));
      } else {
        debugPrint('No files picked');
        emit(const AddTemplateState.initial());
      }
    } catch (e) {
      debugPrint('Error picking files: $e');
      emit(AddTemplateState.error(error: ['Error picking files: $e']));
    }
  }

  addCurrentTimeInMessage() {
    messageController.text =
        '${messageController.text} ${DateHelper.convertToTimeString(DateTime.now())}';
  }

  addCurrentDateInMessage() {
    messageController.text =
        '${messageController.text} ${DateHelper.formatDate(DateTime.now())}';
  }

  addMessageIDInMessage() {
    messageController.text = '${messageController.text} #Message ID ';
  }
}

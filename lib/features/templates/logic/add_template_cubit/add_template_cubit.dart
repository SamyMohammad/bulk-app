import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/date_helper.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/helpers/image_base_64_helper.dart';
import 'package:bulk_app/core/helpers/media.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/templates/data/models/add_template_request_body.dart';
import 'package:bulk_app/features/templates/data/models/get_template_by_id_response.dart';
import 'package:bulk_app/features/templates/data/repos/templates_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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
  Uint8List? fileFromApi;
  initControllers() async {
    messageController.text = template?.template?.message ?? '';
    templateNameController.text = template?.template?.name ?? '';
    if (template?.template?.file.isNotNullAndNotEmpty() ?? false) {
      debugPrint('template?.template?.file: ${template?.template?.file}');
      Uint8List file =
          await ImageBase64Helper.base64ToImage(template?.template?.file ?? '');
      fileFromApi = file;
      emit(AddTemplateState.pickedMultiMediaAndFiles(file: file));
    }
  }

  GetTemplateByIdResponse? template;
  void emitGetTemplatesByIdStates(int id) async {
    emit(const AddTemplateState.getTemplateByIdLoadingState());
    final response = await _templatesRepo.getTemplateById(id);
    response.when(
      success: (success) {
        template = success.data;
        initControllers();
        emit(AddTemplateState.getTemplateByIdSuccessState(
            success.data ?? GetTemplateByIdResponse()));
      },
      failure: (error) => emit(
        AddTemplateState.error(error: error.error?.details ?? []),
      ),
    );
  }

  bool isValid = false;
  void validateTemplate() {
    final isValid = templateNameController.text.isNotEmpty;
    debugPrint('isValid: $isValid');
    this.isValid = isValid;
    emit(AddTemplateState.stateOfButton(isValid: isValid));
  }

  Future<String> imageToBase64() async {
    final mimeType =
        ImageBase64Helper.getFileMimeType(pickedFilefromDevice!.path);
    final base64String =
        await ImageBase64Helper.imageToBase64(pickedFilefromDevice!);
    return "data:$mimeType;base64,$base64String";
  }

  void emitAddTemplateStates() async {
    emit(const AddTemplateState.addTemplateLoadingState());
    final response = await _templatesRepo.addTemplate(AddTemplateRequestBody(
      name: templateNameController.text,
      message: messageController.text,
      file: pickedFilefromDevice != null ? await imageToBase64() : '',
    ));
    response.when(
      success: (success) {
        emit(AddTemplateState.addTemplateSuccessState(success));
      },
      failure: (error) => emit(
        AddTemplateState.error(error: error.error?.details ?? []),
      ),
    );
  }

  void emitUpdateTemplateStates(int id) async {
    emit(const AddTemplateState.updateTemplateLoadingState());

    final response =
        await _templatesRepo.updateTemplate(UpdateTemplateRequestBody(
      name: templateNameController.text,
      message: messageController.text,
      file: fileFromApi == null
          ? pickedFilefromDevice == null
              ? ''
              : await imageToBase64()
          : await ImageBase64Helper.memoryImageToBase64(fileFromApi) ?? '',
      id: template?.template?.id ?? 0,
    ));
    response.when(
      success: (success) {
        emit(AddTemplateState.updateTemplateSuccessState(success));
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
    pickedFilefromDevice = null;
    fileFromApi = null;
    // pickedFiles!.removeAt(index);
    emit(const AddTemplateState.pickedMultiMediaAndFiles(pickedFile: null));
  }

  XFile? pickedFilefromDevice;
  Future<void> pickMultipleMedia(BuildContext context) async {
    final imagePicker = getIt<AppMedia>();
    try {
      final pickedXFile = await imagePicker.pickImage();
      if (pickedXFile != null) {
        fileFromApi = null;
        pickedFilefromDevice = XFile(pickedXFile.path);
        debugPrint(' file: ${pickedFilefromDevice!.path}');
        if (context.mounted) {
          AppMedia.pickImageWithSizeLimit(context,
              pickedFile: pickedFilefromDevice!);
        }
        emit(AddTemplateState.pickedMultiMediaAndFiles(
            pickedFile: pickedFilefromDevice!));
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

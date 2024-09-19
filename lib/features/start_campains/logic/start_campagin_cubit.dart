import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/date_helper.dart';
import 'package:bulk_app/core/helpers/media.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'start_campagin_cubit.freezed.dart';
part 'start_campagin_state.dart';

class StartCampaginCubit extends Cubit<StartCampaginState> {
  StartCampaginCubit() : super(const StartCampaginState.initial());
  TextEditingController messageController = TextEditingController();
  TextEditingController templateNameController = TextEditingController();
  void emitRemoveImage() async {
    // if(pickedFiles != null) {
    pickedFilefromDevice = null;
    // pickedFiles!.removeAt(index);
    emit(const StartCampaginState.pickedMultiMediaAndFiles(pickedFile: null));
  }

  XFile? pickedFilefromDevice;
  Future<void> pickMultipleMedia(BuildContext context) async {
    final imagePicker = getIt<AppMedia>();
    try {
      final pickedXFile = await imagePicker.pickImage();
      if (pickedXFile != null) {
        pickedFilefromDevice = XFile(pickedXFile.path);
        debugPrint(' file: ${pickedFilefromDevice!.path}');
        if (context.mounted) {
          AppMedia.pickImageWithSizeLimit(context,
              pickedFile: pickedFilefromDevice!);
        }
        emit(StartCampaginState.pickedMultiMediaAndFiles(
            pickedFile: pickedFilefromDevice!));
      } else {
        debugPrint('No files picked');
        emit(const StartCampaginState.initial());
      }
    } catch (e) {
      debugPrint('Error picking files: $e');
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

import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/date_helper.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/helpers/image_base_64_helper.dart';
import 'package:bulk_app/core/helpers/media.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/data/repository/audiance_repository.dart';
import 'package:bulk_app/features/start_campains/data/model/create_campain_request_model.dart';
import 'package:bulk_app/features/start_campains/data/repos/start_campain_repo.dart';
import 'package:bulk_app/features/templates/data/models/get_template_by_id_response.dart';
import 'package:bulk_app/features/templates/data/repos/templates_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../manage_audiances/data/models/audience.dart';
import '../../templates/data/models/get_all_templates_response.dart';

part 'start_campagin_cubit.freezed.dart';
part 'start_campagin_state.dart';

class StartCampaginCubit extends Cubit<StartCampaginState> {
  late final AudienceRepository _repository;
  late final TemplatesRepo _templatesRepo;
  late final StartCampainRepo startCampainRepo;
  StartCampaginCubit(
      this._repository, this._templatesRepo, this.startCampainRepo)
      : super(const StartCampaginState.initial());
  TextEditingController messageController = TextEditingController();
  TextEditingController templateNameController = TextEditingController();
  Uint8List? fileFromApi;

  Audience? selectedAudience;
  Template? selectedTemplate;
  List<Audience>? audiences;

  List<Template>? templates;

  void emitCreateCampaignStates(int accountId) async {
    final response = await startCampainRepo.createCampaign(
        CreateCampainRequestBody(
            templateId: selectedTemplate?.id,
            audienceId: selectedAudience?.id,
            accountId: accountId));
    response.when(
      success: (success) {
        emit(StartCampaginState.createCampaignSuccessState());
      },
      failure: (error) {
        emit(StartCampaginState.createCampaignFailureState(error));
        debugPrint(error.toString());
      },
    );
  }

  void emitToggleCampaignStates(int accountId) async {
    final response = await startCampainRepo.toggleCampaign(accountId);
    response.when(
      success: (success) {
        emit(StartCampaginState.createCampaignSuccessState());
      },
      failure: (error) {
        emit(StartCampaginState.createCampaignFailureState(error));
        debugPrint(error.toString());
      },
    );
  }

  GetTemplateByIdResponse? template;

  void emitGetTemplatesByIdStates(int id) async {
    final response = await _templatesRepo.getTemplateById(id);
    response.when(
      success: (success) {
        template = success.data;
        initControllers();
        emit(StartCampaginState.getTemplateByIdSuccessState());
      },
      failure: (error) => debugPrint(error.toString()),
    );
  }

  Future<void> emitGetAllTemplatesStates() async {
    // emit(const StartCampaginState.getAllTemplatesLoadingState());

    final response = await _templatesRepo.getAllTemplates();
    response.when(
      success: (success) {
        if (success.data?.templates?.isNullOrEmpty() ?? false) {
          // emit(StartCampaginState.getAllTemplatesEmptyState(
          //     success.data ?? TemplatesData(templates: [])));
        } else {
          // emit(StartCampaginState.getAllTemplatesSuccessState(
          //     success.data ?? TemplatesData(templates: [])));
          templates = success.data?.templates;
        }
      },
      failure: (error) {
        print(error.toString());
      },
    );
  }

  Future<void> fetchAudienceList() async {
    // emit(const ManageAudiancesState.audienceLoadingState());
    try {
      final response = await _repository.getAllAudiences();
      response.when(
        success: (BaseResponse<AudiencesListData> data) {
          audiences = data.data?.audiences;
          print(audiences);
        },
        failure: (error) {
          // emit(ManageAudiancesState.audienceErrorState(error));
        },
      );
    } catch (e) {
      // emit(const ManageAudiancesState.audienceEmptyState());
    }
  }

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

  initControllers() async {
    messageController.text = template?.template?.message ?? '';
    templateNameController.text = template?.template?.name ?? '';
    if (template?.template?.file.isNotNullAndNotEmpty() ?? false) {
      debugPrint('template?.template?.file: ${template?.template?.file}');
      Uint8List file =
          await ImageBase64Helper.base64ToImage(template?.template?.file ?? '');
      fileFromApi = file;
      // emit(AddTemplateState.pickedMultiMediaAndFiles(file: file));
    }
  }

  // select audience
  // GetTemplateByIdResponse? template;
  // void emitGetTemplatesByIdStates(int id) async {
  //   // emit(const AddTemplateState.getTemplateByIdLoadingState());
  //   final response = await _templatesRepo.getTemplateById(id);
  //   response.when(
  //       success: (success) {
  //         template = success.data;
  //         initControllers();
  //         // emit(AddTemplateState.getTemplateByIdSuccessState(
  //         //     success.data ?? GetTemplateByIdResponse()));
  //       },
  //       failure: (error) {}
  //       //  emit(
  //       //   // AddTemplateState.error(error: error),
  //       // ),
  //       );
  // }

  void selectAudience(Audience audience) {
    selectedAudience = audience;
    emit(StartCampaginState.selectedAudience());
  }

  void selectTemplate(Template template) {
    selectedTemplate = template;
    emitGetTemplatesByIdStates(template.id ?? 0);

    emit(const StartCampaginState.selectedTemplate());
  }
}

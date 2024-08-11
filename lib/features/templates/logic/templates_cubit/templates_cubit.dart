import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/networking/api_error_handler.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repos/templates_repo.dart';

part 'templates_cubit.freezed.dart';
part 'templates_state.dart';

class TemplatesCubit extends Cubit<TemplatesState> {
  TemplatesCubit(this._templatesRepo) : super(const TemplatesState.initial());
  late final TemplatesRepo _templatesRepo;

  void emitGetAllTemplatesStates() async {
    emit(const TemplatesState.getAllTemplatesLoadingState());

    final response = await _templatesRepo.getAllTemplates();
    response.when(
      success: (success) {
        if (success.data?.templates.isNullOrEmpty() ?? false) {
          emit(TemplatesState.getAllTemplatesEmptyState(
              success.data ?? TemplatesData(templates: [])));
        } else {
          emit(TemplatesState.getAllTemplatesSuccessState(
              success.data ?? TemplatesData(templates: [])));
        }
      },
      failure: (error) => emit(
        TemplatesState.getAllTemplatesErrorState(error: error),
      ),
    );
  }

  void emitDeleteTemplateStates(int id) async {
    emit(const TemplatesState.loadingDelete());

    final response = await _templatesRepo.deleteTemplate(id);
    response.when(
      success: (success) {
        emit(const TemplatesState.successDelete());

        emitGetAllTemplatesStates();
      },
      failure: (error) => emit(
        TemplatesState.errorDelete(error: error),
      ),
    );
  }
}

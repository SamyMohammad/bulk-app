import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repos/templates_repo.dart';

part 'templates_cubit.freezed.dart';
part 'templates_state.dart';

class TemplatesCubit extends Cubit<TemplatesState> {
  TemplatesCubit(this._templatesRepo) : super(const TemplatesState.initial());
  late final TemplatesRepo _templatesRepo;
  List<Templates>? templates = [];
  void emitGetAllTemplatesStates() async {
    emit(const TemplatesState.loading());

    final response = await _templatesRepo.getAllTemplates();
    response.when(
      success: (success) {
        if (success.data?.templates.isNullOrEmpty() ?? false) {
          emit(TemplatesState.empty(
              success.data ?? TemplatesData(templates: [])));
        } else {
          emit(TemplatesState.success(
              success.data ?? TemplatesData(templates: [])));
          templates = success.data?.templates;
        }
      },
      failure: (error) => emit(
        TemplatesState.error(error: error.error?.details ?? []),
      ),
    );
  }

  void emitDeleteTemplateStates(int id) async {
    emit(const TemplatesState.loading());

    final response = await _templatesRepo.deleteTemplate(id);
    response.when(
      success: (success) {
        emit(const TemplatesState.successDelete());

        emitGetAllTemplatesStates();
      },
      failure: (error) => emit(
        TemplatesState.errorDelete(error: error.error?.details ?? []),
      ),
    );
  }

  void getFilteredTemplatesListFrom({required String? query}) {
    List<Templates>? templates = filterTemplates(query);

    if (templates?.isNotEmpty ?? false) {
      emit(TemplatesState.success(TemplatesData(templates: templates)));
    } else {
      emit(TemplatesState.empty(TemplatesData(templates: [])));
    }
  }

  filterTemplates(String? query) {
    final filteredItems = templates
        ?.where((template) =>
            template.name!.toLowerCase().contains(query?.toLowerCase() ?? ''))
        .toList();
    return filteredItems;
  }
}

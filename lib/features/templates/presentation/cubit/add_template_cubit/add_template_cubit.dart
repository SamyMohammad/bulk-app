import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_template_state.dart';
part 'add_template_cubit.freezed.dart';

class AddTemplateCubit extends Cubit<AddTemplateState> {
  AddTemplateCubit() : super(const AddTemplateState.initial());
}

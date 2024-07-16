import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'templates_state.dart';
part 'templates_cubit.freezed.dart';

class TemplatesCubit extends Cubit<TemplatesState> {
  TemplatesCubit() : super(const TemplatesState.initial());
}

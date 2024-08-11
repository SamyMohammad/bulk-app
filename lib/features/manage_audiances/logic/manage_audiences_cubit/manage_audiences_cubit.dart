import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_audiences_cubit.freezed.dart';
part 'manage_audiences_state.dart';

class ManageAudiencesCubit extends Cubit<ManageAudiencesState> {
  ManageAudiencesCubit() : super(const ManageAudiencesState.initial());
}

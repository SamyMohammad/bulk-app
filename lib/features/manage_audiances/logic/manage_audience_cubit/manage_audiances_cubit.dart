import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/app_preference.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:bulk_app/features/manage_audiances/data/repository/audiance_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_audiances_cubit.freezed.dart';
part 'manage_audiances_state.dart';

class ManageAudiancesCubit extends Cubit<ManageAudiancesState> {
  ManageAudiancesCubit(this._repository)
      : super((const ManageAudiancesState.initial()));
  List<Audience>? audiences;
  late final AudienceRepository _repository;

  Future<void> fetchAudienceList() async {
    emit(const ManageAudiancesState.audienceLoadingState());
    try {
      final response = await _repository.getAllAudiences();
      response.when(
        success: (BaseResponse<AudiencesListData> data) {
          audiences = data.data?.audiences;
          if (audiences.isNotNullAndNotEmpty()) {
            emit(ManageAudiancesState.audienceSuccessState(audiences!));
          } else {
            emit(const ManageAudiancesState.audienceEmptyState());
          }
        },
        failure: (error) {
          emit(ManageAudiancesState.audienceErrorState(error));
        },
      );
    } catch (e) {
      emit(const ManageAudiancesState.audienceEmptyState());
    }
  }

  Future<void> delete(int id) async {
    emit(const ManageAudiancesState.audienceLoadingState());
    audiences?.removeWhere((audience) => audience.id == id);
    try {
      await _repository.deleteAudienceByid(id.toString());
      emit(ManageAudiancesState.audienceSuccessState(audiences!));
    } catch (e) {
      emit(const ManageAudiancesState.audienceEmptyState());
    }
  }
}

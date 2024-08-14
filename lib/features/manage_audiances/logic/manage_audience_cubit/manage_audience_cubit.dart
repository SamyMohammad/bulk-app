import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/manage_audiances/data/repository/audiance_repository.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audience_state.dart';

class ManageAudiancesCubit extends Cubit<ManageAudiancesState> {
  final AudienceRepository _repository;

  ManageAudiancesCubit(this._repository)
      : super((const ManageAudiancesState.initial()));


  Future<void> fetchAudienceList() async {
    emit(const ManageAudiancesState.audienceLoadingState());
    final response = await _repository.getAllAudiences();
    response.when(
      success: (data) {
        final audiences = data.data?.audiences;
        if (audiences.isNullOrEmpty()) {
          emit(const ManageAudiancesState.audienceEmptyState());
        } else {
          emit(ManageAudiancesState.audienceSuccessState(audiences));
        }
      },
      failure: (error) {
        emit(ManageAudiancesState.audienceErrorState(error));
      },
    );
  }
}

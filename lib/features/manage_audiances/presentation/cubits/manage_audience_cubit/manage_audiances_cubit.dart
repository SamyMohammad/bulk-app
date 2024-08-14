import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/networking/api_service.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/manage_audiances/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/models/audiences.dart';
import 'package:bulk_app/features/manage_audiances/repository/audiance_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_audiances_state.dart';
part 'manage_audiances_cubit.freezed.dart';

class ManageAudiancesCubit extends Cubit<ManageAudiancesState> {
  ManageAudiancesCubit() : super(ManageAudiancesState.initial());
  List<Audiences>? audiences;
  late final AudienceRepository repository;

  void init() {
    emit(const ManageAudiancesState.loading());
    final ApiService client = getIt<ApiService>();
    repository = AudienceRepository(client);
    fetchAudienceList();
  }

  Future<void> fetchAudienceList() async {
    emit(const ManageAudiancesState.loading());
    try {
      final response = await repository.getAllAudiences();
      response.when(
        success: (BaseResponse<AudienceResponseData> data) {
          audiences = data.data?.audiences;
          if (audiences != null && audiences!.isNotEmpty) {
            emit(ManageAudiancesState.loaded(audiences!));
          } else {
            emit(const ManageAudiancesState.error('No audiences available.'));
          }
        },
        failure: (error) {
          emit(const ManageAudiancesState.error('Failed to fetch audiences.'));
        },
      );
    } catch (e) {
      emit(const ManageAudiancesState.error('An unknown error occurred.'));
    }
  }

  Future<void> delete(int id) async {
    emit(const ManageAudiancesState.loading());
    audiences?.removeWhere((audience) => audience.id == id);
    try {
      await repository.deleteAudienceByid(id.toString());
      emit(ManageAudiancesState.loaded(audiences!));
    } catch (e) {
      emit(const ManageAudiancesState.error('Failed to delete audience.'));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/networking/api_service.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/manage_audiances/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/models/audiences.dart';
import 'package:bulk_app/features/manage_audiances/repository/audiance_repository.dart';
import 'package:equatable/equatable.dart';

part 'manage_audience_state.dart';

class ManageAudiancesCubit extends Cubit<ManageAudiancesState> {
  late final AudienceRepository repository;

  ManageAudiancesCubit() : super(AudienceInitial());
  List<Audiences>? audiences;

  void init() {
    emit(AudienceLoading());
    final ApiService client = getIt<ApiService>();
    repository = AudienceRepository(client);
    fetchAudienceList();
  }

  Future<void> fetchAudienceList() async {
    emit(AudienceLoading());
    try {
      final response = await repository.getAllAudiences();
      response.when(
        success: (BaseResponse<AudienceResponseData> data) {
          audiences = data.data?.audiences;
          if (audiences != null && audiences!.isNotEmpty) {
            emit(AudienceLoaded(audiences!));
          } else {
            emit(const AudienceError('No audiences available.'));
          }
        },
        failure: (error) {
          emit(const AudienceError('Failed to fetch audiences.'));
        },
      );
    } catch (e) {
      emit(const AudienceError('An unknown error occurred.'));
    }
  }

  Future<void> delete(int id) async {
    emit(AudienceLoading());
    audiences?.removeWhere((audience) => audience.id == id);
    try {
      await repository.deleteAudienceByid(id.toString());
      emit(AudienceLoaded(audiences!));
    } catch (e) {
      emit(const AudienceError('Failed to delete audience.'));
    }
  }
}

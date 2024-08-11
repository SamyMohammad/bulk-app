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
          final audiences = data.data?.audiences;
          if (audiences != null && audiences.isNotEmpty) {
            emit(AudienceLoaded(audiences));
          } else {
            emit(AudienceError('No audiences available.'));
          }
        },
        failure: (error) {
          emit(AudienceError('Failed to fetch audiences.'));
          print("Failure: $error");
        },
      );
    } catch (e) {
      emit(AudienceError('An unknown error occurred.'));
      print("Error: $e");
    }
  }
}

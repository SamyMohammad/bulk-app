import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_audiances_state.dart';

class ManageAudiancesCubit extends Cubit<ManageAudiancesState> {
  ManageAudiancesCubit() : super(ManageAudiancesInitial());
}

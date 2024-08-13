// manage_audiances_cubit.dart

part of 'manage_audience_cubit.dart';

abstract class ManageAudiancesState extends Equatable {
  const ManageAudiancesState();

  @override
  List<Object> get props => [];
}

class AudienceInitial extends ManageAudiancesState {}

class AudienceLoading extends ManageAudiancesState {}

class AudienceDeletion extends ManageAudiancesState {}

class AudienceLoaded extends ManageAudiancesState {
  final List<Audiences> audiences;

  const AudienceLoaded(this.audiences);

  @override
  List<Object> get props => [audiences];
}

class AudienceError extends ManageAudiancesState {
  final String message;

  const AudienceError(this.message);

  @override
  List<Object> get props => [message];
}

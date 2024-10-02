part of 'shared_controller_cubit.dart';

@freezed
class SharedControllerState with _$SharedControllerState {
  const factory SharedControllerState.initial() = _Initial;
  const factory SharedControllerState.getAllAccountsLoadingState() =
      GetAllAccountsLoadingState;
  const factory SharedControllerState.getAllAccountsSuccessState() =
      GetAllAccountsSuccessState;
  const factory SharedControllerState.getAllAccountsFailureState() =
      GetAllAccountsFailureState;

// addAccount
  const factory SharedControllerState.addAccountLoadingState() =
      AddAccountLoadingState;
  const factory SharedControllerState.addAccountSuccessState() =
      AddAccountSuccessState;
  const factory SharedControllerState.addAccountFailureState() =
      AddAccountFailureState;
// getAccountById
  const factory SharedControllerState.getAccountByIdLoadingState() =
      GetAccountByIdLoadingState;
  const factory SharedControllerState.getAccountByIdSuccessState() =
      GetAccountByIdSuccessState;
  const factory SharedControllerState.getAccountByIdFailureState() =
      GetAccountByIdFailureState;
  const factory SharedControllerState.connectivityState(bool isConnected) =
      ConnectivityState;
// get Active Campain
  const factory SharedControllerState.getActiveCampainLoadingState() =
      GetActiveCampainLoadingState;
  const factory SharedControllerState.getActiveCampainSuccessState() =
      GetActiveCampainSuccessState;
  const factory SharedControllerState.getActiveCampainFailureState() =
      GetActiveCampainFailureState;
}

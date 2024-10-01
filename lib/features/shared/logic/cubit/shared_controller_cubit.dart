import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bulk_app/features/shared/data/models/add_account_request_body.dart';
import 'package:bulk_app/features/shared/data/models/get_account_by_id_rm/get_account_by_id_rm.dart';
import 'package:bulk_app/features/shared/data/models/get_all_accounts_rm/get_all_accounts_rm.dart';
import 'package:bulk_app/features/shared/data/repos/shared_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'shared_controller_cubit.freezed.dart';
part 'shared_controller_state.dart';

class SharedControllerCubit extends Cubit<SharedControllerState> {
  final SharedRepo _sharedRepo;
  SharedControllerCubit(this._sharedRepo)
      : super(const SharedControllerState.initial());
  final StreamController<String> controller = StreamController<String>();
  void listenToSSE(String token) async {
    // Replace this URL with your SSE server URL
    var uri =
        Uri.parse('http://195.35.14.201:3434/api/subscribe/account/$token');

    var request = http.Request("GET", uri);
    var response = await request.send();

    // Listen to the response as a stream
    response.stream
        .transform(const Utf8Decoder()) // Decode UTF-8 stream
        .transform(const LineSplitter()) // Split the stream into lines
        .listen((event) {
      print("Event: $event");

      if (event.isNotEmpty) {
        controller.add(event);
        print("Event: $event");
        // Add the event to the stream controller
      }
    }, onError: (error) {
      print('Error in SSE stream: $error');
    });
  }

  void emitSubscribeAccountSSEStates(String token) async {
    final headers = <String, String>{};

    SSEClient.subscribeToSSE(
      method: SSERequestType.GET,
      url: 'http://195.35.14.201:3434/api/subscribe/account/$token',
      header: headers,
    ).listen(
      (event) {
        print('Id: ${event.id!}');
        print('Event: ${event.event!}');
        print('Data: ${event.data!}');
      },
    );
  }

  GetAllAccountsRm? getAllAccountsRm;
  GetAccountByIdRm? getAccountByIdRm;
  void emitgetAllAccountsStates() async {
    emit(const SharedControllerState.getAllAccountsLoadingState());
    final response = await _sharedRepo.getAllAccounts();

    response.when(success: (allAccountsRm) async {
      if (kDebugMode) {
        print('emitgetAllAccountsStatesResponse----------$allAccountsRm');
      }
      getAllAccountsRm = allAccountsRm.data;
      _handleGetAllAccountsResponse(getAllAccountsRm);
      emit(const SharedControllerState.getAllAccountsSuccessState());
    }, failure: (error) {
      emit(const SharedControllerState.getAllAccountsFailureState());
    });
  }

  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  List<ConnectivityResult> connectionStatus = [ConnectivityResult.none];
  final Connectivity connectivity = Connectivity();
  bool isConnected = false; // Track the internet connection state
  void checkConnectivity() async {
    _checkConnectivity();
    // Listening for connectivity changes
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  Future<void> _checkConnectivity() async {
    try {
      final result = await connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } catch (e) {
      print("Couldn't check connectivity: $e");
    }
  }

  // Update the connection status based on the result
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    connectionStatus.addAll(results);
    isConnected = connectionStatus.contains(ConnectivityResult.mobile) ||
        connectionStatus
            .contains(ConnectivityResult.wifi); // Update connectivity state

    emit(SharedControllerState.connectivityState(isConnected));
  }

  void _handleGetAllAccountsResponse(GetAllAccountsRm? getAllAccountsRm) {
    if (getAllAccountsRm?.accounts?.isNotEmpty ?? false) {
      emitgetAccountByIdStates(
          getAllAccountsRm?.accounts?.first.id.toString() ?? '');
    } else {
      emitAddAccountStates();
    }
  }

  void emitAddAccountStates() async {
    emit(const SharedControllerState.addAccountLoadingState());
    final response = await _sharedRepo.addAccount(AddAccountRequestBody(
      name: "String",
      phone: "String",
    ));

    response.when(success: (addAccountRm) async {
      if (kDebugMode) {
        print('emitgetAllAccountsStatesResponse----------$addAccountRm');
      }

      emit(const SharedControllerState.addAccountSuccessState());
    }, failure: (error) {
      emit(const SharedControllerState.addAccountFailureState());
    });
  }

  void emitgetAccountByIdStates(String id) async {
    emit(const SharedControllerState.getAccountByIdLoadingState());
    final response = await _sharedRepo.getAccountById(id);

    response.when(success: (response) async {
      getAccountByIdRm = response;

      emit(const SharedControllerState.getAccountByIdSuccessState());
    }, failure: (error) {
      emit(const SharedControllerState.getAccountByIdFailureState());
    });
  }
}

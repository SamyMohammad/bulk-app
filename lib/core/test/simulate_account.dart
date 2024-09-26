import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

// Define the account statuses
enum AccountStatus { noAccount, disconnected, connected, connecting, qrcode }

class MockAccountCubit extends Cubit<AccountStatus> {
  Timer? _timer;
  int _tick = 0;

  MockAccountCubit() : super(AccountStatus.noAccount);

  // Simulates adding an account, transitioning to 'disconnected'
  void addAccount() {
    emit(AccountStatus.disconnected); // Account added, now disconnected
    startListeningToStream(); // Start listening for connection state updates
  }

  // Simulates a stream of connection states after adding an account
  void startListeningToStream() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      _tick++;

      // Cycle through connection states
      if (_tick == 1) {
        emit(AccountStatus.disconnected);
      } else if (_tick == 2) {
        emit(AccountStatus.qrcode); // Show QR code to connect
      } else if (_tick == 3) {
        emit(AccountStatus.connecting); // Successfully connected
      } else if (_tick > 4) {
        emit(AccountStatus.connected); // Simulate disconnection
        stopListeningToStream(); // Stop after disconnection
      }
    });
  }

  void stopListeningToStream() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

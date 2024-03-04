import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:agora_voice_call/services/agora_service/agora_service_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart';

// ignore: constant_identifier_names
const BASE_URL = 'https://voice-call-server.onrender.com';

enum SocketConnectionStatus {
  // ignore: constant_identifier_names
  Connected,
  // ignore: constant_identifier_names
  Connecting,
  // ignore: constant_identifier_names
  Reconnecting,
  // ignore: constant_identifier_names
  Disconnected
}

extension SocketConnectionStatusExtension on SocketConnectionStatus {
  bool get isConnecting => this == SocketConnectionStatus.Connecting;
  bool get isDisconnected => this == SocketConnectionStatus.Disconnected;
  bool get isConnected => this == SocketConnectionStatus.Connected;
  bool get isReconnecting => this == SocketConnectionStatus.Reconnecting;
}

class AgoraServiceImpl extends IAgoraService {
  late Socket _socket;
  final _incomingCallEvent = 'incoming_call';
  final _rejectCallEvent = 'reject_call';
  final _muteCallStatusEvent = 'mute_call';
  final ValueNotifier<SocketConnectionStatus> _connectionStatus =
      ValueNotifier(SocketConnectionStatus.Disconnected);
  @override
  void emitIncomigCall(Map<String, dynamic> data) async {
    log("$_incomingCallEvent ==> $data");

    /// socket emits incoming call event to the server.
    _socket.emit(_incomingCallEvent, data);
  }

  @override
  Future<void> init() async {
    _socket = io(
      BASE_URL,
      OptionBuilder()
          .setQuery({
            //id of the current user
            "user_id": '01',
          })
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build(),
    );

    _socket.onConnect((data) {
      log("Socket connected...");
      _connectionStatus.value = SocketConnectionStatus.Connected;
    });
    _socket.onReconnect(
      (_) async {
        log("Socket connection reconnecting");
        _connectionStatus.value = SocketConnectionStatus.Reconnecting;
      },
    );
    _socket.onDisconnect(
      (data) {
        log("Socket connection disconnected");
        _connectionStatus.value = SocketConnectionStatus.Disconnected;
      },
    );

    _socket.onConnectError(
      (data) {
        log("Socket connection error");
      },
    );

    _socket.connect();
    // ignore: unused_local_variable
    Timer timer;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_socket.connected) {
        _socket.connect();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Future<String?> getToken(String channel) async {
    try {
      final response =
          await http.post(Uri.parse('$BASE_URL/get-access-token'), body: {
        'channel': channel,
      });
      if (response.statusCode != 200) return null;
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data.containsKey('token')) {
        return data['token'] as String;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  void emitCallMuteStatus(Map<String, dynamic> data) {
    _socket.emit(_muteCallStatusEvent, data);
  }

  @override
  void emitRejectCall(String userId) {
    _socket.emit(_rejectCallEvent, {
      'user_id': userId,
    });
  }

  @override
  Future<void> emitUserOnAnotherCall(Map<String, dynamic> data) {
    // TODO: implement emitUserOnAnotherCall
    throw UnimplementedError();
  }

  @override
  Future<void> onRejectCall(data) {
    // TODO: implement onRejectCall
    throw UnimplementedError();
  }

  @override
  Future<void> onRemoteUserMuteCall(data) {
    // TODO: implement onRemoteUserMuteCall
    throw UnimplementedError();
  }

  @override
  Future<void> onUserOnAnotherCall(data) {
    // TODO: implement onUserOnAnotherCall
    throw UnimplementedError();
  }

  @override
  Future<void> onIncomingCall(Map<String, dynamic> data) {
    // TODO: implement onIncomingCall
    throw UnimplementedError();
  }
}

final agoraServiceProvider = Provider<IAgoraService>((ref) {
  return AgoraServiceImpl();
});

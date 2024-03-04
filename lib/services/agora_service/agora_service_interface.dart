abstract class IAgoraService {
  /// Initializes the socket and all other callbacks that needs to be initialized at the start of the project
  Future<void> init();
  //***************************[ CALLBACKS ]***************************** */
  /// A callback that is registered for `incoming calls`. It takes in a data which is returned from the socket data.
  Future<void> onIncomingCall(Map<String, dynamic> data);

  /// A callback that is registered for when the receiver rejects a call.
  Future<void> onRejectCall(dynamic data);

  /// A callback that is registered for when the remote user mutes or unmutes tha call
  Future<void> onRemoteUserMuteCall(dynamic data);

  /// A callback that is registered for when the user is currently on another call.
  Future<void> onUserOnAnotherCall(dynamic data);

  // **********************************[ EVENTS ] *****************************************
  /// emits and `incoming call` event to the socket server, passing the necessary information.
  void emitIncomigCall(Map<String, dynamic> data);

  /// A method that allows the current user to reject a call.
  void emitRejectCall(String userId);

  /// A method that allows a user to send the `mute` status of the call.
  void emitCallMuteStatus(Map<String, dynamic> data);

  /// Emits an event to the caller to indicate that the receiver is currently on another call.
  Future<void> emitUserOnAnotherCall(Map<String, dynamic> data);

  //*************************************[METHODS]************************************************* */d for
  /// Takes in the channel name as an argument, and returns a token from the server that will be used for the call. It can be null when no token is returned, or there is an error.
  Future<String?> getToken(String channel);
}

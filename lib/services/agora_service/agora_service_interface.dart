abstract class IAgoraService {
  Future<void> init();
  //***************************[  ]***************************** */
  Future<void> onIncomingCall();

  // **********************************s
  Future<void> emitIncomigCall(Map<String, dynamic> data);

  Future<String> getToken(String channel);
}

enum CallType {
  incoming,
  outgoing,
  missed,
}

class CallModel {
  final String name;
  final String time;
  final String avatarUrl;
  final CallType callType;
  final bool isVideo;

  CallModel({
    required this.name,
    required this.time,
    required this.avatarUrl,
    required this.callType,
    required this.isVideo,
  });
}
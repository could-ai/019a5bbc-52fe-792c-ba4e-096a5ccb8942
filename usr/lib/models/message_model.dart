class MessageModel {
  final String message;
  final String time;
  final bool isSentByMe;

  MessageModel({
    required this.message,
    required this.time,
    required this.isSentByMe,
  });
}
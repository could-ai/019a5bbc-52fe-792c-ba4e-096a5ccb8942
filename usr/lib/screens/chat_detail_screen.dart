import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatModel chat;

  const ChatDetailScreen({super.key, required this.chat});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<MessageModel> _messages = [
    MessageModel(
      message: 'Hey! How are you doing?',
      time: '10:30 AM',
      isSentByMe: false,
    ),
    MessageModel(
      message: 'I\'m doing great! Thanks for asking.',
      time: '10:32 AM',
      isSentByMe: true,
    ),
    MessageModel(
      message: 'That\'s good to hear!',
      time: '10:33 AM',
      isSentByMe: false,
    ),
    MessageModel(
      message: 'Are we still meeting tomorrow?',
      time: '10:35 AM',
      isSentByMe: false,
    ),
    MessageModel(
      message: 'Yes, definitely! See you at 3 PM.',
      time: '10:36 AM',
      isSentByMe: true,
    ),
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        MessageModel(
          message: _messageController.text,
          time: TimeOfDay.now().format(context),
          isSentByMe: true,
        ),
      );
    });
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[300],
              child: widget.chat.isGroup
                  ? const Icon(Icons.group, color: Colors.white, size: 20)
                  : Text(
                      widget.chat.name[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'online',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'view_contact',
                  child: Text('View contact'),
                ),
                const PopupMenuItem(
                  value: 'media',
                  child: Text('Media, links, and docs'),
                ),
                const PopupMenuItem(
                  value: 'search',
                  child: Text('Search'),
                ),
                const PopupMenuItem(
                  value: 'mute',
                  child: Text('Mute notifications'),
                ),
                const PopupMenuItem(
                  value: 'wallpaper',
                  child: Text('Wallpaper'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel message) {
    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: message.isSentByMe
              ? const Color(0xFFDCF8C6)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.message,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
                if (message.isSentByMe) ...<Widget>[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 16,
                    color: Colors.blue[700],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.emoji_emotions_outlined, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                  Icon(Icons.attach_file, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Icon(Icons.camera_alt, color: Colors.grey[600]),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: const Color(0xFF075E54),
            radius: 24,
            child: IconButton(
              icon: const Icon(Icons.mic, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
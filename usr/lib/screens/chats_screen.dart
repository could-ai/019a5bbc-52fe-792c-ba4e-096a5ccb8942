import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import 'chat_detail_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration
    final List<ChatModel> chats = [
      ChatModel(
        name: 'John Doe',
        message: 'Hey! How are you doing?',
        time: '10:30 AM',
        avatarUrl: '',
        unreadCount: 2,
      ),
      ChatModel(
        name: 'Sarah Wilson',
        message: 'Let\'s meet tomorrow',
        time: '9:15 AM',
        avatarUrl: '',
        unreadCount: 0,
      ),
      ChatModel(
        name: 'Team Project',
        message: 'Alice: The deadline is next week',
        time: 'Yesterday',
        avatarUrl: '',
        unreadCount: 5,
        isGroup: true,
      ),
      ChatModel(
        name: 'Mom',
        message: 'Don\'t forget to call me',
        time: 'Yesterday',
        avatarUrl: '',
        unreadCount: 0,
      ),
      ChatModel(
        name: 'David Chen',
        message: 'Thanks for your help!',
        time: 'Monday',
        avatarUrl: '',
        unreadCount: 0,
      ),
      ChatModel(
        name: 'Emma Johnson',
        message: '👍',
        time: 'Monday',
        avatarUrl: '',
        unreadCount: 0,
      ),
      ChatModel(
        name: 'Work Group',
        message: 'You: Meeting at 3 PM',
        time: 'Sunday',
        avatarUrl: '',
        unreadCount: 0,
        isGroup: true,
      ),
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(chat: chat),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[300],
                  child: chat.isGroup
                      ? const Icon(Icons.group, color: Colors.white, size: 28)
                      : Text(
                          chat.name[0].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        chat.message,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chat.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: chat.unreadCount > 0
                            ? const Color(0xFF25D366)
                            : Colors.grey[600],
                      ),
                    ),
                    if (chat.unreadCount > 0) ...<Widget>[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF25D366),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          chat.unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
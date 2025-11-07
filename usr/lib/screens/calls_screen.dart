import 'package:flutter/material.dart';
import '../models/call_model.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock call history data
    final List<CallModel> calls = [
      CallModel(
        name: 'John Doe',
        time: 'Today, 10:30 AM',
        avatarUrl: '',
        callType: CallType.incoming,
        isVideo: false,
      ),
      CallModel(
        name: 'Sarah Wilson',
        time: 'Today, 9:15 AM',
        avatarUrl: '',
        callType: CallType.outgoing,
        isVideo: true,
      ),
      CallModel(
        name: 'Mom',
        time: 'Yesterday, 8:20 PM',
        avatarUrl: '',
        callType: CallType.missed,
        isVideo: false,
      ),
      CallModel(
        name: 'David Chen',
        time: 'Yesterday, 3:45 PM',
        avatarUrl: '',
        callType: CallType.incoming,
        isVideo: true,
      ),
      CallModel(
        name: 'Emma Johnson',
        time: 'Yesterday, 11:30 AM',
        avatarUrl: '',
        callType: CallType.outgoing,
        isVideo: false,
      ),
    ];

    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey[300],
            child: Text(
              call.name[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            call.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: call.callType == CallType.missed ? Colors.red : null,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                call.callType == CallType.incoming
                    ? Icons.call_received
                    : call.callType == CallType.outgoing
                        ? Icons.call_made
                        : Icons.call_missed,
                size: 16,
                color: call.callType == CallType.missed
                    ? Colors.red
                    : Colors.grey[600],
              ),
              const SizedBox(width: 4),
              Text(
                call.time,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          trailing: Icon(
            call.isVideo ? Icons.videocam : Icons.call,
            color: const Color(0xFF075E54),
            size: 24,
          ),
        );
      },
    );
  }
}
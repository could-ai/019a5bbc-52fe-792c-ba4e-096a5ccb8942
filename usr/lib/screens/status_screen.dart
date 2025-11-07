import 'package:flutter/material.dart';
import '../models/status_model.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock status data
    final List<StatusModel> recentStatuses = [
      StatusModel(
        name: 'Sarah Wilson',
        time: '30 minutes ago',
        avatarUrl: '',
        isSeen: false,
      ),
      StatusModel(
        name: 'John Doe',
        time: '1 hour ago',
        avatarUrl: '',
        isSeen: false,
      ),
      StatusModel(
        name: 'Emma Johnson',
        time: '2 hours ago',
        avatarUrl: '',
        isSeen: true,
      ),
    ];

    final List<StatusModel> viewedStatuses = [
      StatusModel(
        name: 'David Chen',
        time: 'Today, 8:30 AM',
        avatarUrl: '',
        isSeen: true,
      ),
      StatusModel(
        name: 'Mom',
        time: 'Yesterday, 11:20 PM',
        avatarUrl: '',
        isSeen: true,
      ),
    ];

    return ListView(
      children: [
        // My Status
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.white, size: 30),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Color(0xFF25D366),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            'My status',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'Tap to add status update',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ),
        const Divider(height: 1),
        if (recentStatuses.isNotEmpty) ...<Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Recent updates',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...recentStatuses.map((status) => _buildStatusItem(status)),
        ],
        if (viewedStatuses.isNotEmpty) ...<Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Viewed updates',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...viewedStatuses.map((status) => _buildStatusItem(status)),
        ],
      ],
    );
  }

  Widget _buildStatusItem(StatusModel status) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: status.isSeen ? Colors.grey : const Color(0xFF25D366),
            width: 2.5,
          ),
        ),
        child: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.grey[300],
          child: Text(
            status.name[0].toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      title: Text(
        status.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        status.time,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
    );
  }
}
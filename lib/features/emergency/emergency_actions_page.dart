import 'package:flutter/material.dart';

class EmergencyActionsPage extends StatelessWidget {
  const EmergencyActionsPage({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Actions'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Get help quickly',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () =>
                  _showMessage(context, 'Calling emergency services'),
              icon: const Icon(Icons.phone),
              label: const Text('Call Emergency Services'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () =>
                  _showMessage(context, 'Alert sent to your contacts'),
              icon: const Icon(Icons.notifications_active),
              label: const Text('Alert Emergency Contacts'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _showMessage(context, 'Location shared'),
              icon: const Icon(Icons.location_on),
              label: const Text('Share My Location'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class SOSStatusPage extends StatelessWidget {
  const SOSStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('SOS Status'),
        backgroundColor: AppColors.emergency,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.sos,
              size: 80,
              color: AppColors.emergency,
            ),

            const SizedBox(height: 15),

            const Text(
              'SOS Activated',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.emergency,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Emergency protection has been activated.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            _StatusItem(
              icon: Icons.people,
              title: 'Guardians',
              status: 'Alert pending',
            ),

            _StatusItem(
              icon: Icons.local_police,
              title: 'Police / Control Room',
              status: 'Integration pending',
            ),

            _StatusItem(
              icon: Icons.location_on,
              title: 'Live Location',
              status: 'Sharing pending',
            ),

            _StatusItem(
              icon: Icons.groups,
              title: 'Nearby Volunteers',
              status: 'Alert pending',
            ),

            _StatusItem(
              icon: Icons.videocam,
              title: 'Evidence Recording',
              status: 'Pending',
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Return'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String status;

  const _StatusItem({
    required this.icon,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(
          Icons.check_circle_outline,
          color: AppColors.warning,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          status,
          style: const TextStyle(
            color: AppColors.textSecondary,
          ),
        ),
        trailing: Icon(
          icon,
          color: AppColors.emergency,
        ),
      ),
    );
  }
}
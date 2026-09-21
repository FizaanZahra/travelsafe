import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class SilentProtectionPage extends StatefulWidget {
  const SilentProtectionPage({super.key});

  @override
  State<SilentProtectionPage> createState() =>
      _SilentProtectionPageState();
}

class _SilentProtectionPageState
    extends State<SilentProtectionPage> {
  bool protectionEnabled = false;

  void _toggleProtection(bool value) {
    setState(() {
      protectionEnabled = value;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value
              ? 'Silent Protection activated.'
              : 'Silent Protection deactivated.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Silent Protection'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            Icon(
              Icons.volume_off,
              size: 80,
              color: protectionEnabled
                  ? AppColors.success
                  : AppColors.primary,
            ),

            const SizedBox(height: 20),

            const Text(
              'Silent Protection',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Activate protection discreetly without drawing '
              'attention to the emergency.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 35),

            Card(
              color: AppColors.surface,
              child: SwitchListTile(
                activeThumbColor: AppColors.primary,
                title: const Text(
                  'Silent Protection',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  protectionEnabled
                      ? 'Protection is active'
                      : 'Protection is inactive',
                ),
                value: protectionEnabled,
                onChanged: _toggleProtection,
              ),
            ),

            const SizedBox(height: 20),

            if (protectionEnabled)
              const Card(
                color: AppColors.surface,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.security,
                        color: AppColors.success,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Silent emergency protection is active.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const Spacer(),

            const Text(
              'Real emergency alerts and tracking will be '
              'connected during backend integration.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
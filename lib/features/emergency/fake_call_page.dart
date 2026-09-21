import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'caller_selection.dart';

class FakeCallPage extends StatelessWidget {
  const FakeCallPage({super.key});

  void _selectCaller(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CallerSelectionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Fake Call'),
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 35),

            const Icon(
              Icons.phone_in_talk,
              size: 80,
              color: AppColors.secondary,
            ),

            const SizedBox(height: 20),

            const Text(
              'Fake Call',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Simulate an incoming call when you need an excuse '
              'to leave an uncomfortable situation.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _selectCaller(context),
                icon: const Icon(Icons.person),
                label: const Text('Choose Caller'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
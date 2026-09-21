import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class IncomingCallPage extends StatelessWidget {
  final String callerName;

  const IncomingCallPage({
    super.key,
    required this.callerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),

            const Text(
              'Incoming Call',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 30),

            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 65,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              callerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FloatingActionButton(
                      heroTag: 'decline',
                      backgroundColor: AppColors.emergency,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.call_end,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Decline',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    FloatingActionButton(
                      heroTag: 'accept',
                      backgroundColor: AppColors.success,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Fake call accepted.',
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Accept',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
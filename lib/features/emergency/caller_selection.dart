import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'incoming_call.dart';

class CallerSelectionPage extends StatefulWidget {
  const CallerSelectionPage({super.key});

  @override
  State<CallerSelectionPage> createState() =>
      _CallerSelectionPageState();
}

class _CallerSelectionPageState
    extends State<CallerSelectionPage> {
  String selectedCaller = 'Mother';

  final List<String> callers = [
    'Mother',
    'Father',
    'Friend',
    'Guardian',
    'Custom Caller',
  ];

  void _startFakeCall() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncomingCallPage(
          callerName: selectedCaller,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Choose Caller'),
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Who should call you?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Select a caller for the simulated incoming call.',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: RadioGroup<String>(
                groupValue: selectedCaller,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedCaller = value;
                    });
                  }
                },
                child: Column(
                  children: callers.map((caller) {
                    return ListTile(
                      title: Text(caller),
                      leading: Radio<String>(value: caller),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _startFakeCall,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                child: const Text('Start Fake Call'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
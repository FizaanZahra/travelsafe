import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../emergency/emergency_actions_page.dart';

class TravelModePage extends StatefulWidget {
  const TravelModePage({super.key});

  @override
  State<TravelModePage> createState() => _TravelModePageState();
}

class _TravelModePageState extends State<TravelModePage> {
  bool travelModeEnabled = false;
  int safetyMinutes = 30;

  void _toggleTravelMode(bool value) {
    setState(() {
      travelModeEnabled = value;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value
              ? 'Travel Mode activated'
              : 'Travel Mode deactivated',
        ),
      ),
    );
  }

  void _startTimer() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Safety timer started for $safetyMinutes minutes',
        ),
      ),
    );
  }

  void _openEmergencyActions() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmergencyActionsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text('Travel Mode'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Travel safely',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Activate Travel Mode before starting your journey.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 25),

            // Travel Mode Card
            Card(
              color: AppColors.surface,
              child: SwitchListTile(
                activeThumbColor: AppColors.primary,

                title: const Text(
                  'Travel Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                subtitle: Text(
                  travelModeEnabled
                      ? 'Your journey is being monitored'
                      : 'Travel Mode is currently off',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),

                value: travelModeEnabled,
                onChanged: _toggleTravelMode,
              ),
            ),

            const SizedBox(height: 20),

            // Safety Timer Card
            Card(
              color: AppColors.surface,
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Safety Timer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '$safetyMinutes minutes',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    Slider(
                      activeColor: AppColors.primary,
                      min: 10,
                      max: 120,
                      divisions: 11,
                      value: safetyMinutes.toDouble(),
                      label: '$safetyMinutes min',

                      onChanged: (value) {
                        setState(() {
                          safetyMinutes = value.toInt();
                        });
                      },
                    ),

                    const SizedBox(height: 5),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                        ),

                        onPressed:
                            travelModeEnabled ? _startTimer : null,

                        child: const Text(
                          'Start Safety Timer',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Emergency Protection Card
            Card(
              color: AppColors.surface,
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Emergency Protection',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'If you feel unsafe, use the emergency actions '
                      'to quickly activate protection.',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,

                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(
                            color: AppColors.primary,
                          ),
                        ),

                        onPressed: travelModeEnabled
                            ? _openEmergencyActions
                            : null,

                        child: const Text(
                          'Emergency Actions',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
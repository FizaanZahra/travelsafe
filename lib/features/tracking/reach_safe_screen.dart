import 'dart:async';
import 'package:flutter/material.dart';

class ReachSafeScreen extends StatefulWidget {
  const ReachSafeScreen({super.key});

  @override
  State<ReachSafeScreen> createState() => _ReachSafeScreenState();
}

class _ReachSafeScreenState extends State<ReachSafeScreen> {
  int remainingSeconds = 18 * 60; // 18 minutes default
  Timer? _timer;
  bool isTimerRunning = true;
  String destination = 'Home (124 Elm Street)';
  bool autoAlertGuardians = true;
  bool reachedSafely = false;
  bool isDuressTriggered = false;

  // Secret passcode settings
  final String secretPasscode = '1234';
  final String duressPasscode = '9999';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0 && isTimerRunning) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get formattedTime {
    final minutes = (remainingSeconds / 60).floor();
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Passcode verification modal
  void _showPasscodeDialog(BuildContext context) {
    final TextEditingController pinController = TextEditingController();
    String errorMsg = '';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF1E293B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.white24),
              ),
              title: const Row(
                children: [
                  Icon(Icons.lock_outline, color: Colors.amberAccent, size: 24),
                  SizedBox(width: 10),
                  Text(
                    'Security Passcode',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter your secret 4-digit PIN to verify you have reached safely and disarm tracking.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 8,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: '••••',
                      hintStyle: const TextStyle(color: Colors.white24),
                      filled: true,
                      fillColor: Colors.black38,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  if (errorMsg.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      errorMsg,
                      style: const TextStyle(
                          color: Colors.redAccent, fontSize: 12),
                    ),
                  ],
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white54)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final enteredPin = pinController.text.trim();
                    if (enteredPin == secretPasscode) {
                      Navigator.pop(dialogContext);
                      setState(() {
                        reachedSafely = true;
                        isTimerRunning = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                              '✅ Passcode verified! Travel tracking disarmed.'),
                        ),
                      );
                    } else if (enteredPin == duressPasscode) {
                      // Silent Duress Trigger
                      Navigator.pop(dialogContext);
                      setState(() {
                        reachedSafely = true;
                        isTimerRunning = false;
                        isDuressTriggered = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red.shade900,
                          content: const Text(
                              '🚨 Silent Duress Signal Broadcasted secretly to Police & Guardians!'),
                        ),
                      );
                    } else {
                      setDialogState(() {
                        errorMsg = 'Incorrect PIN! Disarm denied.';
                      });
                    }
                  },
                  child: const Text('Verify & Disarm',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Panic Hardware Gesture Simulator
  void _showPanicHardwareWindow(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0F172A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.warning_amber_rounded,
                        color: Colors.redAccent, size: 28),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HARDWARE PANIC GESTURE TRIGGERED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Detected: Power Key (x1) + Vol Up/Down (x2)',
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🚨 EMERGENCY MODE ACTIVATED DISCRETELY',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '• Screen off background trigger activated\n• Live GPS stream broadcasting to guardians\n• Audio ambient recording started silently\n• Police control room alerted',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade700,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.check_circle),
                label: const Text('ACKNOWLEDGE ALARM'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Status Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: reachedSafely
                    ? [Colors.green.shade900, Colors.teal.shade800]
                    : [const Color(0xFF1E1B4B), const Color(0xFF312E81)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: reachedSafely
                      ? Colors.greenAccent
                      : Colors.indigoAccent.withValues(alpha: 0.4)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          reachedSafely
                              ? Icons.verified
                              : Icons.health_and_safety,
                          color: reachedSafely
                              ? Colors.greenAccent
                              : Colors.indigoAccent,
                          size: 26,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          reachedSafely ? 'REACHED SAFELY' : 'TRAVEL MODE ACTIVE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lock, color: Colors.amberAccent, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            reachedSafely ? 'CLOSED' : 'PIN PROTECTED',
                            style: TextStyle(
                              color: reachedSafely
                                  ? Colors.greenAccent
                                  : Colors.amberAccent,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Countdown Timer Display
                Text(
                  formattedTime,
                  style: TextStyle(
                    color: reachedSafely
                        ? Colors.greenAccent
                        : (remainingSeconds < 300
                            ? Colors.redAccent
                            : Colors.white),
                    fontSize: 54,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'monospace',
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  reachedSafely
                      ? (isDuressTriggered
                          ? '🚨 Disarmed with silent duress code. Police notified.'
                          : 'Safety check-in verified with secret PIN. Guardians notified.')
                      : 'Time remaining to verify arrival at $destination',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 20),

                // Action Buttons
                if (!reachedSafely) ...[
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.shade700,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () => _showPasscodeDialog(context),
                    icon: const Icon(Icons.lock_open, size: 24),
                    label: const Text(
                      'I HAVE ARRIVED SAFELY (PIN REQUIRED)',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white24),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              remainingSeconds += 10 * 60;
                            });
                          },
                          icon: const Icon(Icons.add_alarm, size: 18),
                          label: const Text('+10 Mins'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.redAccent,
                            side: const BorderSide(color: Colors.redAccent),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () => _showPasscodeDialog(context),
                          icon: const Icon(Icons.cancel_outlined, size: 18),
                          label: const Text('Cancel (PIN)'),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Android Lock Screen & Media Controls Feature Demonstration
          const Text(
            'Android Media Service & Hardware Key Controls',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Runs silently when screen is locked/off (like Spotify background media controls)',
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 12),

          // Media Controls Lock Screen Preview Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.cyanAccent.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.android, color: Colors.greenAccent, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Lock Screen Controls (Media Session)',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Background Service Active',
                        style: TextStyle(color: Colors.greenAccent, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Simulated Lockscreen Media Controls Player
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.shield, color: Colors.redAccent, size: 22),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Travel Safety Guard Active',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            Text(
                              'Screen Off Hotkey Listener Active',
                              style: TextStyle(color: Colors.white54, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.warning, color: Colors.redAccent),
                        onPressed: () => _showPanicHardwareWindow(context),
                        tooltip: 'Trigger Emergency via Media Key',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Hardware Combo Button Simulator
                GestureDetector(
                  onTap: () => _showPanicHardwareWindow(context),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple.shade900, Colors.indigo.shade900],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.purpleAccent),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.touch_app, color: Colors.purpleAccent, size: 24),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SIMULATE HARDWARE PANIC GESTURE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Text(
                                'Press Power (x1) + Vol Up/Down (x2) simultaneously',
                                style: TextStyle(
                                    color: Colors.purpleAccent, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Security Features Summary
          _buildSettingTile(
            title: 'Secret Passcode (PIN)',
            subtitle: 'Default: 1234 (Required to disarm Travel Mode)',
            icon: Icons.key_outlined,
            trailing: const Text('Configured',
                style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
          ),
          const SizedBox(height: 10),

          _buildSettingTile(
            title: 'Silent Duress Code',
            subtitle: 'Default: 9999 (Fake disarm + secret police alert)',
            icon: Icons.security_outlined,
            trailing: const Text('Active',
                style: TextStyle(color: Colors.amberAccent, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigoAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.indigoAccent, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

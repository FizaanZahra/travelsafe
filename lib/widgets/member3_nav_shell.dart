import 'package:flutter/material.dart';
import '../features/tracking/live_tracking_screen.dart';
import '../features/tracking/reach_safe_screen.dart';
import '../features/tracking/police_status_screen.dart';
import '../features/journey/journey_history_screen.dart';
import '../features/evidence/evidence_vault_screen.dart';
import '../features/volunteers/volunteer_ui_screen.dart';

class SafetyNavigationShell extends StatefulWidget {
  const SafetyNavigationShell({super.key});

  @override
  State<SafetyNavigationShell> createState() => _SafetyNavigationShellState();
}

class _SafetyNavigationShellState extends State<SafetyNavigationShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    LiveTrackingScreen(),
    ReachSafeScreen(),
    PoliceStatusScreen(),
    JourneyHistoryScreen(),
    EvidenceVaultScreen(),
    VolunteerUiScreen(),
  ];

  final List<String> _titles = const [
    'Live Tracking',
    'Reach Safe Check-In',
    'Police Dispatch UI',
    'Journey History',
    'Evidence Vault',
    'Volunteer Network',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F19),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _titles[_currentIndex],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Safety & Tracking System',
              style: TextStyle(color: Colors.cyanAccent, fontSize: 11),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.greenAccent),
            ),
            child: const Row(
              children: [
                Icon(Icons.shield, color: Colors.greenAccent, size: 14),
                SizedBox(width: 4),
                Text(
                  'Module Active',
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white12)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xFF0F172A),
          selectedItemColor: Colors.cyanAccent,
          unselectedItemColor: Colors.white38,
          selectedFontSize: 11,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.radar),
              label: 'Tracking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined),
              label: 'Reach Safe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_police_outlined),
              label: 'Police UI',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off),
              label: 'Journey',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_outline),
              label: 'Vault',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: 'Volunteers',
            ),
          ],
        ),
      ),
    );
  }
}

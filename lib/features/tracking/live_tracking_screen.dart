import 'package:flutter/material.dart';

class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({super.key});

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  bool isSharingLiveLocation = true;
  bool isSosActive = false;
  double speedKmh = 24.5;
  String currentStatus = 'En Route to Home';
  String etaTime = '12 mins';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Header Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSharingLiveLocation
                        ? Colors.greenAccent.withValues(alpha: 0.2)
                        : Colors.amberAccent.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isSharingLiveLocation ? Icons.radar : Icons.radar_outlined,
                    color: isSharingLiveLocation
                        ? Colors.greenAccent
                        : Colors.amberAccent,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentStatus,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isSharingLiveLocation
                            ? 'Live GPS Beacon Broadcast Active • High Precision'
                            : 'Location Sharing Paused',
                        style: TextStyle(
                          color: isSharingLiveLocation
                              ? Colors.greenAccent
                              : Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: isSharingLiveLocation,
                  activeTrackColor: Colors.greenAccent,
                  onChanged: (val) {
                    setState(() {
                      isSharingLiveLocation = val;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Map & Route View Box (Simulated Map Canvas)
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: const Color(0xFF090D16),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white10),
            ),
            child: Stack(
              children: [
                // Grid background simulation
                Positioned.fill(
                  child: CustomPaint(
                    painter: GridMapPainter(),
                  ),
                ),

                // Simulated Map Route Overlay
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.speed, color: Colors.cyanAccent, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          '${speedKmh.toStringAsFixed(1)} km/h',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.timer_outlined,
                            color: Colors.amberAccent, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'ETA: $etaTime',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                // Center Pin Info
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.withValues(alpha: 0.5),
                              blurRadius: 16,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        child: const Icon(Icons.navigation,
                            color: Colors.blueAccent, size: 30),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '7th Avenue & Main St',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Emergency SOS Quick Trigger Button
          GestureDetector(
            onTap: () {
              setState(() {
                isSosActive = !isSosActive;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isSosActive
                      ? [Colors.red.shade900, Colors.redAccent.shade700]
                      : [Colors.redAccent.shade400, Colors.deepOrangeAccent],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withValues(alpha: 0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.white, size: 36),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isSosActive
                              ? '🚨 SOS BROADCAST ACTIVE'
                              : 'EMERGENCY SOS',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isSosActive
                              ? 'Emergency services & guardians notified'
                              : 'Tap to instantly broadcast live location to guardians',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isSosActive ? Icons.check_circle : Icons.chevron_right,
                    color: Colors.white,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Trusted Guardians Watching Live
          const Text(
            'Trusted Guardians (3 Online)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              _buildGuardianTile('Sarah (Mom)', 'Viewing live location',
                  '2m ago', true, Icons.person),
              const SizedBox(height: 8),
              _buildGuardianTile('David (Brother)', 'Received location ping',
                  '5m ago', true, Icons.person_3),
              const SizedBox(height: 8),
              _buildGuardianTile('Emergency Contacts Group', 'Monitoring active',
                  'Now', true, Icons.group),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuardianTile(String name, String status, String time,
      bool isOnline, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent.withValues(alpha: 0.2),
            child: Icon(icon, color: Colors.blueAccent, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  status,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isOnline ? Colors.greenAccent : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      color: isOnline ? Colors.greenAccent : Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: const TextStyle(color: Colors.white38, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GridMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent.withValues(alpha: 0.08)
      ..strokeWidth = 1;

    const step = 25.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final routePaint = Paint()
      ..color = Colors.cyanAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(30, size.height - 30)
      ..quadraticBezierTo(
          size.width * 0.4, size.height * 0.3, size.width * 0.5, size.height * 0.5)
      ..lineTo(size.width - 40, 40);

    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

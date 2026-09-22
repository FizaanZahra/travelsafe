import 'package:flutter/material.dart';

class PoliceStatusScreen extends StatefulWidget {
  const PoliceStatusScreen({super.key});

  @override
  State<PoliceStatusScreen> createState() => _PoliceStatusScreenState();
}

class _PoliceStatusScreenState extends State<PoliceStatusScreen> {
  String dispatchState = 'En Route';
  String unitName = 'Patrol Unit #402';
  String officerName = 'Officer R. Miller';
  String policeEta = '4 mins';
  double unitDistanceKm = 1.2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Emergency Header Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue.shade400.withValues(alpha: 0.5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade900.withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade400.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.local_police,
                              color: Colors.blueAccent, size: 28),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'POLICE DISPATCH UI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                            Text(
                              'Incident ID: #POL-99412',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.redAccent),
                      ),
                      child: const Text(
                        'PRIORITY 1 - HIGH',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Unit Progress Meter
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dispatch Status',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 12),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              dispatchState.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$unitName ($officerName)',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'ETA',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 10),
                            ),
                            Text(
                              policeEta,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${unitDistanceKm.toStringAsFixed(1)} km away',
                              style: const TextStyle(
                                  color: Colors.white38, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Direct Call Police Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.call, size: 20),
                  label: const Text(
                    'CALL POLICE CONTROL ROOM (112)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Dispatch Timeline
          const Text(
            'Live Dispatch Timeline',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          _buildTimelineItem(
            time: '22:12',
            title: 'Unit Assigned & Dispatched',
            description: 'Patrol Unit #402 assigned to incident coordinates',
            isDone: true,
            isCurrent: true,
          ),
          _buildTimelineItem(
            time: '22:10',
            title: 'SOS Alert Trigger Received',
            description: 'Automated GPS beacon & telemetry logged by station',
            isDone: true,
            isCurrent: false,
          ),
          _buildTimelineItem(
            time: '22:09',
            title: 'Emergency Signal Initiated',
            description: 'Triggered via Flutter Safety Client',
            isDone: true,
            isCurrent: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String time,
    required String title,
    required String description,
    required bool isDone,
    required bool isCurrent,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isCurrent
                      ? Colors.cyanAccent
                      : (isDone ? Colors.blueAccent : Colors.grey),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isCurrent ? Colors.white : Colors.transparent,
                      width: 2),
                ),
              ),
              Container(
                width: 2,
                height: 40,
                color: Colors.white12,
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isCurrent
                    ? const Color(0xFF1E293B)
                    : const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: isCurrent ? Colors.cyanAccent.withValues(alpha: 0.3) : Colors.white12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isCurrent ? Colors.cyanAccent : Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white60, fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

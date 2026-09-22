import 'package:flutter/material.dart';

class JourneyHistoryScreen extends StatefulWidget {
  const JourneyHistoryScreen({super.key});

  @override
  State<JourneyHistoryScreen> createState() => _JourneyHistoryScreenState();
}

class _JourneyHistoryScreenState extends State<JourneyHistoryScreen> {
  final List<Map<String, dynamic>> journeys = [
    {
      'date': 'Today, 9:15 PM',
      'from': 'Downtown Library',
      'to': 'Home (124 Elm St)',
      'mode': 'Walking',
      'duration': '18 min',
      'distance': '1.4 km',
      'safetyRating': '100% Safe',
      'safetyColor': Colors.greenAccent,
      'guardiansWatched': 2,
    },
    {
      'date': 'Yesterday, 10:30 PM',
      'from': 'Tech Park North',
      'to': 'Home',
      'mode': 'Cab / Taxi',
      'duration': '25 min',
      'distance': '8.2 km',
      'safetyRating': '98% Safe',
      'safetyColor': Colors.greenAccent,
      'guardiansWatched': 3,
    },
    {
      'date': '18 Sep, 8:45 PM',
      'from': 'Metro Station East',
      'to': 'University Campus',
      'mode': 'Subway + Walking',
      'duration': '32 min',
      'distance': '5.6 km',
      'safetyRating': 'Deviated Route Alerted',
      'safetyColor': Colors.amberAccent,
      'guardiansWatched': 1,
    },
    {
      'date': '15 Sep, 11:10 PM',
      'from': 'Central Plaza Mall',
      'to': 'Home',
      'mode': 'Cab / Taxi',
      'duration': '22 min',
      'distance': '7.1 km',
      'safetyRating': '100% Safe',
      'safetyColor': Colors.greenAccent,
      'guardiansWatched': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stat Summary Cards Row
          Row(
            children: [
              _buildStatCard('Total Trips', '42', Icons.map_outlined, Colors.blueAccent),
              const SizedBox(width: 10),
              _buildStatCard('Safety Score', '99%', Icons.shield_outlined, Colors.greenAccent),
              const SizedBox(width: 10),
              _buildStatCard('Distance', '184 km', Icons.straighten_outlined, Colors.cyanAccent),
            ],
          ),
          const SizedBox(height: 24),

          // Journey History Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Journey Logs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 16, color: Colors.blueAccent),
                label: const Text('Export GPX/JSON', style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Journeys List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: journeys.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final trip = journeys[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              trip['mode'].toString().contains('Cab')
                                  ? Icons.local_taxi
                                  : Icons.directions_walk,
                              color: Colors.cyanAccent,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              trip['date'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: (trip['safetyColor'] as Color).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            trip['safetyRating'],
                            style: TextStyle(
                              color: trip['safetyColor'],
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Route details
                    Row(
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.circle, color: Colors.greenAccent, size: 10),
                            SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                  color: Colors.white24, thickness: 1),
                            ),
                            Icon(Icons.location_on, color: Colors.redAccent, size: 12),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trip['from'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                trip['to'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${trip['duration']} • ${trip['distance']}',
                              style: const TextStyle(
                                  color: Colors.white60, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.remove_red_eye,
                                    color: Colors.white38, size: 14),
                                const SizedBox(width: 4),
                                Text(
                                  '${trip['guardiansWatched']} guardians monitored',
                                  style: const TextStyle(
                                      color: Colors.white38, fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

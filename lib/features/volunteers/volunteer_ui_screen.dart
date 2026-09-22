import 'package:flutter/material.dart';

class VolunteerUiScreen extends StatefulWidget {
  const VolunteerUiScreen({super.key});

  @override
  State<VolunteerUiScreen> createState() => _VolunteerUiScreenState();
}

class _VolunteerUiScreenState extends State<VolunteerUiScreen> {
  bool isVolunteerModeActive = false;
  bool isEmergencyPingSent = false;

  final List<Map<String, dynamic>> nearbyVolunteers = [
    {
      'name': 'Alex Rivera',
      'role': 'Verified Community Responder',
      'distance': '350 meters away',
      'eta': '~2 mins',
      'badge': 'CPR Certified',
      'rating': '4.9 ★',
      'avatarColor': Colors.purpleAccent,
    },
    {
      'name': 'Priya Sharma',
      'role': 'Neighborhood Watch Lead',
      'distance': '600 meters away',
      'eta': '~4 mins',
      'badge': 'First Responder',
      'rating': '5.0 ★',
      'avatarColor': Colors.tealAccent,
    },
    {
      'name': 'Marcus Vance',
      'role': 'Active Volunteer Patrol',
      'distance': '850 meters away',
      'eta': '~5 mins',
      'badge': 'Verified Resident',
      'rating': '4.8 ★',
      'avatarColor': Colors.amberAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Volunteer Network Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B0764), Color(0xFF1E1B4B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.purpleAccent.withValues(alpha: 0.4)),
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
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.people_alt,
                              color: Colors.purpleAccent, size: 26),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VOLUNTEER SAFETY NETWORK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              '8 Verified Responders Active Nearby',
                              style: TextStyle(
                                  color: Colors.purpleAccent, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Quick Ping Volunteers Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEmergencyPingSent
                        ? Colors.amber.shade700
                        : Colors.purpleAccent.shade700,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isEmergencyPingSent = !isEmergencyPingSent;
                    });
                  },
                  icon: Icon(
                    isEmergencyPingSent ? Icons.check : Icons.rss_feed,
                    size: 22,
                  ),
                  label: Text(
                    isEmergencyPingSent
                        ? 'PING SENT TO 8 VOLUNTEERS'
                        : 'ALERT NEARBY VOLUNTEERS',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Become a Volunteer Toggle Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.volunteer_activism,
                      color: Colors.amberAccent, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Volunteer Mode',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isVolunteerModeActive
                            ? 'You are active to receive safety alerts'
                            : 'Receive safety notifications from nearby users',
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: isVolunteerModeActive,
                  activeTrackColor: Colors.purpleAccent,
                  onChanged: (val) {
                    setState(() {
                      isVolunteerModeActive = val;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Active Responders List
          const Text(
            'Active Responders Nearby (< 1 km)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: nearbyVolunteers.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final volunteer = nearbyVolunteers[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          (volunteer['avatarColor'] as Color).withValues(alpha: 0.2),
                      child: Text(
                        volunteer['name'][0],
                        style: TextStyle(
                          color: volunteer['avatarColor'] as Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                volunteer['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  volunteer['badge'],
                                  style: const TextStyle(
                                      color: Colors.amberAccent, fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${volunteer['distance']} • ${volunteer['eta']} response',
                            style: const TextStyle(
                                color: Colors.white60, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purpleAccent,
                        side: const BorderSide(color: Colors.purpleAccent),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Ping Direct',
                          style: TextStyle(fontSize: 12)),
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
}

import 'package:flutter/material.dart';

class EvidenceVaultScreen extends StatefulWidget {
  const EvidenceVaultScreen({super.key});

  @override
  State<EvidenceVaultScreen> createState() => _EvidenceVaultScreenState();
}

class _EvidenceVaultScreenState extends State<EvidenceVaultScreen> {
  bool isAutoRecordOnEmergencyEnabled = true;

  final List<Map<String, dynamic>> evidenceItems = [
    {
      'title': 'Emergency Ambient Audio #EVD-881',
      'type': 'Audio Recording',
      'duration': '04:12 mins',
      'date': '21 Sep 2026, 10:14 PM',
      'size': '4.2 MB',
      'hash': 'sha256: 9f8a...c3d1',
      'icon': Icons.mic,
      'color': Colors.redAccent,
      'isCloudSynced': true,
    },
    {
      'title': 'Front Camera Dash Clip #EVD-880',
      'type': '1080p Video Clip',
      'duration': '01:45 mins',
      'date': '18 Sep 2026, 08:47 PM',
      'size': '28.5 MB',
      'hash': 'sha256: a41b...e8f2',
      'icon': Icons.videocam,
      'color': Colors.blueAccent,
      'isCloudSynced': true,
    },
    {
      'title': 'Automated GPS & Incident Telemetry',
      'type': 'Encrypted Log File',
      'duration': 'Log Sheet',
      'date': '15 Sep 2026, 11:12 PM',
      'size': '512 KB',
      'hash': 'sha256: 77d2...f90e',
      'icon': Icons.description,
      'color': Colors.amberAccent,
      'isCloudSynced': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Security Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF064E3B), Color(0xFF022C22)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.teal.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.lock, color: Colors.tealAccent, size: 28),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ENCRYPTED EVIDENCE VAULT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'AES-256 Bit Encryption • Cloud Immutability Active',
                        style: TextStyle(color: Colors.tealAccent, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Auto-Record Toggle Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.disc_full_outlined, color: Colors.redAccent, size: 22),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Auto-Record on SOS',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          'Captures audio & camera on emergency trigger',
                          style: TextStyle(color: Colors.white60, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
                Switch(
                  value: isAutoRecordOnEmergencyEnabled,
                  activeTrackColor: Colors.redAccent,
                  onChanged: (val) {
                    setState(() {
                      isAutoRecordOnEmergencyEnabled = val;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Files Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Stored Incident Evidence',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '3 Items • 33.2 MB',
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: evidenceItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = evidenceItems[index];
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
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (item['color'] as Color).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(item['icon'] as IconData,
                              color: item['color'] as Color, size: 24),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${item['type']} • ${item['duration']} • ${item['size']}',
                                style: const TextStyle(
                                    color: Colors.white60, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.play_circle_fill,
                              color: Colors.greenAccent, size: 30),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white12, height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.cloud_done,
                                color: Colors.tealAccent, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              item['date'],
                              style: const TextStyle(
                                  color: Colors.white38, fontSize: 11),
                            ),
                          ],
                        ),
                        Text(
                          item['hash'],
                          style: const TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontFamily: 'monospace'),
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
}

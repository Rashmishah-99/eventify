import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Personal Information",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.purple),
            onPressed: () {
              // Navigate to edit page or show dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Edit profile clicked")),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text("Profile Photo", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            /// Basic Information
            _buildInfoCard(
              title: "Basic Information",
              icon: Icons.person_outline,
              children: const [
                _buildInfoRow("Full Name", "Anaya Sharma"),
                _buildInfoRow("Email", "sharmaanaya78@gmail.com"),
                _buildInfoRow("Phone Number", "+91 98765 43210"),
              ],
            ),
            const SizedBox(height: 16),

            /// Location & Contact
            _buildInfoCard(
              title: "Location & Contact",
              icon: Icons.location_on_outlined,
              children: [
                const _buildInfoRow("Location", "Delhi, India"),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.pink,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text("@anaya893"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text("Anaya Sharma"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Account Settings
            _buildInfoCard(
              title: "Account Settings",
              icon: Icons.email_outlined,
              children: [
                Row(
                  children: [
                    const Text("Account Type: "),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Client",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const _buildInfoRow("Member Since", "July 2025"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Info Card Widget
  static Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.purple),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.blueAccent),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

/// Reusable Info Row Widget
class _buildInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _buildInfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}

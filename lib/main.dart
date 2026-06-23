import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Profile Card",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String name = "John Doe";
  static const String profession = "Flutter Developer";
  static const String bio =
      "Passionate about creating user-friendly and engaging digital experiences.";
  static const String email = "john.doe@example.com";
  static const String phone = "+123 456 7890";

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.person, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text('Profile Details'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dialogDetailRow(Icons.badge_outlined, 'Name', name),
              const SizedBox(height: 12),
              _dialogDetailRow(Icons.work_outline, 'Profession', profession),
              const SizedBox(height: 12),
              _dialogDetailRow(Icons.email_outlined, 'Email', email),
              const SizedBox(height: 12),
              _dialogDetailRow(Icons.phone_outlined, 'Phone', phone),
              const SizedBox(height: 12),
              _dialogDetailRow(Icons.info_outline, 'Bio', bio),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Widget _dialogDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _showProfileDialog(context),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.blueGrey,
                          backgroundImage: const AssetImage(
                            'assets/images/avatar.jpg',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        profession,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        bio,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      const SizedBox(height: 16),

                      _contactRow(Icons.email, email),
                      const SizedBox(height: 10),
                      _contactRow(Icons.phone, phone),
                      const SizedBox(height: 24),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          children: [
                            const Expanded(child: FollowButton()),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                child: const Text(
                                  'Message',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  SizedBox(width: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Interests",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: InterestCard(
                      imagePath: 'assets/images/beach.jpg',
                      title: "Travel",
                      description: 'Exploring new places around the world',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: InterestCard(
                      imagePath: 'assets/images/dslr.jpg',
                      title: 'Photography',
                      description: 'Capturing moments through the lens',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing = false;

  void _handleFollowTap() {
    setState(() {
      _isFollowing = !_isFollowing;
    });

    final message = _isFollowing
        ? 'You are now following John Doe'
        : 'You unfollowed John Doe';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleFollowTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: _isFollowing
            ? Colors.grey.shade300
            : Colors.blueAccent,
        foregroundColor: _isFollowing ? Colors.black87 : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: _isFollowing ? 0 : 2,
      ),
      child: Text(
        _isFollowing ? 'Following' : "Follow",
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class InterestCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const InterestCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  void _handleViewMore(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title - View More Tapped'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),

                Text(description, style: const TextStyle(fontSize: 11)),

                const SizedBox(height: 4),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _handleViewMore(context),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      side: const BorderSide(width: 0.5, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      "View More",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

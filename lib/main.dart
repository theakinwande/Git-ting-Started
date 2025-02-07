import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git-ting Started',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // URLs to open
  final String githubRepo = 'https://github.com/yourusername/Git-ting-Started';
  final String hngHire = 'https://hng.tech/hire/flutter-developers';
  final String telex = 'https://telex.im';
  final String delve = 'https://delve.fun';

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Git-ting Started'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GitHub Repository Button
            _buildButton(
              text: 'GitHub Repository',
              icon: Icons.code,
              onPressed: () => _launchURL(githubRepo),
            ),
            // HNG Hire Button
            _buildButton(
              text: 'HNG Hire Flutter Devs',
              icon: Icons.work,
              onPressed: () => _launchURL(hngHire),
            ),
            // Telex Button
            _buildButton(
              text: 'Telex',
              icon: Icons.chat,
              onPressed: () => _launchURL(telex),
            ),
            // Delve Button
            _buildButton(
              text: 'Delve',
              icon: Icons.explore,
              onPressed: () => _launchURL(delve),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable button widget
  Widget _buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(text),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}

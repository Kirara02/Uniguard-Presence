import 'package:flutter/material.dart';
import 'package:unipres/presentation/pages/profile/section/profile_item.dart';

class FaceRecognition extends StatelessWidget {
  const FaceRecognition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Recognition'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ProfileItem(
            title: 'Register Face',
            icon: const Icon(Icons.add_a_photo),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const RegisterFacePage(),
              //   ),
              // );
            },
          ),
          ProfileItem(
            title: 'Scan Face (Verify Face)',
            icon: const Icon(Icons.verified_user),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ScanFacePage(),
              //   ),
              // );
            },
          ),
          ProfileItem(
            title: 'Update Face Data',
            icon: const Icon(Icons.update),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const UpdateFacePage(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}

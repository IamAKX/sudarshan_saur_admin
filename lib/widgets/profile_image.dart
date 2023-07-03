import 'package:flutter/material.dart';

import '../utils/theme.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(settingsPageUserIconSize),
          child: Image.asset(
            'assets/images/dummy_user.jpg',
            height: 110,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

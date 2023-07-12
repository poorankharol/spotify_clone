import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    }
    if (hour < 17) {
      return 'Good afternoon';
    }
    return 'Good evening';
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          greeting(),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        const Expanded(child: SizedBox()),
        const Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 15,
        ),
        const Icon(
          Icons.history_outlined,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 15,
        ),
        const Icon(
          Icons.settings_outlined,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}

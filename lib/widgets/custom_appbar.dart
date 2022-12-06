import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressedIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressedIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 26),
        ),
        CustomAppBarIcon(
          icon: icon,
          onPressed: () {
            onPressedIcon();
          },
        ),
      ],
    );
  }
}

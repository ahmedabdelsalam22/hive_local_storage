import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CustomAppBarIcon(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
        //TODO:
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white12),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}

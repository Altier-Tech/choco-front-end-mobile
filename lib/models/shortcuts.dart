import 'package:flutter/material.dart';

class CircleShortcut extends StatelessWidget {
  final String name;
  final String imagePath;
  final Color circleColor; // New parameter for circle color
  final Color textColor;  // New parameter for text color

  CircleShortcut({
    required this.name,
    required this.imagePath,
    this.circleColor = Colors.blue, // Default circle color
    this.textColor = Colors.black, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor, // Use the provided circle color
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(color: textColor), // Use the provided text color
        ),
      ],
    );
  }
}

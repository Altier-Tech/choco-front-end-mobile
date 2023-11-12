import 'package:flutter/material.dart';

class CircleShortcut extends StatelessWidget {
  final String name;
  final String imageUrl;

  CircleShortcut({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50, // Adjust the size as needed
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue, // You can set your own color
          ),
          // You can add your icon or text or any widget inside the circle
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(height: 8), // Adjust spacing between circle and name
        Text(name),
      ],
    );
  }
}
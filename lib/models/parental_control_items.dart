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
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/$imageUrl'), // Update this line
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Text(name),
        )
      ],
    );
  }
}

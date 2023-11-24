import 'package:flutter/material.dart';

class CircleShortcut extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color circleColor; // New parameter for circle color
  final VoidCallback onTap; // Callback to handle onTap event

  const CircleShortcut({
    super.key,
    required this.name,
    required this.imageUrl,
    this.circleColor = Colors.blue, // Default color is set to blue
    required this.onTap, // Callback is required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor, // Use the provided circle color
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/$imageUrl'),
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(
            height: 8,
            width: 2,
          ),
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}

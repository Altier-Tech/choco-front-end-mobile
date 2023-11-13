import 'package:flutter/material.dart';

import '../models/parental_control_items.dart';

class ParentalControl extends StatefulWidget {
  const ParentalControl({Key? key}) : super(key: key);

  @override
  State<ParentalControl> createState() => _ParentalControlState();
}

class _ParentalControlState extends State<ParentalControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parental Control"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue, // Set the border color
                    width: 3.0, // Set the border width
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/safe_browsing.jpg', // replace with the path to your image in the assets folder
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleShortcut(name: "Block/Unblock\nSites", imageUrl: 'block sites.svg',),
                  CircleShortcut(name: "Choco\nChat", imageUrl: 'chat.png'),
                  CircleShortcut(name: "Intelligent\nService", imageUrl: 'intelligent_img.png'),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleShortcut(name: "Choco\nEngine", imageUrl: 'Choco_engine_img.png',),
                  CircleShortcut(name: "Setup Child\nProfile", imageUrl: 'child_profile_img.png'),
                  CircleShortcut(name: "Browser\nSettings", imageUrl: 'browser_settings_img.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

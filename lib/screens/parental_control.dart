import 'package:choco/chat/chat_page.dart';
import 'package:choco/gpt/chat_api.dart';
import 'package:choco/screens/settings.dart';
import 'package:flutter/material.dart';

import '../models/parental_control_items.dart';
import 'block_site.dart';
import 'intelligent_service.dart';

class ParentalControl extends StatefulWidget {
  const ParentalControl({Key? key}) : super(key: key);

  @override
  State<ParentalControl> createState() => _ParentalControlState();
}

class _ParentalControlState extends State<ParentalControl> {
  ChatApi chatApi = ChatApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parental Control"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
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
            const Center(
              child: Text(
                "Protect your child online",
                style: TextStyle(color: Colors.purple, fontSize: 15),
              ),
            ),
            const Center(
              child: Text(
                "Safeguard their browsing experience\nand steer clear of unwanted content",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleShortcut(
                    name: "Block/Unblock\n         Sites",
                    imageUrl: 'block_sites.png',
                    circleColor: Colors.red,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SiteBlockerScreen(),
                        ),
                      );
                    },
                  ),
                  CircleShortcut(
                    name: "Choco\n Chat",
                    imageUrl: 'chat.png',
                    circleColor: Colors.black12,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(chatApi: chatApi),
                        ),
                      );
                    },
                  ),
                  CircleShortcut(
                    name: "Intelligent\n  Service",
                    imageUrl: 'intelligent_img.png',
                    circleColor: Colors.greenAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IntelligentService(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleShortcut(
                    name: "Choco\nEngine",
                    imageUrl: 'Choco_engine_img.png',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => YourDestinationScreen(),
                      //   ),
                      // );
                    },
                  ),
                  CircleShortcut(
                    name: "Setup Child\n     Profile",
                    imageUrl: 'child_profile_img.png',
                    circleColor: Colors.yellow,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => YourDestinationScreen(),
                      //   ),
                      // );
                    },
                  ),
                  CircleShortcut(
                    name: "Browser\nSettings",
                    imageUrl: 'browser_settings_img.png',
                    circleColor: Colors.white38,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

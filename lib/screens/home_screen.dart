import 'package:choco/browser/webview_page.dart';

import 'package:choco/chat/chat_page.dart';
import 'package:choco/gpt/chat_api.dart';

import 'package:choco/screens/settings.dart';

import 'package:flutter/material.dart';

import '../models/shortcuts.dart';
import '../models/side_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ChatApi chatApi = ChatApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.filter_9_plus),
          //   onPressed: () {
          //     // Handle square icon tap
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SearchAnchor(builder:
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      //controller.openView();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BrowserPage()));
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChatPage(chatApi: chatApi)));
                        },
                        child: const Text(
                          'Choco Chat',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(chatApi: chatApi)));
                      },
                      child: Image.asset(
                        'assets/chat.png',
                        width: 90,
                      ),
                    )
                  ],
                ),
              ),

              const Divider(),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text("Favourite Websites"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleShortcut(
                      name: "YouTube",
                      imagePath: 'assets/youtube.png',
                      circleColor: Colors.white10,
                    ),
                    CircleShortcut(
                        name: "LMS",
                        imagePath: 'assets/moodle.png',
                      circleColor: Colors.white10,
                    ),
                    CircleShortcut(
                        name: "LinkedIn",
                        imagePath: 'assets/linkedin.png',
                      circleColor: Colors.white10,
                    ),
                    CircleShortcut(
                        name: "Sololearn",
                        imagePath: 'assets/sololearn.jpg',
                      circleColor: Colors.white10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleShortcut(
                      name: "Github",
                      imagePath: 'assets/github.png',
                      circleColor: Colors.white10,
                    ),
                    CircleShortcut(
                        name: "Translator",
                        imagePath: 'assets/google-translate.png',
                      circleColor: Colors.white10,
                    ),
                    CircleShortcut(
                        name: "Gmail",
                        imagePath: 'assets/gmail.png',
                      circleColor: Colors.white10,
                    ),
                    CircleShortcut(
                        name: "Cisco",
                        imagePath: 'assets/cisco.png',
                      circleColor: Colors.white10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

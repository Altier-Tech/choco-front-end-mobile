import 'package:choco/browser/webview_page.dart';
import 'package:choco/chat/chat_page.dart';
import 'package:choco/gpt/chat_api.dart';
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
          IconButton(
            icon: const Icon(Icons.filter_9_plus),
            onPressed: () {
              // Handle square icon tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle setting icon tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
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
                      imageUrl:
                          'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg',
                    ),
                    CircleShortcut(
                        name: "LMS",
                        imageUrl:
                            'https://companyurlfinder.com/marketing/assets/img/logos/moodle.com.png'),
                    CircleShortcut(
                        name: "LinkedIn",
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/640px-LinkedIn_logo_initials.png'),
                    CircleShortcut(
                        name: "Sololearn",
                        imageUrl:
                            'https://play-lh.googleusercontent.com/P6Ixu0T8hx2x80aCURUdcMW8poVuA4J0JQf8fw-XEa_NgzNSGUC1SNLkbT2ioo0lXfkC'),
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
                      imageUrl:
                          'https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png',
                    ),
                    CircleShortcut(
                        name: "Translator",
                        imageUrl:
                            'https://assets-global.website-files.com/5d70d85d6d5a384776dc97e4/5fa291d4798cac440f517c21_google%20translate.png'),
                    CircleShortcut(
                        name: "Gmail",
                        imageUrl:
                            'https://static.vecteezy.com/system/resources/previews/016/716/465/original/gmail-icon-free-png.png'),
                    CircleShortcut(
                        name: "Cisco",
                        imageUrl:
                            'https://itamchannel.com/wp-content/uploads/2015/02/Cisco-Logo.jpeg'),
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

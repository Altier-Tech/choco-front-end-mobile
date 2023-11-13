import 'package:flutter/material.dart';
import 'package:choco/screens/test_browser_page.dart';
import '../models/shortcuts.dart';
import '../models/side_navigation.dart';
import 'choco_chat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(

        actions: [
          IconButton(
            icon: Icon(Icons.filter_9_plus),
            onPressed: () {
              // Handle square icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle setting icon tap
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Image.asset('logo.png',width: 150,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        //controller.openView();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BrowserPage()));
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                  },
                  child: Text('Choco Chat',style: TextStyle(fontSize: 20),),
              ),
                ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                    },
                    child: Image.asset(
                      'assets/chat.png',
                      width: 90,
                    ),
                  )
                ],
              ),
            ),
            //Divider(),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleShortcut(name: "YouTube", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg',),
                CircleShortcut(name: "LMS", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg'),
                CircleShortcut(name: "LinkedIn", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg'),
                CircleShortcut(name: "Sololearn", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg'),
              ],
            ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleShortcut(name: "Github", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg',),
                  CircleShortcut(name: "Translator", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg'),
                  CircleShortcut(name: "Gmail", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg'),
                  CircleShortcut(name: "Cisco", imageUrl: 'https://www.state.gov/wp-content/uploads/2020/07/72-729738_youtube-red-circle-circle-youtube-logo-png-clipart.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

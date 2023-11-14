import 'package:choco/screens/bookmarks.dart';
import 'package:choco/screens/history.dart';
import 'package:flutter/material.dart';

import '../screens/downloads.dart';
import '../screens/parental_control.dart';
import '../screens/settings.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Thilina"),
            accountEmail: Text("tilinadilshan1999@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image(
                image: NetworkImage(
                    "https://mastimorning.com/wp-content/uploads/2023/09/dp-photos.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.shutterstock.com/image-vector/dark-red-blue-hexagon-abstract-260nw-2242545203.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text("Downloads"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Downloads()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_time_sharp),
            title: const Text("History"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const History()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Bookmarks"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bookmarks()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.indeterminate_check_box_outlined),
            title: const Text("Recent Tabs"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text("Parental Control"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ParentalControl()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Help & Feedback"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About Choco Browser"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

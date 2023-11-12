import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Thilina"),
                accountEmail: Text("tilinadilshan1999@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(image: NetworkImage("https://mastimorning.com/wp-content/uploads/2023/09/dp-photos.jpg"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage("https://www.shutterstock.com/image-vector/dark-red-blue-hexagon-abstract-260nw-2242545203.jpg"),
                  fit: BoxFit.cover,
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.download),
              title: Text("Downloads"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.access_time_sharp),
              title: Text("History"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Bookmarks"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.indeterminate_check_box_outlined),
              title: Text("Recent Tabs"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.shield),
              title: Text("Parental Control"),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Help & Feedback"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About Choco Browser"),
              onTap: (){},
            ),
          ],
        ),
    );
  }
}

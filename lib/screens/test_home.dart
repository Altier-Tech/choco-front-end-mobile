import 'package:flutter/material.dart';

import '../models/side_navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Your App Title'),
        actions: [
          IconButton(
            icon: Icon(Icons.square_foot),
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
       // Add this line to include the side navigation drawer
      //body: YourAppBody(),
    );
  }
}

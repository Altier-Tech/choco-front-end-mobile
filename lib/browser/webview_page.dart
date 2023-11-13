import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browser'),
      ),
      body: WebView(
        initialUrl: 'https://www.google.com',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          switch (value) {
            case 0:
              _controller.goBack();
              break;
            case 1:
              _controller.goForward();
              break;
            case 2:
              _controller.reload();
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back"),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward), label: "Forward"),
          BottomNavigationBarItem(
              icon: Icon(Icons.replay_outlined), label: "Reload"),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black54,
      ),
    );
  }
}

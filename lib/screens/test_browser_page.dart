import 'package:flutter/material.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({Key? key}) : super(key: key);

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  late TextEditingController textEditingController;
  //late WebViewController webViewController;

  String searchEngineUrl = "https://www.google.com/";
  bool isLoading = false;

  @override
  void initState() {
    textEditingController = TextEditingController(text: searchEngineUrl);
    // webViewController = WebViewController();
    // webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    // webViewController.setNavigationDelegate(NavigationDelegate(
    //   onPageStarted: (url){
    //     textEditingController.text = url;
    //     setState(() {
    //       isLoading = true;
    //     });
    //   },
    //   onPageFinished: (url){
    //     setState(() {
    //       isLoading = false;
    //     });
    //   },
    // ));
    loadUrl(textEditingController.text);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
            onWillPop: onWillPop,
            child: Scaffold(
              body: constColumn(
                children: [
                  _buildTopWidget(),
                  _buldLoadingWidget(),
                  Expanded(
                    child: _buildWebWidget(),
                  ),
                  _buildBottomWidget(),
                ],
              ),
            )));
  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }

  loadUrl(String value) {
    // Uri uri = Uri.parse(value);
    // if(!uri.isAbsolute){
    //   uri = Uri.parse("${searchEngineUrl}search?q=$value");
    // }
    // webViewController.loadRequest(uri);
  }

  _buildTopWidget() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                loadUrl(searchEngineUrl);
              },
              icon: const Icon(Icons.home),
            ),
            Expanded(
                child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search or type url",
              ),
              onSubmitted: (value) {
                loadUrl(value);
              },
            )),
            IconButton(
                onPressed: () {
                  textEditingController.clear();
                },
                icon: const Icon(Icons.cancel)),
          ],
        ),
      ),
    );
  }

  _buldLoadingWidget() {
    return Container(
      height: 2,
      color: Colors.grey,
      child: isLoading ? const LinearProgressIndicator() : Container(),
    );
  }

  _buildWebWidget() {
    return const Placeholder();
  }

  _buildBottomWidget() {
    return BottomNavigationBar(
      onTap: (value) {
        //TODO
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
    );
  }

  constColumn({required List children}) {}
}

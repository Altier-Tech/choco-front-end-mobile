import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _urlController,
          decoration: InputDecoration(hintText: 'Enter URL here...'),
          onSubmitted: (value) async {
            var url = Uri.tryParse(value);
            if (url != null &&
                (url.scheme == 'http' || url.scheme == 'https')) {
              var response = await http.head(url);
              if (response.statusCode >= 200 && response.statusCode < 400) {
                (await _controller.future).loadUrl(value);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("URL can't be loaded")),
                );
              }
            } else {
              String googleUrl = 'https://www.google.com/search?q=' +
                  Uri.encodeQueryComponent(value);
              (await _controller.future).loadUrl(googleUrl);
            }
          },
        ),
        actions: <Widget>[
          NavigationControls(_controller.future),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://flutter.dev',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageStarted: (_) {
              setState(() {});
            },
            onPageFinished: (_) {
              setState(() {});
            },
          ),
          FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady || controller == null
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        controller.goBack();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("No back history item")),
                        );
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady || controller == null
                  ? null
                  : () async {
                      if (await controller?.canGoForward() ?? false) {
                        controller?.goForward();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No forward history item")),
                        );
                      }
                    },
            ),
          ],
        );
      },
    );
  }
}

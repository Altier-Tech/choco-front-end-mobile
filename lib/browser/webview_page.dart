import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class BrowserPage extends StatefulWidget {
  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final TextEditingController _urlController = TextEditingController();

  var currentUrl = '';

  Future<String> readErrorPage() async {
    try {
      final contents = await rootBundle.loadString('assets/blocked_page.html');
      // print(contents);
      return contents;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _urlController,
          decoration: const InputDecoration(hintText: 'Enter URL here...'),
          onSubmitted: (value) async {
            var url = Uri.tryParse(value);
            if (url != null &&
                (url.scheme == 'http' || url.scheme == 'https')) {
              var response = await http.get(url);
              List<String> keywords = [
                "http://www.porhub.com/",
                "https://www.porhub.com/",
                "https://www.porhub.com"
              ];
              bool explicitContentDetected =
                  keywords.any((keyword) => (currentUrl == keyword));
              if (explicitContentDetected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Explicit content detected")),
                );
              } else {
                if (response.statusCode >= 200 && response.statusCode < 400) {
                  (await _controller.future).loadUrl(value);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("URL can't be loaded")),
                  );
                }
              }
            } else {
              String kiddleUrl = 'https://www.kiddle.co/s.php?q=' +
                  Uri.encodeQueryComponent(value);
              (await _controller.future).loadUrl(kiddleUrl);
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
            initialUrl: 'https://www.google.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            navigationDelegate: (NavigationRequest request) {
              Future<String> errorPage = readErrorPage();
              if (request.url == "https://www.pornhub.com/") {
                // Load the custom HTML content instead of the page HTML
                _controller.future.then((controller) async {
                  controller.loadUrl(Uri.dataFromString(
                    await errorPage,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'),
                  ).toString());

                  return NavigationDecision
                      .prevent; // Prevent the original URL loading
                });
              }
              return NavigationDecision
                  .navigate; // Allow the original URL loading
            },
            onPageStarted: (_) {
              setState(() {});
              currentUrl = _;
              Future<String> errorPage = readErrorPage();
              if (_ == "https://www.pornhub.com/") {
                // Load the custom HTML content instead of the page HTML
                _controller.future.then((controller) async {
                  controller.loadUrl(Uri.dataFromString(
                    await errorPage,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'),
                  ).toString());
                });
              }
            },
            onPageFinished: (_) {
              // if (_ == "https://www.pornhub.com/") {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text("Explicit content detected")),
              //   );
              // }
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

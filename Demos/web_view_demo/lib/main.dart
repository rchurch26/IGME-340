import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebViewPage(),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {},
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ));
    //..loadFlutterAsset("assets/documentation/index.html");
  //..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView Demo'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
            Tab(
              icon: Icon(Icons.ac_unit_sharp),
            ),
          ]),
        ),
        body: TabBarView(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
            child: const Center(
              child: Text("Tab 01"),
            ),
          ),
          tab02(),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellow,
            child: const Center(
              child: Text("Tab 03"),
            ),
          ),
        ]),
      ),
    );
  }

  Widget tab02() {
    return Center(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            controller.loadFlutterAsset("assets/documentation/index.html");
          },
          child: const Text("Go!"),
        ),
        Expanded(child: WebViewWidget(controller: controller)),
      ],
    ));
  }
}

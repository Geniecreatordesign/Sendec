// lib/home_page_mobile.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? htmlContent;

  @override
  void initState() {
    super.initState();
    loadHtml();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  Future<void> loadHtml() async {
    String fileHtmlContents = await rootBundle.loadString('assets/sendec.html');
    setState(() {
      htmlContent = fileHtmlContents;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (htmlContent == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Sendec Secure")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Sendec Secure")),
      body: WebView(
        initialUrl: Uri.dataFromString(
          htmlContent!,
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ).toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

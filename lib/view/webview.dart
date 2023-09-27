import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

//WebViewを表示するためのファイル
class SubPage extends StatefulWidget {
  final String url;
  final String login;
  const SubPage({Key? key, required this.url, required this.login})
      : super(key: key);
  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  void initState() {
    super.initState();
  }

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.login)),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            onLoadStop: (controller, url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

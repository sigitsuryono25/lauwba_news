import 'package:flutter/material.dart';
import 'package:lauwba_news/constant/Constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

String url;

class DetailNews extends StatelessWidget {
  String urls;

  DetailNews({Key key, @required this.urls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    url = this.urls;
    return MaterialApp(
      home: _DetailNewsHome(),
    );
  }
}

class _DetailNewsHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailNewsState();
  }
}

class _DetailNewsState extends State<_DetailNewsHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita"),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: WebView(
          initialUrl: Constant.READER_PATH + url,
        ),
      ),
    );
  }
}

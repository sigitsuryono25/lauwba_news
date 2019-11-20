import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lauwba_news/datamodel/listnews/ResponseNews.dart';
import 'package:lauwba_news/datamodel/listnews/data.dart';
import 'package:lauwba_news/retrofit/ApiService.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DetailNews.dart';
import 'Kelas.dart';

void main() => runApp(MainMenu());

class MainMenu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var news = new List<Data>();
  Color namaKategori;

  @override
  Widget build(BuildContext context) {
    _getNewsList(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: news.length ?? 0,
            itemBuilder: (BuildContext ctx, int index) {
              return GestureDetector(
                onTap: () => _detailNews(news[index].id),
                child: Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: 85.0,
                        alignment: Alignment.center,
                        child: Image.network(news[index].fotoNews),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(news[index].jdlNews,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(news[index].namaKategori,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  news[index].postOn,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openWhatsapp();
        },
        tooltip: 'Hubungi Kami',
        child: Icon(Icons.phone),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(""),
              accountName: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Pendaftaran"),
              trailing: Icon(
                Icons.local_library,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.of(context).pop();
                print("printed Dashboard");
              },
            ),
            Divider(
              color: Colors.grey[500],
            ),
            ListTile(
              title: Text("Dashboard"),
              trailing: Icon(Icons.dashboard),
              onTap: () {
                Navigator.of(context).pop();
                print("printed Dashboard");
              },
            ),
            ListTile(
              title: Text("Kelas"),
              trailing: Icon(Icons.class_),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Kelas()));
              },
            ),
            ListTile(
              title: Text("Portofolio"),
              trailing: Icon(Icons.all_inclusive),
              onTap: () {
                Navigator.of(context).pop();
                print("printed Dashboard");
              },
            ),
            ListTile(
              title: Text("News"),
              trailing: Icon(Icons.chrome_reader_mode),
              onTap: () {
                Navigator.of(context).pop();
                print("printed Dashboard");
              },
            ),
            Divider(
              color: Colors.grey[500],
            ),
            ListTile(
              title: Text("Keluar"),
              trailing: Icon(Icons.power_settings_new),
              onTap: () {
                Navigator.of(context).pop();
                print("printed Dashboard");
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openWhatsapp() async {
    const url =
        "https://api.whatsapp.com/send?phone=6282221777206&text=&source=&data=";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'can lauch this url';
    }
  }

  void _getNewsList(BuildContext context) async {
    final Dio dio = Dio();
    final client = ApiService(dio);
    client.getNews().then((it) => _setToView(it, context));
  }

  _setToView(ResponseNews r, BuildContext context) {
    if (r.error == 200) {
      setState(() {
        news = r.data;
      });
    } else {

    }
  }

  _detailNews(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailNews(
          urls: id,
        ),
      ),
    );
//  }
  }
}

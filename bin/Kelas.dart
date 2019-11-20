import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lauwba_news/datamodel/kelas/ResponseKelas.dart';
import 'package:lauwba_news/datamodel/kelas/data.dart';
import 'package:lauwba_news/retrofit/ApiService.dart';

void main() => runApp(Kelas());

class Kelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _KelasHome(),
    );
  }
}

class _KelasHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KelasState();
  }
}

class _KelasState extends State<_KelasHome> {
  var kelas = List<Data>();


  @override
  Widget build(BuildContext context) {
    _getKelas();
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelas"),
        leading: BackButton(),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: kelas.length ?? 0,
            itemBuilder: (BuildContext ctx, int index) {
              return GestureDetector(
                onTap: () => {},
                child: Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: 85.0,
                        alignment: Alignment.center,
                        child: Image.network(kelas[index].gambar),
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
                                child: Text(kelas[index].judul,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(kelas[index].harga,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
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
    );
  }

  void _getKelas() {
    final Dio dio = Dio();
    final client = ApiService(dio);
    client.getKelas().then((it) => _setToView(it));
  }



  _setToView(ResponseKelas it) {
    if (it.error == 200) {
      setState(() {
        kelas = it.data;
      });
    } else {}
  }
}

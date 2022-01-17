import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonget/Model/Album.dart';
import 'package:jsonget/service/AlbumApi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final AlbumApi albumApi = AlbumApi();

  late List<Album> allAlbum = [];

  Future<String?> getAllAlbum() async {
    var response = await albumApi.fetchAlbum();
    print(response);
    setState(() {
      List res = json.decode(response.body);
      allAlbum = res.map((album) => Album.fromJson(album)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
            itemCount: allAlbum.length,
            itemBuilder: (context,index){
              final item = allAlbum[index];
              return Card(
                child: ListTile(
                  leading: Text('${item.id}'),
                  title: Text(item.title),
                  subtitle: Text('${item.userId}'),
                ),
              );
            },
      ),
    );
  }
}

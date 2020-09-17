import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'post.dart';
import 'listviewdata.dart';

import 'package:http/http.dart' as http;

Future<List<Post>> fetchPosts(http.Client client) async {
  //final response = await client.get('http://localhost:65493/api/Machine/');//I/flutter ( 7348): SocketException: OS Error: Connection refused, errno = 111, address = localhost, port = 52878

//  final response = await client.get('http://192.168.1.117:65493/api/Machine/');//400-<BODY><h2>Bad Request - Invalid Hostname</h2>
//  final response = await http.get('http://10.0.2.2:65493/api/Machine');
  final response = await http.get('https://c5091fac602c.ngrok.io/api/Machine');

  //final response = await client.get('http://172.19.94.100:65493/api/Machine/');//complete nonsense no print

  //final response = await client.get('http://10.0.0.2:65493/api/Machine/');//waits but no print

  //final response =  await client.get('https://jsonplaceholder.typicode.com/posts');
  debugPrint(response.body);
  return compute(parsePosts, response.body);
}

List<Post> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'default value'),
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListViewPosts(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

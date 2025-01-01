import 'dart:convert';

import 'package:api_fatch/data/posts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Posts> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("data fatch from the internet"),
          
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : posts.isEmpty
                  ? const Center(
                      child: Text("Empty"),
                    )
                  : ListView.separated(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          isThreeLine: true,
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(posts[index].image),
                          ),
                          title: Text(posts[index].title),
                          subtitle: Text(
                            posts[index].content,
                            maxLines: 3,
                            overflow: TextOverflow.visible,
                          ),
                          onTap: () async {
                            await getPostById(posts[index].id);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
        ),
      ),
    );
  }

// https://6750135a69dc1669ec198e1a.mockapi.io/all/
  Future<void> getAllData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.org/posts"));
    // print(response.statusCode);
    // print(response.body);

    final data = jsonDecode(response.body) as List;

    // print((data.first as Map)['slug']);

    setState(() {
      posts = data.map((p) => Posts.fromMap(p)).toList();

      isLoading = false;
    });
  }

  Future<void> getPostById(int id) async {
    final getById =
        await http.get(Uri.parse("https://jsonplaceholder.org/posts/${id}"));
    final data1 = jsonDecode(getById.body);
    final pot = Posts.fromMap(data1);
    print(pot);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/repo_search_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repo Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepoSearchPage(),
    );
  }
}

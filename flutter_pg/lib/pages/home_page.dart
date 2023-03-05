import 'package:flutter/material.dart';
import 'package:flutter_pg/services/auth.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: const Text(
          'My Anime List',
          style: TextStyle(color: Colors.black87),
        ),
        floating: true,
        // centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black87),
            onPressed: () {
              AuthService().signOut();
            },
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      SliverPadding(
        padding: const EdgeInsets.all(16), 
        sliver: SliverGrid.count(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: const [
            Placeholder(),
            Placeholder(),
          ]
        )
      )
    ]));
  }
}

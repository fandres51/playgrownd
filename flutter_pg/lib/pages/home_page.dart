import 'package:flutter/material.dart';
import 'package:flutter_pg/services/auth.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mainScreen);
  }

  CustomScrollView mainScreen = CustomScrollView(slivers: [
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
      padding: const EdgeInsets.all(15),
      sliver: SliverGrid.count(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: const [
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
            Placeholder(),
          ]),
    )
  ]);
}

class AnimeCard extends StatelessWidget {
  final String imageUrl;
  const AnimeCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

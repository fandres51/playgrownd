import 'package:flutter/material.dart';
import 'package:flutter_pg/models/anime.dart';
import 'package:flutter_pg/services/auth.dart';
import 'package:flutter_pg/services/firestore.dart';

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
        body: StreamBuilder<List<Anime>>(
            stream: FirestoreService().animes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Anime> animes = snapshot.data!;
                return CustomScrollView(slivers: [
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
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: animes.map((anime) {
                            return Image(image: NetworkImage(anime.imgUrl));
                          }).toList()))
                ]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}

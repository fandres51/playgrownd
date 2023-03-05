import 'package:flutter/material.dart';

class AnimeGridList extends StatelessWidget {
  List? animeUrlList = [];
  AnimeGridList({Key? key, this.animeUrlList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
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
        ]);
  }
}

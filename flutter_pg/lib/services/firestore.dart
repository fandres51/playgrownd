import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/anime.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  Future addAnime(Anime anime) async {
    try {
      return await db.collection('anime').add(
        {
          'name': anime.name,
          'num_episodes': anime.numEpisodes,
          'on_air': anime.onAir,
          'img_url': anime.imgUrl,
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  Stream<List<Anime>> get animes {
    return FirebaseFirestore.instance
        .collection('anime')
        .snapshots()
        .map((snapshot) => Anime.fromMap(snapshot.docs.first.data()));
  }
}

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

  List<Anime> _animeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var temp = doc.data() as Map<String, dynamic>;
      return Anime(
        name: temp['name'] ?? '',
        numEpisodes: temp['num_episodes'] ?? 0,
        onAir: temp['on_air'] ?? false,
        imgUrl: temp['img_url'] ?? '',
      );
    }).toList();
  }

  final CollectionReference animesCollection = FirebaseFirestore.instance.collection('animes');

  Stream<List<Anime>> get animes {
    return animesCollection
        .snapshots()
        .map(_animeListFromSnapshot);
  }
}

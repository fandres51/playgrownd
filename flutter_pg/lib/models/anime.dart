class Anime {
  String name = '';
  int numEpisodes = 0;
  bool onAir = true;
  String imgUrl = '';

  Anime(
      {required this.name,
      required this.numEpisodes,
      required this.onAir,
      required this.imgUrl});

  static fromMap(Map<String, dynamic> data) {
    return Anime(
        name: data['name'],
        numEpisodes: data['num_episodes'],
        onAir: data['on_air'],
        imgUrl: data['img_url']);
  }
}

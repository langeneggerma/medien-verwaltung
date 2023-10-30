import 'package:medien_verwaltung/video.dart';

class Database {
  final List<Video> _videos = [];

  /**
   * Funktion zum Hinzufügen eines Videos
   * @param video Video, das hinzugefügt werden soll
   */
  Future<void> addVideo(Video video) async {
    await Future.delayed(Duration(seconds: 1)); // Simuliert eine langsame Datenbank
    _videos.add(video);
  }

  /**
   * Funktion zum Löschen eines Videos
   * @param video Video, das gelöscht werden soll
   */
  Future<void> deleteVideo(Video video) async {
    await Future.delayed(Duration(seconds: 1)); // Simuliert eine langsame Datenbank
    _videos.remove(video);
  }

  /**
   * Funktion zum Anzeigen aller Videos
   */
  Future<List<Video>> getAllVideos() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Video>.from(_videos);
  }

  /**
   * Funktion zum Aktualisieren eines Videos
   * @param video Video, das aktualisiert werden soll
   */
  Future<void> updateVideo(Video video) async {
    await Future.delayed(Duration(seconds: 1)); // Simuliert eine langsame Datenbank
    final index = _videos.indexWhere((element) => element.title == video.title);
    _videos[index] = video;
  }

  /**
   * Funktion zum Suchen eines Videos
   * @param title Titel des Videos, das gesucht werden soll
   */
  Future<List<Video>> findVideo(
      {String? regisseur, String? genre, int? publicationYear}) async {
    await Future.delayed(Duration(seconds: 1)); // Simuliert eine langsame Datenbank
    return _videos
        .where((element) =>
            (regisseur == null || element.regisseur == regisseur) &&
            (genre == null || element.genre == genre) &&
            (publicationYear == null ||
                element.publicationYear == publicationYear))
        .toList();
  }
}

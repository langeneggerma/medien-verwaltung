import 'package:medien_verwaltung/video.dart';
import 'package:medien_verwaltung/data_service.dart';

void main() async {
  final database = Database();

  /**
   * Video hinzufügen
   */
  await database.addVideo(Video(
      title: 'Star Wars: Episode IV - Eine neue Hoffnung',
      regisseur: 'George Lucas',
      publicationYear: 1977,
      genre: 'Science-Fiction'));
  await database.addVideo(Video(
      title: 'Star Wars: Episode V - Das Imperium schlägt zurück',
      regisseur: 'Irvin Kershner',
      publicationYear: 1980,
      genre: 'Science-Fiction'));
  await database.addVideo(Video(
      title: 'Star Wars: Episode VI - Die Rückkehr der Jedi-Ritter',
      regisseur: 'Richard Marquand',
      publicationYear: 1983,
      genre: 'Science-Fiction'));
  await database.addVideo(Video(
      title: 'Winnetou I',
      regisseur: 'Harald Reinl',
      publicationYear: 1963,
      genre: 'Western'));
  await database.addVideo(Video(
      title: 'Winnetou II',
      regisseur: 'Harald Reinl',
      publicationYear: 1964,
      genre: 'Western'));
  await database.addVideo(Video(
      title: 'Batman Begins',
      regisseur: 'Christopher Nolan',
      publicationYear: 2005,
      genre: 'Action'));
  await database.addVideo(Video.defaultVideo("Werner Beinhart"));

  /**
   * Alle Videos anzeigen
   */
  final allVideos = await database.getAllVideos();
  print('\x1B[31mAlle Videos:\x1B[0m');
  allVideos.forEach((element) {
    print(element);
  });

  /**
   * Ein Video suchen und anzeigen
   */
  final videosFromHarald = await database.findVideo(regisseur: 'Harald Reinl');
  print('\x1B[31m\nVideos von Harald Reinl:\x1B[0m');
  videosFromHarald.forEach((element) {
    print(element);
  });

  /**
   * Suchen von Action-Videos
   */
  final actionVideos = await database.findVideo(genre: 'Action');
  print('\x1B[31m\nAction-Videos:\x1B[0m');
  actionVideos.forEach((element) {
    print(element);
  });

  /**
   * Löschen eines Buches
   */
  final bookToDelete = allVideos.firstWhere((element) => element.title == 'Werner Beinhart');
  await database.deleteVideo(bookToDelete);
  print('\x1B[31m\nWerner Beinhart wurde gelöscht\x1B[0m');

  /**
   * Update eines Videos
   */
  final updatedVideos = database.getAllVideos();
  print("\x1B[31m\nAlle Videos nach dem Löschen von Werner Beinhart:\x1B[0m");
  (await updatedVideos).forEach((element) {
    print(element);
  });

}

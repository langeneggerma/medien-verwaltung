import 'package:medien_verwaltung/data_service.dart';
import 'package:medien_verwaltung/video.dart';
import 'package:test/test.dart';

void main() async {
  final database = Database();


  test('add video and delete video', () async {
    final testVideo = Video(
        title: 'Star Wars: Episode IV - Eine neue Hoffnung',
        regisseur: 'George Lucas',
        publicationYear: 1977,
        genre: 'Science-Fiction');

    database.addVideo(testVideo);
    final allVideos = await database.getAllVideos();
    expect(allVideos.length, 1);

    database.deleteVideo(testVideo);
    final allVideosAfterDelete = await database.getAllVideos();
    expect(allVideosAfterDelete.length, 0);
  });

  test('add default video add find them', () async {
    final testVideo = Video.defaultVideo("Werner Beinhart");
    database.addVideo(Video(
        title: 'Star Wars: Episode IV - Eine neue Hoffnung',
        regisseur: 'George Lucas',
        publicationYear: 1977,
        genre: 'Science-Fiction'));
    database.addVideo(testVideo);
    final allVideos = await database.findVideo(genre: 'UNBEKANNT');
    expect(allVideos.length, 1);
  });
}

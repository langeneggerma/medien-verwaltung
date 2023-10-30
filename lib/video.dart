class Video {
  final String _title; // _title ist private
  String? regisseur; // regisseur ist optional
  final int publicationYear; // creationYear ist final
  final String genre; // genre ist final

  Video(
      {required String title,
      this.regisseur,
      required this.publicationYear,
      required this.genre})
      : this._title = title;

  Video.defaultVideo(this._title)
      : regisseur = 'UNBEKANNT',
        publicationYear = DateTime.now().year,
        genre = 'UNBEKANNT';

  // Getter für _title
  String get title => _title;

  // Konstruktor für die Erstellung aus einer Map
  Video.fromJson(Map<String, dynamic> json)
      : _title = json['title'],
        regisseur = json['regisseur'],
        publicationYear = json['creationYear'],
        genre = json['genre'];

  //Methode zur Umwandlung in eine Map
  Map<String, dynamic> toJson() => {
    'title': _title,
    'regisseur': regisseur,
    'creationYear': publicationYear,
    'genre': genre
  };

  @override
  String toString() {
    return 'Video: \x1B[33m$genre\x1B[0m: $_title von  ${regisseur ?? 'UNBEKANNT'} aus dem Jahr ($publicationYear)';
  }

  //Video-Objekte vergleichen
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Video &&
          runtimeType == other.runtimeType &&
          _title == other._title &&
          regisseur == other.regisseur &&
          publicationYear == other.publicationYear &&
          genre == other.genre;

  @override
  int get hashCode =>
      _title.hashCode ^
      regisseur.hashCode ^
      publicationYear.hashCode ^
      genre.hashCode;

}

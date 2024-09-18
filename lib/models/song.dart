import 'package:song_book/models/song_style.dart';

class Song {
  Song({required this.title, required this.chordLyrics, this.songStyle});

  String title;
  String chordLyrics;
  SongStyle? songStyle;
}

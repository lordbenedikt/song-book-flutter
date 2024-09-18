import 'package:flutter/material.dart';
import 'package:song_book/data/songs.dart';
import 'package:song_book/song_screen.dart';

class SongBook extends StatefulWidget {
  const SongBook({super.key});

  @override
  State<SongBook> createState() => _SongBookState();
}

class _SongBookState extends State<SongBook> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SongScreen(),
    );
  }
}

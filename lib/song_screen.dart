import 'package:flutter/material.dart';

import 'package:flutter_chord/flutter_chord.dart';
import 'package:song_book/data/songs.dart';

const textStyle =
    TextStyle(fontSize: 18, color: Color.fromARGB(255, 245, 245, 245));
const chordStyle =
    TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255));

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  String _songText = '';
  TextEditingController _songTextController = TextEditingController();
  bool _isEditMode = false;
  final _form = GlobalKey();

  @override
  void initState() {
    super.initState();
    setState(() {
      _songText = songs[0].chordLyrics;
    });
  }

  void _switchMode() {
    setState(() {
      if (_isEditMode) {
        _isEditMode = false;
        _songText = _songTextController.text;
      } else {
        _isEditMode = true;
        _songTextController.text = _songText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songs[0].title),
        backgroundColor: const Color.fromARGB(255, 34, 0, 53),
        actions: [
          IconButton(
            onPressed: _switchMode,
            icon: const Icon(Icons.change_circle),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 41, 0, 72),
              Color.fromARGB(255, 96, 0, 128)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: _isEditMode
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  child: TextField(
                    key: _form,
                    decoration: InputDecoration(border: InputBorder.none),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: _songTextController,
                    style: textStyle.copyWith(height: 2.5),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: LyricsRenderer(
                    scaleFactor: 1.0,
                    lyrics: _songText,
                    textStyle: textStyle,
                    chordStyle: chordStyle,
                    widgetPadding: 50,
                    onTapChord: (String chord) {
                      print('pressed chord: $chord');
                    },
                    transposeIncrement: 0,
                    scrollSpeed: 0,
                  ),
                ),
        ),
      ),
    );
  }
}

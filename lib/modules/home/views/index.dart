import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_app/common/components/input.dart';
import 'package:music_app/modules/home/components/blur.dart';

import 'package:music_app/common/models/album.dart';
import 'package:music_app/common/models/music.dart';

import 'package:music_app/modules/home/components/music_item_long.dart';
import 'package:music_app/modules/home/components/music_item_short.dart';

class HomeDash extends StatelessWidget {
  const HomeDash(this.albums, this.mostPopular, this.searchedList,
      this.onSearchUpdate, this.onMusicSelect,
      {super.key});

  final List<Album> albums;
  final List<Music> mostPopular;
  final List<Music> searchedList;
  final void Function(String value) onSearchUpdate;
  final void Function(Music data) onMusicSelect;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Stack(
                children: const [
                  BlurCircle(Color.fromRGBO(59, 8, 202, 35), 0.0, -150.0, 0.0),
                  BlurCircle(
                      Color.fromRGBO(214, 114, 216, 25), 300.0, -200.0, 0.0),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 88.0, 16.0, 0.0),
                  child: const Text(
                    'Good Evening ✨',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: const Text(
                    'what do you want do listen today?',
                    style: TextStyle(
                      color: Color.fromRGBO(167, 167, 167, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0.0),
                  child: InputTime(
                    const Icon(Icons.search),
                    'Search Album, Artist or Title...',
                    (value) => onSearchUpdate(value),
                  ),
                ),
                Visibility(
                  visible: searchedList.isEmpty,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 14.0),
                    child: const Text(
                      'Albums',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Visibility(
                  visible: searchedList.isEmpty,
                  child: SizedBox(
                    height: 218,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: albums.length,
                      itemBuilder: (context, index) => MusicItemShort(
                        index,
                        albums.length,
                        albums.elementAt(index),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                    16.0,
                    searchedList.isNotEmpty ? 14.0 : 0.0,
                    16.0,
                    16.0,
                  ),
                  child: Text(
                    searchedList.isEmpty ? 'Most popular' : 'Results',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchedList.isNotEmpty
                      ? searchedList.length
                      : mostPopular.length,
                  itemBuilder: (context, index) => MusicItemLong(
                    index,
                    searchedList.isNotEmpty
                        ? searchedList.elementAt(index)
                        : mostPopular.elementAt(index),
                    onMusicSelect,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
    );
  }
}

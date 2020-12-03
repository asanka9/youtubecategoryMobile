/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/*
dependencies:
  flutter:
    sdk: flutter
  cloud_firestore: 0.14.1+2
  firebase_core : ^0.5.0
  youtube_player_flutter: 6.1.1
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.0

 */

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlayList(),
    );
  }
}

class PlayList extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlayList'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('uapp').snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data.documents[index];
                    if (index % 2 == 0) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                        child: YoutubePlayer(
                            controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    documentSnapshot['url']),
                                flags: YoutubePlayerFlags(autoPlay: false))),
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                            child: Center(
                              child: Text('Add Here'),
                            ),
                          ),
                          YoutubePlayer(
                              controller: YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(
                                      documentSnapshot['url']),
                                  flags: YoutubePlayerFlags(autoPlay: false))),
                        ],
                      );
                    }
                  });
            }),
      ),
    );
  }
}

 */

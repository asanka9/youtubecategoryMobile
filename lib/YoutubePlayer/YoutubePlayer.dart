
/*
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class YoutubePlayer01 extends StatefulWidget {
  @override
  _YoutubePlayerState createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer01> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: [
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: '1YDor_o0J2w',
              flags: YoutubePlayerFlags(
                autoPlay: false,

              )
            ),
          )
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class PopUpToutubePlayer extends StatefulWidget {
  @override
  _PopUpToutubePlayerState createState() => _PopUpToutubePlayerState();
}

class _PopUpToutubePlayerState extends State<PopUpToutubePlayer> {

  List urls = [
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},
    {'id':'32323','title':'Work With Title'},

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // <- added
        child: Column(
          children: <Widget>[
            Container(
                color: Colors.red,
                width: 400,
                height: 100,
                child: Text("ffffff")),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('dataffffffffffff'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('dataffffffffffff'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('dataffffffffffff'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('dataffffffffffff'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('dataffffffffffff'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('dataffffffffffff'),

              ],
            ),
          ],
        ),
      ),
    );


  }
}

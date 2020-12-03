import 'package:flutter/material.dart';
import 'package:youtubecategory/YoutubePlayer/YoutubePlayer.dart';




Widget VideoesTab(){

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



  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(0),

      child: ListView.builder(
        itemCount: urls.length,
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 25),

              child: InkWell(
                child: Image.network(
                      'https://img.youtube.com/vi/9tI39q9QlS4/maxresdefault.jpg',
                  ),
                onTap: (){

                },
              ),

            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PopUpToutubePlayer()));
            },
          );
        },
      ),

  );
}
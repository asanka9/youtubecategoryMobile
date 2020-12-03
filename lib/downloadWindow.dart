import 'package:flutter/material.dart';
import 'package:youtubecategory/utils/DataBaseHelper.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class Download extends StatefulWidget {




  
  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {

  List selectedChanels = [];
  var dbHelper;

  @override
  void initState() {
    super.initState();
    debugPrint('Hellooooooooooo');
    dbHelper = DB_Helper();
    //gridList=

  }
  addChanels(){

  }

  updateAllChanels(){

  }

  updateSelectedChanels(){

  }

  Widget ChanelDownload(){
    return Material(
      shadowColor: Colors.black12,
      elevation: 15,
      child: InkWell(
        onTap: (){},
        child: GridTile(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Image.network(
                  'https://yt3.ggpht.com/a/AATXAJxvxZLNa8BnkaLAMZLoWb93b9mKv4sjkXbYHbBw=s176-c-k-c0x00ffffff-no-rj-mo'
              ),
            ),
          ),

        ),
      ),
    );
  }

  Widget VideoDownload(){
    return Material(
      shadowColor: Colors.black12,
      elevation: 15,
      child: InkWell(
        onTap: (){},
        child: GridTile(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Image.network(
                  'https://yt3.ggpht.com/a/AATXAJxvxZLNa8BnkaLAMZLoWb93b9mKv4sjkXbYHbBw=s176-c-k-c0x00ffffff-no-rj-mo'
              ),
            ),
          ),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
            'Download',
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        actions: [
          selectedChanels.length>0 ? Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: IconButton(
                icon: Icon(
                    Icons.add,
                  color: Colors.green,
                ),
                onPressed: updateSelectedChanels
            ),
          ):Icon(Icons.devices),

        ],
      ),
      body: FutureBuilder(
        future: dbHelper.getChanels(),
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());}
          else{
            return Container(
              padding: EdgeInsets.all(8.0),

              child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15
                  ),
                  itemBuilder: (context,index){
                    if(false){
                      switch(index){
                        case 0:
                          return ChanelDownload();
                          break;
                        case 1:
                          return VideoDownload();
                          break;
                      }
                    }else{
                      return Material(
                        shadowColor: Colors.black12,
                        elevation: 15,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              if( !selectedChanels.contains(snapshot.data[index].getName())){
                                selectedChanels.add(snapshot.data[index].getName());
                              }else{
                                selectedChanels.remove(snapshot.data[index].getName());
                              }
                            });
                          },
                          child: GridTile(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Image.network(
                                    snapshot.data[index].getUrl()
                                ),
                              ),
                            ),
                            footer: Container(
                              color: Colors.white60,
                              child: ListTile(
                                title: Text(snapshot.data[index].getName()),
                                trailing: selectedChanels.contains(snapshot.data[index].getName())?  IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.green,
                                      size: 32,
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        //gridList[index]['selected'] = ! gridList[index]['selected'];
                                        selectedChanels.remove(snapshot.data[index].getName());
                                      });
                                    }
                                ):IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outline_outlined,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        //gridList[index]['selected'] = ! gridList[index]['selected'];
                                        selectedChanels.add(snapshot.data[index].getName());
                                      });
                                    }
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  )
            );
          }
        }
      ),
    );
  }
}

/*
class Grid extends StatefulWidget {
  String url;
  String name;
  bool selected ;
  _DownloadState np;

  Grid(String url,String name,bool selected,_DownloadState np){
    this.url = url;
    this.name = name;
    this.selected = selected;
    this.np = np;
  }

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black12,
      elevation: 15,
      child: InkWell(
        onTap: (){},
        child: GridTile(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Image.network(
                  widget.url
              ),
            ),
          ),
          footer: Container(
            color: Colors.white60,
            child: ListTile(
              title: Text(widget.name),
              trailing: widget.selected ?  IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: (){
                    setState(() {
                      gridList[0]['selected'] = !gridList[0]['selected'];
                    });
                  }
              ):Icon(Icons.access_alarm_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
*/




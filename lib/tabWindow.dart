import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ChanelsTab.dart';
import 'VideoesTab.dart';
import 'downloadWindow.dart';
import 'package:youtubecategory/YoutubePlayer/YoutubePlayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubecategory/utils/DataBaseHelper.dart';
import 'package:youtubecategory/models/chanelDB.dart';
import 'package:youtubecategory/models/employee.dart';

class TabWindow extends StatefulWidget {



  @override
  _TabWindowState createState() => _TabWindowState();
}

class _TabWindowState extends State<TabWindow> {

  int tabIndex=0;

  //Chanel Selecting Details
  String selectedChanel;
  int selectedIndex;

  //Video
  int selectedVideo ;
  YoutubePlayerController _controller;
  var dbHelper;

  Future<List<Chanel>> gridList;

  @override
   void initState()  {
    super.initState();
    debugPrint('Hellooooooooooo');
    dbHelper = DB_Helper();
    selectedIndex =0;
    //gridList=

  }

  //Future<int> _get
  Future<int> _getSharredPreferences() async{
    final prefs = await SharedPreferences.getInstance();
    final prefsNumber = prefs.getInt('startupNumber');
    if(prefsNumber == null){
      return 0;
    }
    return prefsNumber;
  }

  _TabWindowState()   {
    //final prefs =  SharedPreferences.getInstance();
    //await prefs.setInt('StartupNumber');
  }

  bool longPressed = false;

  List longPressedList = [];

  Widget VideoesTab() {
    return FutureBuilder(
      future: dbHelper.getItems(selectedChanel),
      builder: (context,AsyncSnapshot snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());}
        else{
          debugPrint('items :'+(snapshot.data.length.toString()));
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(0),

            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context,int index){
                return
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 25),

                    child:selectedVideo!=index? InkWell(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                        child: Image.network(
                          //'https://img.youtube.com/vi/9tI39q9QlS4/maxresdefault.jpg',
                          'https://img.youtube.com/vi/'+snapshot.data[index].getUrl()+'/maxresdefault.jpg'
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          selectedVideo = index;
                          _controller = YoutubePlayerController(
                              initialVideoId: snapshot.data[index].getUrl(),
                              flags: YoutubePlayerFlags(
                                  autoPlay: true
                              )

                          );
                        });
                      },
                    ):YoutubePlayer(
                      controller: _controller,

                    ),



                  );
              },
            ),

          );
        }
      },

    );
  }

  Widget ChanelsTab(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
        future: dbHelper.getChanels(),
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else{
            debugPrint(snapshot.data.length.toString());
              return Container(
                child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15
                  ),
                  itemBuilder: (context,index){

                    return Material(
                      shadowColor: Colors.black12,
                      elevation: 15,
                      child: InkWell(

                        child: GridTile(
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: InkWell(
                                child: Image.network(
                                    snapshot.data[index].getUrl()
                                  //'https://yt3.ggpht.com/ytc/AAUvwniNTDIUibNIZwwUWC820n6i3yPz-rnBDwOpZED1CQY=s88-c-k-c0xffffffff-no-rj-mo'
                                ),
                                onLongPress: (){
                                  setState(() {
                                    longPressed = true;
                                    if(!longPressedList.contains(snapshot.data[index].getName())){
                                      longPressedList.add(snapshot.data[index].getName());
                                    }else{
                                      longPressedList.remove(snapshot.data[index].getName());
                                      if(longPressedList.length==0){
                                        longPressed = false;
                                      }
                                    }
                                  });
                                },

                                onTap: () {
                                  setState  (()  {
                                    if(longPressed && longPressedList.length>0 ){
                                      if(!longPressedList.contains(snapshot.data[index].getName())){
                                        longPressedList.add(snapshot.data[index].getName());
                                      }else{
                                        longPressedList.remove(snapshot.data[index].getName());
                                        if(longPressedList.length==0){
                                          longPressed = false;
                                        }
                                      }
                                    }else{
                                      selectedChanel = snapshot.data[index].getName();
                                      selectedIndex = index;
                                      longPressed = false;

                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          footer: Container(
                            child: ListTile(
                              leading:selectedIndex==index? Icon(
                                  Icons.add_box
                              ):null,
                              trailing:  longPressedList.contains(snapshot.data[index].getName()) ? Icon(
                                  Icons.add_box_outlined
                              ):null,
                            ),
                          ),
                        ),
                        onTap: (){
                          setState(()  {
                            if(longPressed && longPressedList.length>0 ){
                              if(!longPressedList.contains(snapshot.data[index].getName())){
                                longPressedList.add(snapshot.data[index].getName());
                              }else{
                                longPressedList.remove(snapshot.data[index].getName());
                                if(longPressedList.length==0){
                                  longPressed = false;
                                }
                              }

                            }else{
                              selectedChanel = snapshot.data[index].getName();
                              selectedIndex = index;
                              longPressed = false;

                            }
                          });
                        },
                        onLongPress: (){
                          setState(() {
                            longPressed = true;
                            if(!longPressedList.contains(snapshot.data[index].getName())){
                              longPressedList.add(snapshot.data[index].getName());
                            }else{
                              longPressedList.remove(snapshot.data[index].getName());
                              if(longPressedList.length==0){
                                longPressed = false;
                              }
                            }
                          });
                        },
                      ),
                    );
                  }
            ),
              );
          }
        },
        //child:
      ),
    );
  }

  delleteButtonPressed(){
    //Execute Delete SqFlite

    setState(() {

      longPressed = false;
      for(int i=0;i<longPressedList.length;i++){
        dbHelper.deleteChanel(longPressedList[i]);
      }
      longPressedList = [];
    });


  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabScreans = [ChanelsTab(),VideoesTab()];
    //List<Widget> tabScreans = [ChanelsTab(),YoutubePlayer01()];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
            Icons.near_me_outlined,
                color: Colors.red,
        ),
        title: Text(
            'Youtube App',
                style: TextStyle(
            color: Colors.black87
        ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child:longPressed && tabIndex ==0? IconButton(
              icon: Icon(
                  Icons.delete,
                color: Colors.black87,
              ),
            onPressed: delleteButtonPressed,
            ):null,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black87,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Download()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: PopupMenuButton(
              icon: Icon(
                Icons.devices_other_outlined,
                color: Colors.black87,
              ),
              itemBuilder: (BuildContext context){
                return <PopupMenuEntry<int>>[
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                            Icons.ac_unit_outlined,
                          color: Colors.black87,
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text('Data'),
                        )
                      ],
                    ),
                    value: 0
                  ),
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.black87,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text('Data'),
                          )
                        ],
                      ),
                      value: 0
                  ),
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.black87,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text('Other Apps'),
                          )
                        ],
                      ),
                      value: 0
                  ),
                ];
              },
            ),
          ),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 15.0,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: tabIndex,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            tabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'M1',
            icon: Icon(
                Icons.message,
              color: tabIndex == 1 ? Colors.black:Colors.red,
            )
          ),
          BottomNavigationBarItem(
              label: 'M2',
              icon: Icon(
                  Icons.message,
                color: tabIndex == 0 ? Colors.black:Colors.red,
              )
          )
        ],
      ),
      body:tabScreans[tabIndex],
    );
  }
}

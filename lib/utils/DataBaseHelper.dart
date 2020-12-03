import 'dart:async';
import 'dart:ffi';
import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtubecategory/models/chanelDB.dart';
import 'package:youtubecategory/models/videoDB.dart';
import 'package:youtubecategory/models/employee.dart';

/*
  String name;
  String photoURL;
  bool selected;

  String url;
  String name;
 */

class DB_Helper{
  static Database _db;

  static const String PHOTO_URL_1 = 'p_url';
  static const String NAME_1 = 'name';
  static const  String SELECTED_1 = 'selected';

  // TABLE ITEM
  static const String URL_2 = 'url';
  static const String NAME_2 = 'name';


  //TABLE CATEGORY
  static const String TABLE_1 = 'Category';
  static const String TABLE_2 = 'Item';
  static const String DB_NAME = 'test2y7f9.db';



  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 4, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db_, int version) async {

    await db_
        .execute("CREATE TABLE $TABLE_1 ($NAME_1 TEXT PRIMARY KEY, $PHOTO_URL_1 TEXT, $SELECTED_1 BOOLEAN )");
    await db_
        .execute("CREATE TABLE $TABLE_2 ($NAME_2 TEXT, $URL_2 TEXT )");


    //Employee employee = Employee(21, 'my name 12');
    //db_.insert(TABLE, employee.toMap());
    /*
    await db_
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT)");
    Employee employee = Employee(21, 'my name 12');
    Employee employee1 = Employee(22, 'my name 12');
    Employee employee2 = Employee(23, 'my name 12');
    db_.insert(TABLE, employee.toMap());
    db_.insert(TABLE, employee1.toMap());
    db_.insert(TABLE, employee2.toMap());

     */


    Chanel chanel_1 = Chanel('T1', 'https://yt3.ggpht.com/ytc/AAUvwniNTDIUibNIZwwUWC820n6i3yPz-rnBDwOpZED1CQY=s88-c-k-c0xffffffff-no-rj-mo');
    Chanel chanel_2 = Chanel('T2', 'https://yt3.ggpht.com/a-/AOh14Gj0J73_OQ4ECbfPRhhudoC1hPpncxCBBFEXhg=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_3 = Chanel('T3', 'https://yt3.ggpht.com/a-/AOh14GjVmmjKC9JN3JFQWoswyNtKtXeHu6P0WER0Ew=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_4 = Chanel('T4', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_5 = Chanel('T5', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_6 = Chanel('T6', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_7 = Chanel('T7', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_8 = Chanel('T8', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_9 = Chanel('T9', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_10 = Chanel('T10', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_11 = Chanel('T11', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');
    Chanel chanel_12 = Chanel('T12', 'https://yt3.ggpht.com/a-/AOh14GiQuWlzMCEkqScbqOhgsQO0H1lLifddZWRjww=s68-c-k-c0x00ffffff-no-rj-mo');


    Video video_1 = Video('T1', 'JJBzzsgWTS4');
    Video video_2 = Video('T2', 'JJBzzsgWTS4');
    Video video_3 = Video('T2', 'JJBzzsgWTS4');
    Video video_4 = Video('T2', 'JJBzzsgWTS4');
    Video video_5 = Video('T1', 'JJBzzsgWTS4');
    Video video_6 = Video('T1', 'JJBzzsgWTS4');
    Video video_7 = Video('T1', 'JJBzzsgWTS4');
    Video video_8 = Video('T1', 'JJBzzsgWTS4');
    Video video_9 = Video('T1', 'JJBzzsgWTS4');
    Video video_10 = Video('T1', 'JJBzzsgWTS4');



    db_.insert(TABLE_1, chanel_1.toMap());
    db_.insert(TABLE_1, chanel_2.toMap());
    db_.insert(TABLE_1, chanel_3.toMap());
    db_.insert(TABLE_1, chanel_4.toMap());
    db_.insert(TABLE_1, chanel_5.toMap());
    db_.insert(TABLE_1, chanel_6.toMap());
    db_.insert(TABLE_1, chanel_7.toMap());
    db_.insert(TABLE_1, chanel_8.toMap());
    db_.insert(TABLE_1, chanel_9.toMap());
    db_.insert(TABLE_1, chanel_10.toMap());
    db_.insert(TABLE_1, chanel_11.toMap());
    db_.insert(TABLE_1, chanel_12.toMap());




    db_.insert(TABLE_2, video_1.toMap());
    db_.insert(TABLE_2, video_2.toMap());
    db_.insert(TABLE_2, video_3.toMap());
    db_.insert(TABLE_2, video_4.toMap());
    db_.insert(TABLE_2, video_5.toMap());
    db_.insert(TABLE_2, video_6.toMap());
    db_.insert(TABLE_2, video_7.toMap());
    db_.insert(TABLE_2, video_8.toMap());
    db_.insert(TABLE_2, video_9.toMap());
    db_.insert(TABLE_2, video_10.toMap());




    debugPrint('OOOOOOOOOOPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPLLLLLLLLLLLLLLLLLLLLLLLLL');



  }

  Future<List<Chanel>> getChanels() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE_1, columns: [NAME_1, PHOTO_URL_1,SELECTED_1]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Chanel> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Chanel.fromMap(maps[i]));
      }
    }
    return employees;
  }



  Future<List<Video>> getItems(String chanelName) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE_2, where: "$NAME_2 = ?", whereArgs: [chanelName]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE_2 WHERE $NAME_2 = $chanelName");
    List<Video> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Video.fromMap(maps[i]));
      }
    }
    return employees;
  }

  Future<void> deleteChanel(String id) async {
    var dbClient = await db;
    await dbClient.delete(TABLE_1, where: '$NAME_1 = ?', whereArgs: [id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future<Chanel> addChanel(Chanel chanel) async {
    var dbClient = await db;
    await dbClient.insert(TABLE_1, chanel.toMap());

    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<Void> addItem(Video video) async {
    var dbClient = await db;
    await dbClient.insert(TABLE_2, video.toMap());

    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }
}
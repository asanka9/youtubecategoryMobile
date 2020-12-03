import 'package:flutter/material.dart';

/*

  APP->build.gradle
* dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation platform('com.google.firebase:firebase-bom:26.1.0')
    implementation "com.android.support:multidex:1.0.3"
}

defaultConfig {
    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId "com.example.flutter_app"
    minSdkVersion 16
    targetSdkVersion 29
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
    multiDexEnabled true
}


  sqflite:
  path_provider:
  cloud_firestore:
  firebase_core :
  #youtube_player_flutter:
*
*
* */

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Other Apps',
          style: TextStyle(
              color: Colors.black87
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
              'SETTINGS'
          ),
        ),
      ),
    );
  }
}

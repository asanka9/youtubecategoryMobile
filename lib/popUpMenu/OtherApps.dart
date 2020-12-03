import 'package:flutter/material.dart';



class OtherApps extends StatefulWidget {
  @override
  _OtherAppsState createState() => _OtherAppsState();
}

class _OtherAppsState extends State<OtherApps> {
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
            'OTHER APPS'
          ),
        ),
      ),
    );
  }
}

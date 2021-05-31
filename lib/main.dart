import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MaterialApp(
    home:MyApp(),
  ));
}


class MyApp extends StatefulWidget{
  @override
  _State createState() =>_State() ;
}


class _State extends State<MyApp>{
  static const platform = MethodChannel('app.channel.shared.data');
  String dataShared = 'No data';

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title:Text("My App")
        ),
        body:Container(
            padding: EdgeInsets.all(28.0),
            child:Text(dataShared))
    );
  }
  void getSharedText() async {
    var sharedData = await platform.invokeMethod('getSharedText');
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}
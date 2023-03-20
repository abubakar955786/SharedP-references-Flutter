import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  String userName = "";
  String password = "";
  getData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      userName = sp.getString("username").toString();
      password = sp.getString("password").toString();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Show Data"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userName,textScaleFactor: 3,),
            Text(password,textScaleFactor: 3,),
          ],
        ),
      ),
    );
  }
}

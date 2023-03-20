import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_save_data/show_data.dart';

class SaveData extends StatelessWidget {
  const SaveData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Save Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
              controller: usernameController,
              decoration:const InputDecoration(
                hintText: "username"
              ),
            ),

             TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "password"
              ),
            ),


            const SizedBox(height: 50,),
            SizedBox(
              height: 50,width: double.infinity,
              child: ElevatedButton(
                  onPressed: ()async{
                    SharedPreferences sp = await SharedPreferences.getInstance();

                    sp.setString("username", usernameController.text);
                    sp.setString("password", passwordController.text);

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowData()));
                  },
                  child: const Text("Save")),
            )
          ],
        ),
      ),
    );
  }
}

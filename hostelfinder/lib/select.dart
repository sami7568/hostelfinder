import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom-blue-outlined-button.dart';
import 'custom-blue-rounded-button.dart';

class PromptScreen extends StatelessWidget {
  const PromptScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _body(context),
      ),
    );
  }


  _body(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(50, 70, 50, 30),
          child: Image(
            image: AssetImage(
              "assets/host.jpg",
            ),
            width: 200,
            height: 300,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(90, 0, 50, 25),
          child:  Text("Please Select User Type",style: TextStyle(color: Colors.black,fontSize: 20,),),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(100, 70, 100, 30),
          child: CustomBlueRoundedButton(
            child: const Padding(
              padding: EdgeInsets.all( 10),
              child: Text('User',style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 19),),
            ),
            onPressed: () {
              setuser("user");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const UserStartView(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
          child: CustomBlueOutlinedButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text('Admin',style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 19)),
            ),
            onPressed: () {
              setuser("admin");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AdminStartView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  setuser(String? type)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString(AppData.usertype!, type!);
  }
}

class AppData{
    static String? usertype = "userType";
}
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffEAD8C0),
      appBar: AppBar(
        backgroundColor:const Color(0xffEAD8C0) ,
        title:const Text("Notifications",style: TextStyle(
          fontSize: 30,
          fontFamily: "Pacifico"
        ),
        ),
        centerTitle: true,
      ),

      body:const Center(
        child: Text(
          "There is no notification yet!",style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w200
        ),),
      ),
    );
  }
}
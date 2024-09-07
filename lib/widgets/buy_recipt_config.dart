import 'package:flutter/material.dart';

Future<dynamic> confirmaction(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Center(
              child: Text(
            "Process done",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          )),
          content: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
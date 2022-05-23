import 'package:chatapp/screens/SelectContact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'chatPage.dart';


List<String> recipents = ["9876543210", "8765432190"];

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ChatPage(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text("Nouvelle conversation"),
          onPressed: () {
            // _sendSMS("This is a test message!", recipents);
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => const SelectContact()));
          },
        ),
      ),
    );
  }
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
import 'package:chatapp/screens/SelectContact.dart';
import 'package:flutter/material.dart';

import 'chatPage.dart';

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
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => const SelectContact()));
          },
        ),
      ),
    );
  }
}
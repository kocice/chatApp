import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../CustomUI/ButtonCard.dart';
import '../CustomUI/ContactCard.dart';
import '../models/ChatModel.dart';
import 'CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {

    future: fetchCars();

    List<ChatModel> contacts = [
      ChatModel(id: 0, name: "Dev Stack", status: "A full stack developer"),
      ChatModel(id: 1, name: "Balram", status: "Flutter Developer..........."),
      ChatModel(id: 2, name: "Saket", status: "Web developer..."),
      ChatModel(id: 3, name: "Bhanu Dev", status: "App developer...."),
      ChatModel(id: 4, name: "Collins", status: "Raect developer.."),
      ChatModel(id: 5, name: "Kishor", status: "Full Stack Web"),
      ChatModel(id: 6, name: "Testing1", status: "Example work"),
      ChatModel(id: 7, name: "Testing2", status: "Sharing is caring"),
      ChatModel(id: 8, name: "Divyanshu", status: "....."),
      ChatModel(id: 9, name: "Helper", status: "Love you Mom Dad"),
      ChatModel(id: 10, name: "Tester", status: "I find the bugs"),
      ChatModel(id: 11, name: "Koné mamadou", status: "Dev"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "256 contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
                size: 26,
              ),
              onPressed: () {}),
          PopupMenuButton<String>(
            padding: const EdgeInsets.all(0),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                const PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                const PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                const PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return  InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => const CreateGroup())
                );
              },
              child: const ButtonCard(
                name: 'Créer un groupe',
                icon: Icons.group,
              ),);
          } else if (index == 1) {
            return const ButtonCard(
              name: 'Créer un contact',
              icon: Icons.person_add,
            );
          }
          return ContactCard(
            contact: contacts[index - 2],
          );
        },
      ),
    );
  }
}

List<ChatModel> analyseCars(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ChatModel>((json) => ChatModel.fromJson(json)).toList();
}
Future<List<ChatModel>> fetchCars() async {
  final response = await rootBundle.loadString('assets/data.json');
  return compute(analyseCars, response);
}

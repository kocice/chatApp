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
              if (kDebugMode) {
                print(value);
              }
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
      body: Center(
        child: FutureBuilder<List>(
          future: fetchContact(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print('Error${snapshot.error}');
                    }
                    return  const Text('Error');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length + 2,
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
                          contact: snapshot.data![index - 2],
                        );
                      },
                    );
                  }
              }
            }),
      ),
    );
  }
}


List<ChatModel> analyseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ChatModel>((json) => ChatModel.fromJson(json)).toList();
}
Future<List<ChatModel>> fetchContact() async {
  final response = await rootBundle.loadString('assets/data/contact.json');
  return compute(analyseData, response);
}

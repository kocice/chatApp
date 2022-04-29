import 'package:flutter/material.dart';

// import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/AvatarCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/models/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  // get contacts => contacts;

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> groups = [];

  List<ChatModel> groupmember = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add participants",
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
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: const Color(0xFF128C7E),
      //     onPressed: () {},
      //     child: const Icon(Icons.arrow_forward)),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groupmember.isNotEmpty ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (contacts[index - 1].select == true) {
                        groupmember.remove(contacts[index - 1]);
                        contacts[index - 1].select = false;
                      } else {
                        groupmember.add(contacts[index - 1]);
                        contacts[index - 1].select = true;
                      }
                    });
                  },
                  child: ContactCard(
                    contact: contacts[index-1],
                  ),
                );
              }),
          groupmember.isNotEmpty
              ? Align(
                  child: Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].select == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groupmember.remove(contacts[index]);
                                      contacts[index].select = false;
                                    });
                                  },
                                  child: AvatarCard(
                                    contact: contacts[index],
                                  ),
                                );
                              }
                              return Container();
                            }),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                  alignment: Alignment.topCenter,
                )
              : Container(),
        ],
      ),
    );
  }
}

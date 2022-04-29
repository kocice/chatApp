
// import 'package:chatapp/Models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {},
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(children: [
          CircleAvatar(
            radius: 23,
            child: SvgPicture.asset(
              "assets/images/person.svg",
              color: Colors.white,
              height: 30,
              width: 30,
            ),
            backgroundColor: Colors.blueGrey[200],
          ),
          contact.select == true
              ? const Positioned(
                  bottom: 4,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    radius: 11,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                )
              : Container(),
        ]),
      ),
      title: Text(
        contact.name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status!,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
    // return ListTile(
    //   leading: SizedBox(
    //     width: 50,
    //     height: 53,
    //     child: Stack(
    //       children: [
    //         CircleAvatar(
    //           radius: 23,
    //           child: SvgPicture.asset(
    //             "assets/images/person.svg",
    //             color: Colors.white,
    //             height: 30,
    //             width: 30,
    //           ),
    //           backgroundColor: Colors.blueGrey[200],
    //         ),
    //         contact?.select != null
    //             ? const Positioned(
    //                 bottom: 4,
    //                 right: 5,
    //                 child: CircleAvatar(
    //                   backgroundColor: Colors.teal,
    //                   radius: 11,
    //                   child: Icon(
    //                     Icons.check,
    //                     color: Colors.white,
    //                     size: 18,
    //                   ),
    //                 ),
    //               )
    //             : Container(),
    //       ],
    //     ),
    //   ),
    //   title: Text(
    //     contact!.name,
    //     style: const TextStyle(
    //       fontSize: 15,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   subtitle: Text(
    //     contact!.status,
    //     style: const TextStyle(
    //       fontSize: 13,
    //     ),
    //   ),
    // );
  }
}

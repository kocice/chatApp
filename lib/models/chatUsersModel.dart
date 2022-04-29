// class ChatUsers{
//   String name;
//   String messageText;
//   String imageURL;
//   String time;
//   ChatUsers({
//     required this.name, required this.messageText, required this.imageURL,
//     required this.time
//   });
// }

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;

  ChatUsers({
    required this.name, required this.messageText, required this.imageURL,
    required this.time
  });
  factory ChatUsers.fromJson(Map<String, dynamic> json) {
    return ChatUsers(
      name: json['name'] as String,
      messageText: json['messageText'] as String,
      imageURL: json['imageURL'] as String,
      time: json['time'] as String,
    );
  }
}
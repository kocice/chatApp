class ChatModel {
  int id;
  String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool select = false;

  ChatModel({required this.id, required this.name, required this.status, this.select = false,});
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      select: json['select'] as bool,
    );
  }
}

// class ChatModel {
//   int id;
//   String name;
//   String? icon;
//   bool? isGroup;
//   String? time;
//   String? currentMessage;
//   String? status;
//   bool select = false;
//   ChatModel({
//     required this.id,
//     required this.name,
//     required this.status,
//     this.select = false,
//   });
// }
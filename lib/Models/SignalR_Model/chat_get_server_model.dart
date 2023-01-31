

class ChatGetServerModel {
ChatGetServerModel({
required this.tempId,
required this.id,
required this.status,
});

final String tempId;
final int id;
final int status;

factory ChatGetServerModel.fromJson(Map<String, dynamic> json) => ChatGetServerModel(
tempId: json["tempId"],
id: json["id"],
status: json["status"],
);

Map<String, dynamic> toJson() => {
"tempId": tempId,
"id": id,
"status": status,
};
}



class StatusChatModel {
  StatusChatModel({
required this.id,
required this.status,
});

final int id;
final int status;

factory StatusChatModel.fromJson(Map<String, dynamic> json) => StatusChatModel(
id: json["id"],
status: json["status"],
);


Map<String, dynamic> toJson() => {
"id": id,
"status": status,
};
}

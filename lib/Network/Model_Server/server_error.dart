class ServerError {
  final String? type;
  final String? message;

  ServerError({this.type, this.message});

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      ServerError(message: json['message'], type: json['type']);

  @override
  String toString() {
    return '{\n type: $type,\n message: $message\n}';
  }
}

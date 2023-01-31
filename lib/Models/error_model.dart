class ErrorModel {
  ErrorModel({
    required this.message,
    required this.error,
    required this.isAccountError,
    required this.captchaError,
  });

  final String message;
  final String error;
  final bool isAccountError;
  final bool captchaError;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    message: json["message"],
    error: json["error"],
    isAccountError: json["isAccountError"],
    captchaError: json["captchaError"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "isAccountError": isAccountError,
    "captchaError": captchaError,
  };
}

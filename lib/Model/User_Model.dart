class UserModel {
  int? userId;
  int? id;
  String? title,error;
  bool? completed;

  UserModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.error,
    required this.completed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    error: json["error"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "error": error,
    "completed": completed,
  };
  UserModel.withError(String message){
    error =message;
  }
}

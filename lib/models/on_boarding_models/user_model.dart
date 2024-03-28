class UserModel {
  final String userId;
  final String username;
  final String email;
  final String imageUrl;
  final String fcmToken;
  final String userDocId;
  final String phoneNumber;

  UserModel({
    required this.imageUrl,
    required this.email,
    required this.fcmToken,
    required this.username,
    required this.phoneNumber,
    required this.userDocId,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userDocId: json["user_doc_id"] as String? ?? "",
      userId: json["user_id"] as String? ?? "",
      username: json["user_name"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      fcmToken: json["fcm_token"] as String? ?? "",
      email: json["e_mail"] as String? ?? "",
      phoneNumber: json["phone_number"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_doc_id": "",
      "user_id": imageUrl,
      "user_name": username,
      "image_url": imageUrl,
      "fcm_token": fcmToken,
      "e_mail": email,
      "phone_number": phoneNumber,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "user_id": imageUrl,
      "user_name": username,
      "image_url": imageUrl,
      "fcm_token": fcmToken,
      "e_mail": email,
      "phone_number": phoneNumber,
    };
  }
}
class UserModel {
  String? name;
  String? tagLine;
  String? bio;
  String? profilePhoto = '';
  String? coverPhoto = '';
  String? email;
  String? phone;
  String? uId;

  UserModel(
      {this.email,
      this.name,
      this.phone,
      this.uId,
      this.tagLine,
      this.bio,
      this.coverPhoto,
      this.profilePhoto});
  UserModel.formJson(Map<String, dynamic>? json) {
    email = json!['email'];
    phone = json['phone'];
    name = json['name'];
    uId = json['uId'];
    tagLine = json['tagLine'];
    bio = json['bio'];
    coverPhoto = json['coverPhoto'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'tagLine': tagLine,
      'uId': uId,
      'coverPhoto': coverPhoto,
      'profilePhoto': profilePhoto,
      'bio': bio,
    };
  }
}


class UserModel{
    String? name;
    String? email;
    String? phone;
    String? uId;
    UserModel(
      {this.email,
      this.name,
      this.phone,
      this.uId,}
    );
    UserModel.formJson(Map<String, dynamic> json){
      email = json['email'];
      phone = json['phone'];
      name = json['name'];
      uId = json['uId'];
    }

    Map<String, dynamic> toMap(){
      return {
        'email':email,
        'phone':phone,
        'name':name,
        'uId':uId
      };
    }
}
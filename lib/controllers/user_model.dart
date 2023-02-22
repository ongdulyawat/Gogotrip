class UserModel{
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  String? username;
  String? password;


  UserModel({this.uid,this.email,this.firstname,
    this.lastname,this.username,this.password});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      username: map['username'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
     'uid':uid,
     'email':email,
     'firstname': firstname,
     'lastname' : lastname,
     'username' : username,
      'password' : password,
    };
  }
}
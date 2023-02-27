class UserModel{
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  String? username;
  String? password;
  String? describe;
  String? instagram;
  String? facebook;
  String? line;
  String? image;


  UserModel({this.uid,this.email,this.firstname,
    this.lastname,this.username,this.password,
  this.describe,this.instagram,this.facebook,this.line,this.image});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      username: map['username'],
      password: map['password'],
      describe: map['describe'],
      instagram: map['instagram'],
      facebook: map['facebook'],
      line: map['line'],
      image: map['image'],
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
      'describe' : describe,
      'instagram' : instagram,
      'facebook' : facebook,
      'line' : line,
      'image' : image,
    };
  }
}
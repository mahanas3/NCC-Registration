class UserModel{
  String? email;
  String? password;
  String ?name;
  int? contact;

  UserModel({this.email,this.password,this.name,this.contact});
  // toJson(){
  //   return{
  //     "Email":email,
  //     "Password":password,
  //     "Name":name,
  //     "Contact":contact
  //   };
  }
  //
  // Map toMap(UserModel userModel){
  //   var data=Map<String,dynamic>();
  //
  //   data ["email"]=userModel.email;
  //   data ["password"]=userModel.password;
  //   data ["name"]=userModel.name;
  //   data ["contact"]=userModel.contact;
  //
  //   return data;
  //
  // }
  //
  // UserModel.fromMap(Map<String,dynamic>mapdata){
  //   this.email=mapdata["email"];
  //   this.password=mapdata["password"];
  //   this.name=mapdata["name"];
  //   this.contact=mapdata["contact"];
  // }

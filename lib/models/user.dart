class User{
  final String? firstname;
  final String? familyname;
  final String? email;
  final bool? checkedIn;

  User({
    required this.firstname, 
    required this.familyname, 
    required this.email, 
    required this.checkedIn
    });

factory User.fromJson(Map<String, dynamic> json){
  return User(
    firstname: json['firstname'], 
    familyname: json['familyname'], 
    email: json['email'], 
    checkedIn: json['checkedIn'], 
    );
}
  
}
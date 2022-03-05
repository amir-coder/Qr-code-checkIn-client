class User{
  final String id;
  final String firstname;
  final String familyname;
  final String email;
  final bool checkedIn;

  User({
    required this.id,
    required this.firstname, 
    required this.familyname, 
    required this.email, 
    required this.checkedIn
    });

factory User.fromJson(Map<String, dynamic> json){
  return User(
    id: json['_id'],
    firstname: json['firstname'], 
    familyname: json['familyname'], 
    email: json['email'], 
    checkedIn: json['checkedIn'], 
    );
}
  
}
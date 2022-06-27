class User{
  final String id;
  final String firstname;
  final String familyname;
  final String email;
  final String team;
  final String role;
  final String workshop;
  final bool checkedIn;

  User({
    required this.id,
    required this.firstname, 
    required this.familyname, 
    required this.email, 
    required this.team, 
    required this.role, 
    required this.workshop, 
    required this.checkedIn
    });

factory User.fromJson(Map<String, dynamic> json){
  return User(
    id: json['_id'],
    firstname: json['firstname'], 
    familyname: json['familyname'], 
    email: json['email'], 
    team: json['team'], 
    role: json['role'], 
    workshop: json['workshop'], 
    checkedIn: json['checkedIn'], 
    );
}
  
}
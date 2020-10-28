class PassModel {
  String ID;
  String Name;
  String UserName;
  String Password;

  PassModel(
      {this.ID = '', this.Name = '', this.UserName = '', this.Password = ''});


  Map<String, dynamic> getMap() {
    return {
      'id': ID,
      'name': Name,
      'user_name': UserName,
      'pass': Password
    };
  }
}
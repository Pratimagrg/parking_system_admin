class User {
  String? id;
  String? name;
  String? username;
  String? email;
  String? contact;
  String? address;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.contact,
      this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['contact'] = contact;
    data['address'] = address;
    return data;
  }
}

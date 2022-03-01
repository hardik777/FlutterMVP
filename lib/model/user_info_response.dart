class UserInfoResponse {
  int? id;
  // int? role;
  String? username;
  String? firstName;
  String? lastName;
  int? gender;
  String? country;
  String? state;
  String? city;
  String? address;
  String? zipCode;
  String? email;
  String? mobileNo;
  String? profilePic;
  String? token;
  bool? isOnline;

  UserInfoResponse(
      {this.id,
      // this.role,
      this.username,
      this.firstName,
      this.lastName,
      this.gender,
      this.country,
      this.state,
      this.city,
      this.address,
      this.zipCode,
      this.email,
      this.mobileNo,
      this.profilePic,
      this.token,
      this.isOnline
      });

  UserInfoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // role = json['role'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    zipCode = json['zip_code'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    profilePic = json['profile_pic'];
    token = json['token'];
    isOnline = json['is_online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    // data['role'] = role;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['address'] = address;
    data['zip_code'] = zipCode;
    data['email'] = email;
    data['mobile_no'] = mobileNo;
    data['profile_pic'] = profilePic;
    data['token'] = token;
    data['is_online'] = isOnline;
    return data;
  }
}

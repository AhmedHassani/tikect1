

class LoginModel{
  Info? info;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  LoginModel({this.info, this.accessToken, this.tokenType, this.expiresIn}):super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }

  LoginModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ?  Info.fromJson(json['info']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

}

class Info {
  int? id;
  String? name;
  String? email;
  String? phone;
  Null? image;
  Null? managerId;
  int? departmentId;
  String? notes;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Department? department;

  Info(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.managerId,
        this.departmentId,
        this.notes,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.department});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    managerId = json['manager_id'];
    departmentId = json['department_id'];
    notes = json['notes'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['manager_id'] = this.managerId;
    data['department_id'] = this.departmentId;
    data['notes'] = this.notes;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
}

class Department {
  int? id;
  String? name;
  Null? notes;
  int? haveWork;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Department(
      {this.id,
        this.name,
        this.notes,
        this.haveWork,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    notes = json['notes'];
    haveWork = json['have_work'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['notes'] = this.notes;
    data['have_work'] = this.haveWork;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RegisterErrorDto {
  int? statusCode;
  String? message;
  List<Errors>? errors;

  RegisterErrorDto({this.statusCode, this.message, this.errors});

  RegisterErrorDto.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? property;
  List<void>? children;
  Constraints? constraints;

  Errors({this.property, this.children, this.constraints});

  Errors.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    constraints = json['constraints'] != null
        ? Constraints.fromJson(json['constraints'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property'] = this.property;
    if (this.constraints != null) {
      data['constraints'] = this.constraints!.toJson();
    }
    return data;
  }
}

class Constraints {
  String? isEmail;
  Object? isExist;

  Constraints({this.isEmail});

  Constraints.fromJson(Map<String, dynamic> json) {
    isEmail = json['isEmail'];
    isExist = json['IsUserAlreadyExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isEmail'] = isEmail;
    return data;
  }
}
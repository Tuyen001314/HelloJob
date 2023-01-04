import 'FieldData.dart';

class UserInfo {
  final String email;
  final String name;
  final String phone;
  final String job;
  final bool disabled;
  final String role;
  final String eligibility;
  final String immigration;
  final String status;
  final FieldData fieldData;
  final String jobId;
  final String companyId;

  const UserInfo({
    required this.email,
    required this.name,
    required this.phone,
    required this.job,
    required this.disabled,
    required this.role,
    required this.eligibility,
    required this.immigration,
    required this.status,
    required this.fieldData,
    required this.jobId,
    required this.companyId,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        email: json['email'],
        name: json['name'],
        phone: json['phone'],
        job: json['job'],
        disabled: json['disabled'],
        role: json['role'],
        eligibility: json['eligibility'],
        immigration: json['immigration'],
        status: json['status'],
        fieldData: json['fieldData'],
        jobId: json['jobId'],
        companyId: json['companyId'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'phone': phone,
        'job': job,
        'disabled': disabled,
        'role': role,
        'eligibility': eligibility,
        'immigration': immigration,
        'status': status,
        'fieldData': fieldData,
        'jobId': jobId,
        'companyId': companyId,
      };
}

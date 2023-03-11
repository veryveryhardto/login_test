import 'package:crypto/crypto.dart';

class Users {
  Member? member;
  Permission? permission;

  Users({this.member, this.permission});

  Users.fromJson(Map<String, dynamic> json) {
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
    permission = json['permission'] != null
        ? new Permission.fromJson(json['permission'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.member != null) {
      data['member'] = this.member!.toJson();
    }
    if (this.permission != null) {
      data['permission'] = this.permission!.toJson();
    }
    return data;
  }
}

class Member {
  String? memberCode;
  String? memberName;
  String? memberID;
  Digest? memberPW;
  int? memberBirth;
  String? ipAddress;
  int? memberPhone;

  Member(
      {this.memberCode,
        this.memberName,
        this.memberID,
        this.memberPW,
        this.memberBirth,
        this.ipAddress,
        this.memberPhone});

  Member.fromJson(Map<String, dynamic> json) {
    memberCode = json['memberCode'];
    memberName = json['memberName'];
    memberID = json['memberID'];
    memberPW = json['memberPW'];
    memberBirth = json['memberBirth'];
    ipAddress = json['ipAddress'];
    memberPhone = json['memberPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberCode'] = this.memberCode;
    data['memberName'] = this.memberName;
    data['memberID'] = this.memberID;
    data['memberPW'] = this.memberPW;
    data['memberBirth'] = this.memberBirth;
    data['ipAddress'] = this.ipAddress;
    data['memberPhone'] = this.memberPhone;
    return data;
  }
}

class Permission {
  String? memberCode;
  int? memberPermission;

  Permission({this.memberCode, this.memberPermission});

  Permission.fromJson(Map<String, dynamic> json) {
    memberCode = json['memberCode'];
    memberPermission = json['memberPermission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberCode'] = this.memberCode;
    data['memberPermission'] = this.memberPermission;
    return data;
  }
}
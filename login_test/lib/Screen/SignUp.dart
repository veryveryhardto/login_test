import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

import 'package:login_test/Data/Services.dart';
import 'package:login_test/Data/Users.dart';
import 'package:login_test/Data/RenderTextFormField.dart';

class SignUp extends StatefulWidget{
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp>{
  final formkey =GlobalKey<FormState>();

  List<Users> users=<Users>[];
  Users user=new Users();

  String memberName='';
  String memberID='';
  String memberBirth='';
  String memberPhone='';

  Digest? memberPW;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Form(
        key:this.formkey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              renderTextFormField(
                label: 'ID',
                onSaved: (val){
                  setState(() {
                    this.memberID=val;
                    String id='?member.memberID='+val;
                    users.add(user);
                    Services.getInfo(id).then((value) => users=value);
                  });
                },
                validator: (val){
                  if(val.length<2){
                    return '아이디를 입력해 주세요.';
                  }

                  if(this.memberID==users[0].member?.memberID){
                    return '이미 사용되고 있는 ID입니다.';
                  }
                  return null;
                  }
              ),
              renderPWFormField
                (
                  label: '비밀번호',
                  onSaved: (val){
                    setState(() {
                      this.memberPW=sha256.convert(utf8.encode(val));
                   });
                  },
                  validator: (val) {
                    if (val.length < 2) {
                      return '비밀번호를 입력해 주세요.';
                    }
                    return null;
                  }
                ),
              renderPWFormField
                (
                  label: '비밀번호 확인',
                  onSaved: (val){},
                  validator: (val) {
                    if (val.length < 2) {
                      return '비밀번호를 입력해 주세요.';
                    }
                    if (this.memberPW!=sha256.convert(utf8.encode(val))) {
                      return '비밀번호가 동일하지 않습니다.';
                    }
                    return null;
                  }
              ),
              renderTextFormField(
                  label: '이름',
                  onSaved: (val){
                    setState(() {
                      this.memberName=val;
                    });
                  },
                  validator: (val){
                    if(val.length<2){
                      return '이름을 입력해 주세요.';
                    }
                    return null;
                  }
              ),
              renderBirthNumberFormField(
                  label: '생년월일',
                  onSaved: (val){
                    setState(() {
                      this.memberBirth=val.replaceAll(".", "");
                    });
                  },
                  validator: (val){
                    if(val.length<10){
                      return '생년월일을 올바르게 입력해 주세요.';
                    }
                    return null;
                  }
              ),
              renderPhoneNumberFormField(
                  label: '전화번호',
                  onSaved: (val){
                    setState(() {
                      this.memberPhone=val.replaceAll("-", "");
                    });
                  },
                  validator: (val){
                    if(val.length<12){
                      return '전화번호를 올바르게 입력해 주세요.';
                    }
                    return null;
                  }
              ),
              renderButton(),
            ],
          ),
        ),
      ),
    );
  }

  renderButton(){
    return ElevatedButton(
      onPressed: () {
        this.formkey.currentState!.save();
        if(this.formkey.currentState!.validate()){
          user=new Users();
          user.member?.memberID=this.memberID;
          user.member?.memberName=this.memberName;
          user.member?.memberBirth=int.parse(this.memberBirth);
          user.member?.memberPhone=int.parse(this.memberPhone);
          user.member?.memberID=this.memberID;
          List<Users> users2=<Users>[];
          users2.add(user);

          Services.postData(users).then((value) => print(value));
            Navigator.pop(context);
        }
        this.memberName='';
        this.memberID='';
        this.memberBirth='';
        this.memberPhone='';
        this.memberPW=null;
      },
      child: Text('회원가입'),
    );
  }
}

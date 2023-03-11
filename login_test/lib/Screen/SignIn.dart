import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

import 'package:login_test/Data/Users.dart';
import 'package:login_test/Data/RenderTextFormField.dart';
import 'package:login_test/Data/Services.dart';
import 'package:login_test/Screen/AdministratorPage.dart';
import 'package:login_test/Screen/SignUp.dart';
import 'package:login_test/Screen/UserPage.dart';

class SignIn extends StatefulWidget{
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn>{
  final formkey =GlobalKey<FormState>();

  List<Users> users=<Users>[];
  Users user=Users();

  String memberID='';
  Digest? memberPW;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Form(
        key:this.formkey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              renderTextFormField(
                  label: 'ID',
                  onSaved:(val){
                    String id='?member.memberID='+val;
                    users.add(user);
                    Services.getInfo(id).then((value) => users=value);
                  },
                  validator: (val){
                    if(val.length<2){
                      return 'ID를 입력해주세요.';
                    }
                    return null;
                  }
              ),
              renderPWFormField(
                  label: '비밀번호',
                  onSaved: (val){},
                  validator: (val) {
                    this.memberPW = sha256.convert(utf8.encode(val));
                    if (val.length < 2) {
                      return '비밀번호를 입력해 주세요.';
                    }
                    if(this.memberPW==users[0].member?.memberPW){
                      return null;
                    }
                    return '비밀번호를 확인해 주세요.';
                  }
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    renderButton(),
                    renderButton2(),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
  renderButton(){
    return Container(
      width: 100.0,
      child: ElevatedButton(
        onPressed: () async{
          this.formkey.currentState!.save();
          if(this.formkey.currentState!.validate()){
            if(users[0].permission?.memberPermission==0){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>AdministratorPage()),
              );
            }
            if(users[0].permission?.memberPermission==1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>UserPage()),
              );
            }
          }
        },
        child: Text('로그인'),
      ),
    );
  }
  renderButton2(){
    return Container(
      width: 100.0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>SignUp()),
            );
          },
        child: Text('회원가입'),
        )
    );
  }
}
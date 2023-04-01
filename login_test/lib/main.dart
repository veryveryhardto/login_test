import 'package:flutter/material.dart';
import 'package:login_test/Screen/SignIn.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  KakaoSdk.init(nativeAppKey:'59bf8c9559eaccb087ee963a8cf5061a' );
  runApp(MaterialApp(
    home: SignIn(),
    )
  );
}
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

class BindPhone extends StatefulWidget {
  @override
  _BindPhone createState() => _BindPhone();
}

class _BindPhone extends State<BindPhone> {
  int active;

  @override
  void initState() {
    super.initState();
    active = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("手机号绑定"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
//        tabBar按钮
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 80, left: 20, right: 20,bottom: 20),
            child: Text(
              "手机号绑定",
              style: TextStyle(
                fontSize: 21.0,
                color: Color(0xFF333333),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
//          输入框页面
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
            child: VerificationCodeLogin(),
          ),

        ],
      ),
    );
  }
}

//验证码登录
class VerificationCodeLogin extends StatefulWidget {
  @override
  _VerificationCodeLoginState createState() => _VerificationCodeLoginState();
}

class _VerificationCodeLoginState extends State<VerificationCodeLogin> {
  TextEditingController tel = TextEditingController();
  TextEditingController code = TextEditingController();
  int time;
  Timer timer;
  String codeText;

  login(context) {
    Scaffold.of(context).removeCurrentSnackBar();
    if (tel.text == "" || !RegExp(r'^1[3456789]\d{9}$').hasMatch(tel.text)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("请输入正确的手机号"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
    if (code.text == "") {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("请输入验证码"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed("/HomePage");
  }

//  开始倒计时
  countdown() {
    if (time != 60) {
      return null;
    }
    time = 60;
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      if (time == 0) {
        time = 60;
        setState(() {
          codeText = "重新获取";
        });
        timer?.cancel();
        return null;
      }
      setState(() {
        time -= 1;
        codeText = "${time}s后重新获取";
      });
      print(time);
    });
  }

  @override
  void initState() {
    time = 60;
    codeText = "获取验证码";
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xFFDDDDDD),
              ),
            ),
          ),
          child: TextField(
            controller: tel,
            cursorColor: Color(0xFFff9e06),
            cursorWidth: 1,
            style: TextStyle(fontSize: 18),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              hintText: "登录手机号",
              hintStyle: TextStyle(
                fontSize: 18,
                color: Color(0xFFd3d2da),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xFFDDDDDD),
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: code,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.go,
                  cursorColor: Color(0xFFff9e06),
                  cursorWidth: 1,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: "验证码",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFd3d2da),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).removeCurrentSnackBar();
                  if (tel.text == "" ||
                      !RegExp(r'^1[3456789]\d{9}$').hasMatch(tel.text)) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("请输入正确的手机号"),
                      behavior: SnackBarBehavior.floating,
                    ));
                    return null;
                  }
                  countdown();
                },
                child: Text(
                  codeText,
                  style: TextStyle(color: Color(0xFFff9e06), fontSize: 15),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(top: 77),
          child: RaisedButton(
            onPressed: () {
              login(context);
            },
            elevation: 4,
            child: Text(
              "完成",
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            color: Color(0xFFff9e06),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPassword createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("找回密码"),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
//        tabBar按钮
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child: Text(
              "找回密码",
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
  TextEditingController pwd1 = TextEditingController();
  TextEditingController pwd2 = TextEditingController();
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
    if (pwd1.text == "") {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("请输入新密码"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
    if (pwd2.text == "") {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("请输入确认密码"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
    if (pwd1.text != pwd2.text) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("两次输入的密码不一样"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("消息提醒"),
            content: Text("密码修改成功！请登录",style: TextStyle(color: Color(0xFF888888))),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10, bottom: 10),
                child: SizedBox(
                  width: 80,
                  height: 30,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    color: Color(0xFFff9e06),
                    textColor: Colors.white,
                    child: Text("立即登录",style: TextStyle(fontSize: 12),),
                  ),
                ),
              ),
            ],
          );
        });
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
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xFFDDDDDD),
              ),
            ),
          ),
          child: TextField(
            controller: pwd1,
            cursorColor: Color(0xFFff9e06),
            cursorWidth: 1,
            style: TextStyle(fontSize: 18),
            keyboardType: TextInputType.text,
            obscureText: true,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              hintText: "新密码",
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
          child: TextField(
            controller: pwd2,
            cursorColor: Color(0xFFff9e06),
            cursorWidth: 1,
            style: TextStyle(fontSize: 18),
            keyboardType: TextInputType.text,
            obscureText: true,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              hintText: "确认密码",
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
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(top: 77),
          child: RaisedButton(
            onPressed: () {
              login(context);
            },
            elevation: 4,
            child: Text(
              "确定",
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

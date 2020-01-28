import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:v_privilege/component/page_router.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int active;

  @override
  void initState() {
    super.initState();
    active = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          //去注册
          Container(
            margin: EdgeInsets.only(
                top: 0.0 + MediaQueryData.fromWindow(window).padding.top,
                right: 20),
            child: SizedBox(
              width: 60,
              height: 30,
              child: FlatButton(
                onPressed: () {
                  PushRouterPage(context:context,name:"registered");
                },
                padding: EdgeInsets.all(0),
                child: Text("去注册"),
              ),
            ),
            alignment: Alignment.topRight,
          ),
//        tabBar按钮
          Padding(
            padding: EdgeInsets.only(top: 48.0, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: active == 0 ? Color(0xFFff9e06) : Colors.white,
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        active = 0;
                      });
                    },
                    child: Text(
                      "账号登录",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: active == 1 ? Color(0xFFff9e06) : Colors.white,
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        active = 1;
                      });
                    },
                    child: Text(
                      "验证码登录",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
//          输入框页面
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
            child: active == 0 ? AccountLogin() : VerificationCodeLogin(),
          ),

//          社交账号-标题
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 55, right: 55, top: 10),
                child: Divider(
                  height: 0.5,
                  color: Color(0xFFDDDDDD),
                ),
              ),
              Center(
                child: Text(
                  "  社交帐号登录  ",
                  style: TextStyle(
                      backgroundColor: Colors.white,
                      fontSize: 12,
                      color: Colors.black45),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    PushRouterPage(context:context,name:"bind-phone");
                  },
                  child: Image.asset(
                    "images/QQ.png",
                    width: 40,
                    height: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    PushRouterPage(context:context,name:"bind-phone");
                  },
                  child: Image.asset(
                    "images/WeChat.png",
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//账号登录
class AccountLogin extends StatelessWidget {
  TextEditingController tel = TextEditingController();
  TextEditingController pwd = TextEditingController();

//  登录
  login(context) {
    Scaffold.of(context).removeCurrentSnackBar();
    if (tel.text == "" || !RegExp(r'^1[3456789]\d{9}$').hasMatch(tel.text)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("请输入正确的手机号"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
    if (pwd.text == "") {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("请输入登录密码"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
    Navigator.of(context).pushReplacementNamed("/HomePage");
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
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.go,
            style: TextStyle(fontSize: 18),
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
          child: TextField(
            controller: pwd,
            cursorColor: Color(0xFFff9e06),
            cursorWidth: 1,
            obscureText: true,
            style: TextStyle(fontSize: 18),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              hintText: "登录密码",
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
            PushRouterPage(context:context,name:"reset-password");
          },
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "忘记密码",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF999999),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(top: 50),
          child: RaisedButton(
            onPressed: () {
              login(context);
            },
            elevation: 4,
            child: Text(
              "登录",
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

//验证码登录
class VerificationCodeLogin extends StatefulWidget {
  @override
  _VerificationCodeLoginState createState() => _VerificationCodeLoginState();
}

class _VerificationCodeLoginState extends State<VerificationCodeLogin> {
  TextEditingController tel = TextEditingController();
  TextEditingController pwd = TextEditingController();
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
    if (pwd.text == "") {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("请输入登录密码"),
        behavior: SnackBarBehavior.floating,
      ));
      return null;
    }
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
                  controller: pwd,
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
              "登录",
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

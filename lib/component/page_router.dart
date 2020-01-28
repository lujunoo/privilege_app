import 'package:flutter/material.dart';
import 'package:v_privilege/widgets/home/search.dart';
import 'package:v_privilege/widgets/nologin/login.dart';
import 'package:v_privilege/widgets/nologin/registered.dart';
import 'package:v_privilege/widgets/nologin/reset-password.dart';
import 'package:v_privilege/widgets/nologin/bind-phone.dart';
import 'package:v_privilege/widgets/home/all-citys.dart';
import 'package:v_privilege/widgets/home/map-mode.dart';
import 'package:v_privilege/widgets/home/business-list.dart';

final routes = {
  "searchData":(arguments)=>SearchData(),//首页搜索
  "login":(arguments)=>Login(),//登录
  "registered":(arguments)=>Registered(),//注册
  "reset-password":(arguments)=>ResetPassword(),//忘记密码
  "bind-phone":(arguments)=>BindPhone(),//绑定手机哈
  "selectCity":(arguments)=>SelectCity(),//选择城市
  "mapMode":(arguments)=>MapMode(),//地图模式
  "businessList":(arguments)=>BusinessList(),//商家列表
};
class PushRouterPage {
  final BuildContext context;
  final String name;
  final arguments;
  PushRouterPage({this.arguments,this.name,this.context}){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return routes[name](arguments);
    }));
  }
}


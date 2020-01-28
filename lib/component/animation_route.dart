import 'package:flutter/material.dart';

//重写路由
class AnimationRoute extends PageRouteBuilder {
//  路由页面传入
  final Widget widget;

  AnimationRoute({this.widget})
      : super(
            //设置动画时长500毫秒
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return ScaleTransition(
                scale: Tween(begin: 0.7, end: 1.0).animate(CurvedAnimation(
                  parent: animation1, //动画样式
                  curve: Curves.fastOutSlowIn, //动画曲线
                )),
                child: child,
              );
            });
}

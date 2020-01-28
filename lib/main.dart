import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//首页
import 'package:v_privilege/widgets/home/home.dart';
//会员狗
import 'package:v_privilege/widgets/member-shop/menber-shop.dart';
//优惠专区
import 'package:v_privilege/widgets/discount-zone/discount-zone.dart';
//会员社区
import 'package:v_privilege/widgets/member-community/member-community.dart';
//个人中心
import 'package:v_privilege/widgets/personal/personal.dart';
//登录
import 'package:v_privilege/widgets/nologin/login.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  bool isLogin=true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'V特权',
      theme: ThemeData(primaryColor: Color(0xFFffFFFF)),
      routes: {
        '/HomePage': (ctx) => HomePage(),
        '/Login': (ctx) => Login(),
      },
      home:isLogin?HomePage():Login(),
//      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pageItem=[
    Home(),
    MenberShop(),
    DiscountZone(),
    MemberCommunity(),
    Personal(),
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
//    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
//    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
//    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
//    print(
//        '底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
//    print(
//        '状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px
//
//    print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
//    print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
//
//    print(
//        '宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
//    print(
//        '高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
//    print('系统的字体缩放比例:${ScreenUtil.textScaleFactor}');
    return Scaffold(

      body: pageItem[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        selectedItemColor: Color(0xFFff9e06),
        unselectedFontSize: 10,
        unselectedItemColor: Color(0xFF6d6c86),
        currentIndex: currentIndex,
        onTap: (data) {
          setState(() {
            currentIndex = data;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 0
                    ? "images/nav_icon1_1.png"
                    : "images/nav_icon1.png",
                width: 25,
                height: 25,
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text("首页"),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 1
                    ? "images/nav_icon2_1.png"
                    : "images/nav_icon2.png",
                width: 25,
                height: 25,
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text("会员狗"),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 2
                    ? "images/nav_icon3_1.png"
                    : "images/nav_icon3.png",
                width: 24,
                height: 24,
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text("优惠专区"),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 3
                    ? "images/nav_icon4_1.png"
                    : "images/nav_icon4.png",
                width: 25,
                height: 25,
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text("会员社区"),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 4
                    ? "images/nav_icon5_1.png"
                    : "images/nav_icon5.png",
                width: 25,
                height: 25,
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text("我的"),
              )),
        ],
      ),
    );
  }
}

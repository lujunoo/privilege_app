import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:v_privilege/component/loading.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_privilege/component/page_router.dart';

class Home extends StatelessWidget {
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Color(0xffff9e06),
        onRefresh: _handleRefresh,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                title: HomeHeader(),
                floating: true,
                pinned: false,
                snap: false),
//                banner
            SliverToBoxAdapter(
              child: HomeBanner(),
            ),
            Classification(),
//                附近权益
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "附近权益",
                      style: TextStyle(fontSize: 18, color: Color(0xFF111111)),
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            IconData(0xe655, fontFamily: "myIcon"),
                            size: 20,
                            color: Color(0xFFd3d2da),
                          ),
                          Text(
                            "地图模式",
                            style:
                            TextStyle(fontSize: 15, color: Color(0xFF6d6c86)),
                          ),
                        ],
                      ),
                      onTap: (){
                        PushRouterPage(context:context,name:"mapMode");
                      },
                    )

                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: NearbyRights(),
            ),
//                精选商家
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 6),
                child: Text(
                  "精选商家",
                  style: TextStyle(fontSize: 18, color: Color(0xFF111111)),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FeaturedMerchants(),
            ),
//                精选专区
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
                child: Text(
                  "精选专区",
                  style: TextStyle(fontSize: 18, color: Color(0xFF111111)),
                ),
              ),
            ),
            FeaturedArea(),
            SliverToBoxAdapter(
              child: Loading(
                isloading: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//顶部标题栏
class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                PushRouterPage(context:context,name:"selectCity");
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    IconData(0xe614, fontFamily: "myIcon"),
                    size: 18,
                    color: Color(0xFFff9e06),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "重庆市",
                      style: TextStyle(color: Color(0xFF333333), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child:GestureDetector(
                onTap: (){
                  PushRouterPage(context:context,name:"searchData");
                },
                child: Container(
                  width: double.infinity,
                  height: 32,
                  padding: EdgeInsets.only(left: 13),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(194, 191, 208, 0.3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(
                    IconData(0xe6db, fontFamily: "myIcon"),
                    size: 17,
                    color: Color(0xffd3d2da),
                  ),
                ),
              )
            ),
            PopupMenuButton(
              child: Icon(
                IconData(0xe60c, fontFamily: "myIcon"),
                size: 26,
                color: Color(0xffd3d2da),
              ),
              initialValue: "",
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    child: Text("扫码点餐"),
                    value: "hot",
                  ),
                  PopupMenuItem<String>(
                    child: Text("消费记录"),
                    value: "new",
                  ),
                ];
              },
              onSelected: (String action) {},
            ),
          ],
        ),
      ],
    ));
  }
}

//首页顶部广告轮播图
class HomeBanner extends StatefulWidget {
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
//  当前状态
  int pageIndex = 0;

//  数据源
  List list = [
    'https://cdn.pixabay.com/photo/2018/03/13/18/30/food-3223286__340.jpg',
    'https://cdn.pixabay.com/photo/2017/06/29/20/09/mexican-2456038__340.jpg',
    'https://cdn.pixabay.com/photo/2017/10/20/17/45/goulash-2872112__340.jpg',
    'https://cdn.pixabay.com/photo/2018/11/02/15/25/roast-goose-3790417__340.jpg'
  ];

//  生成指示器
  List<Widget> indicator() {
    return list.map((val) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: pageIndex == list.indexOf(val) ? 14 : 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: pageIndex == list.indexOf(val)
                      ? Color(0xFFffe3b8)
                      : Color(0xFFf0f0f0),
                ),
                margin: EdgeInsets.only(top: 10, right: 5, left: 5),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5, right: 20, left: 20),
          width: double.infinity,
          height: 150,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    list[index],
                    fit: BoxFit.cover,
                  );
                },
                duration: 500,
                autoplayDelay: 3000,
                autoplay: true,
                itemCount: list.length,
                viewportFraction: 1,
                scale: 1,
                onIndexChanged: (data) {
                  setState(() {
                    pageIndex = data;
                  });
                },
              )),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicator(),
          ),
        )
      ],
    );
  }
}

//首页分类
class Classification extends StatelessWidget {
  List title = [
    "人气正餐",
    "速食简餐",
    "甜点蛋糕",
    "饮品咖啡",
    "酒店",
    "景点",
    "休闲娱乐",
    "美容SPA",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          childAspectRatio: 0.84,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return InkWell(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "images/menu${index + 1}.png",
                      width: ScreenUtil.getInstance().setWidth(90),
                      height: ScreenUtil.getInstance().setHeight(90),
                    ),
                  ),
                ),
                Text(
                  title[index],
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(26),
                      color: Color(0xFF6d6c86)),
                ),
              ],
            ),
            onTap: () {
              switch(index){
//                酒店
                case 4:
                  break;
                case 5:
                  break;
//                  景点
                default:
                  PushRouterPage(context:context,name:"businessList");
//                  其他商家
              }
            },
          );
        }, childCount: 8),
      ),
    );
  }
}

//附近权益
class NearbyRights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/11/16/18/51/kagyana-2955466__340.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 85,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xfffcd955),
                              Color(0x66fcd955),
                              Color(0x00fcd955)
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Recommended food",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                shadows: [
                                  Shadow(
                                      color: Color(0xe8ff9c00), blurRadius: 4)
                                ],
                              ),
                            ),
                            Text(
                              "推荐美食",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                shadows: [
                                  Shadow(
                                      color: Color(0xe8ff9c00), blurRadius: 4)
                                ],
                              ),
                            ),
                            Text(
                              "重庆火锅冒菜串串重庆火锅冒菜串串重庆火锅冒菜串串",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                shadows: [
                                  Shadow(
                                      color: Color(0xe8ff9c00), blurRadius: 5)
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/03/09/06/30/pool-2128578__340.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 85,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff51c2c6),
                            Color(0x6651c2c6),
                            Color(0x0051c2c6)
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Recommended Hotel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              shadows: [
                                Shadow(color: Color(0xe800b6c8), blurRadius: 4)
                              ],
                            ),
                          ),
                          Text(
                            "推荐酒店",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              shadows: [
                                Shadow(color: Color(0xe800b6c8), blurRadius: 4)
                              ],
                            ),
                          ),
                          Text(
                            "万达酒店万达酒店万达酒店万达酒店万达酒店万达酒店",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              shadows: [
                                Shadow(color: Color(0xe800b6c8), blurRadius: 5)
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2018/08/16/08/39/hallstatt-3609863__340.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 110,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff5ca3dc),
                      Color(0x665ca3dc),
                      Color(0x005ca3dc)
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Recommended attractions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        shadows: [
                          Shadow(color: Color(0xe82c89d7), blurRadius: 4)
                        ],
                      ),
                    ),
                    Text(
                      "推荐景点",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        shadows: [
                          Shadow(color: Color(0xe82c89d7), blurRadius: 4)
                        ],
                      ),
                    ),
                    Text(
                      "重庆磁器口重庆磁器口重庆磁器口重庆磁器口重庆磁器口重庆磁器口重庆磁器口重庆磁器口重庆磁器口",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        shadows: [
                          Shadow(color: Color(0xe82c89d7), blurRadius: 5)
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//精选商家
class FeaturedMerchants extends StatelessWidget {
  List dataList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: SizedBox(
        width: double.infinity,
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 135,
              margin: EdgeInsets.only(
                right: 20,
                left: index == 0 ? 20 : 0,
                top: 9,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x22555555),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2019/11/04/12/23/chicken-4601053__340.jpg",
                      fit: BoxFit.cover,
                      width: 135,
                      height: 85,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      "精选推荐商家$index",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF333333),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//精选专区
class FeaturedArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          width: double.infinity,
          height: 110,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x22AAAAAA),
                blurRadius: 8,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2019/09/13/04/09/shrimp-4473036__340.jpg",
                  fit: BoxFit.cover,
                  width: 105,
                  height: 90,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "番茄芝士披萨·套餐1",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              text: 'VIP: ￥',
                              style: TextStyle(
                                  color: Color(0xffff9e06), fontSize: 12),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '338.0',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "453.00",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xffd3d2da),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: const Color(0xffd3d2da),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "销量：1315",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff999999),
                            ),
                          ),
                          Text(
                            "1.5km",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff999999),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }, childCount: 5),
    );
  }
}

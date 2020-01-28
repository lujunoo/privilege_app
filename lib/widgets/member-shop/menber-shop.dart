import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:v_privilege/component/loading.dart';

class MenberShop extends StatelessWidget {
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            HomeHeader(),
            Expanded(
              child: RefreshIndicator(
                color: Color(0xffff9e06),
                onRefresh: _handleRefresh,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: HomeBanner(),
                    ),
                    SliverToBoxAdapter(
                      child: Classification(),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 20, right: 20, bottom: 15),
                        child: Text(
                          "为你推荐",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff111111),
                              fontSize: 18),
                        ),
                      ),
                    ),
                    ListData(),
                    SliverToBoxAdapter(
                      child: Loading(isloading: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton:Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffff9e06),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(color: Color(0x99ff9e06),blurRadius: 10,offset: Offset(0, 0) ),
            ],
          ),
          child: Text("订单",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        )
      ),
    );
  }
}

//顶部标题栏
class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.only(left: 17, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "会员购",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 30,
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
              margin: EdgeInsets.only(left: 25),
              child: Icon(
                IconData(0xe6db, fontFamily: "myIcon"),
                size: 17,
                color: Color(0xffd3d2da),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//顶部广告轮播图
class HomeBanner extends StatefulWidget {
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> with TickerProviderStateMixin {
//  当前状态
  int pageIndex = 0;

//  数据源
  List list = [
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3499571712,3802588041&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2148690432,3037505981&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=180701113,3031137477&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3765563271,1653365527&fm=26&gp=0.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3697768049,563633860&fm=26&gp=0.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=548498512,4073234727&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2506698343,2223949521&fm=26&gp=0.jpg'
  ];

//  生成指示器
  List<Widget> indicator() {
    return list.map((val) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: pageIndex == list.indexOf(val) ? 14 : 6,
        height: 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: pageIndex == list.indexOf(val)
              ? Color(0xFFffe3b8)
              : Color(0xFFf0f0f0),
        ),
        margin: EdgeInsets.only(top: 10, right: 5, left: 5),
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
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(bottom: 0),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color(0x30000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                list[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        duration: 800,
        autoplayDelay: 5000,
        autoplay: true,
        itemCount: list.length,
        viewportFraction: 0.8,
        scale: 0.83,
        onIndexChanged: (data) {
          setState(() {
            pageIndex = data;
          });
        },
      ),
    );
  }
}

//分类
class Classification extends StatelessWidget {
  List gridview = [
    "积分商城",
    "洗护",
    "母婴",
    "营养",
    "家电",
    "服饰",
    "箱包",
    "配饰",
    "洗护",
    "母婴",
    "营养",
    "家电",
    "服饰",
    "箱包",
    "配饰",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          childAspectRatio: 0.86,
        ),
        itemCount: gridview.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2012/04/18/23/29/film-38241__340.png",
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  gridview[index],
                  style: TextStyle(fontSize: 13, color: Color(0xFF6d6c86)),
                ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
//
    );
  }
}

//列表
class ListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.65,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color(0x09000000),
                offset: Offset(0, 0),
                blurRadius: 10,
              ),
            ]),
            child:InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 0),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2016/04/30/05/04/camera-1362419__340.jpg",
                      width: double.infinity,
                      height: 175,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "商品标题",
                      style: TextStyle(fontSize: 13, color: Color(0xFF333333)),
                    ),
                  ),
                  Container(
                    color: Color(0xffff9e06),
                    padding:
                        EdgeInsets.only(top: 1, right: 4, left: 4, bottom: 1),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "VIP",
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: RichText(
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
                      ),
                      Text(
                        "453.00",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xffd3d2da),
                          decoration: TextDecoration.lineThrough,
                          decorationColor: const Color(0xffd3d2da),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              onTap: () {},
            ),
          );
        }, childCount: 15),
      ),
    );
  }
}

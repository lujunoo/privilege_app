import 'package:flutter/material.dart';
import 'package:v_privilege/component/page_router.dart';
import 'package:v_privilege/component/loading.dart';
//import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class MapMode extends StatefulWidget {
  @override
  _MapModeState createState() => _MapModeState();
}

class _MapModeState extends State<MapMode> with SingleTickerProviderStateMixin {
  var scaffoldState = new GlobalKey<ScaffoldState>();
  TabController tabController;
  bool positions=false;
  mapInit() async {
//    await AmapCore.init('7a04506d15fdb7585707f7091d715ef4');
//    /// 如果你觉得引擎的日志太多, 可以关闭Fluttify引擎的日志
//    await enableFluttifyLog(false);
  }

  @override
  void initState() {
    mapInit();
    tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("附近权益"),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  PushRouterPage(context: context, name: "selectCity");
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      "江北区",
                      style: TextStyle(color: Color(0xff333333), fontSize: 15),
                    ),
                    Icon(
                      IconData(0xe61b, fontFamily: "myIcon"),
                      size: 16,
                      color: Color(0xffAAAAAA),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            child: Text(
              "地图展示区域",
              style: TextStyle(fontSize: 40, color: Colors.black12),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  positions=true;
                });
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return Column(
                      children: <Widget>[
                        TabBar(
                          indicatorWeight: 1,
                          indicatorColor: Colors.transparent,
                          unselectedLabelColor: Color(0xff333333),
                          labelColor: Color(0xffff9e06),
                          controller: tabController,
                          tabs: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Text(
                                "热门商家",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Text(
                                "美食",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Text(
                                "酒店",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Text(
                                "景点",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: <Widget>[
                                TabPage1(),
                                TabPage2(),
                                TabPage3(),
                                TabPage4(),
                              ],
                            )),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffff9e06),
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 5),
                        blurRadius: 15)
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          "附近5公里内，共98家会员权益",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      height: double.infinity,
                      color: Colors.white,
                      child: Text(
                        "查看",
                        style:
                        TextStyle(fontSize: 15, color: Color(0xffff9e06)),
                      ),
                    )
                  ],
                ),
              ),
            ) ,
          )
        ],
      ),
    );
  }
}

class TabPage1 extends StatelessWidget {
  List datalist = [
    "1",
    "1",
    "1",
    "1",
    "1",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datalist.length + 1,
      itemBuilder: (context, index) {
        return index == datalist.length
            ? Padding(
                padding: EdgeInsets.only(top: 10),
                child: Loading(
                  isloading: true,
                ),
              )
            : Container(
                width: double.infinity,
                height: 110,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xffeeeeee))),
                  color: Colors.white,
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
      },
    );
  }
}

class TabPage2 extends StatelessWidget {
  List datalist = [
    "1",
    "1",
    "1",
    "1",
    "1",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datalist.length + 1,
      itemBuilder: (context, index) {
        return index == datalist.length
            ? Padding(
                padding: EdgeInsets.only(top: 10),
                child: Loading(
                  isloading: true,
                ),
              )
            : Container(
                width: double.infinity,
                height: 110,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xffeeeeee))),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2010/12/13/10/25/appetizer-2802__340.jpg",
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
      },
    );
  }
}

class TabPage3 extends StatelessWidget {
  List datalist = [
    "1",
    "1",
    "1",
    "1",
    "1",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datalist.length + 1,
      itemBuilder: (context, index) {
        return index == datalist.length
            ? Padding(
                padding: EdgeInsets.only(top: 10),
                child: Loading(
                  isloading: true,
                ),
              )
            : Container(
                width: double.infinity,
                height: 110,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xffeeeeee))),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2016/09/18/03/28/travel-1677347__340.jpg",
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
      },
    );
  }
}

class TabPage4 extends StatelessWidget {
  List datalist = [
    "1",
    "1",
    "1",
    "1",
    "1",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datalist.length + 1,
      itemBuilder: (context, index) {
        return index == datalist.length
            ? Padding(
                padding: EdgeInsets.only(top: 10),
                child: Loading(
                  isloading: true,
                ),
              )
            : Container(
                width: double.infinity,
                height: 110,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xffeeeeee))),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        "https://cdn.pixabay.com/photo/2014/11/15/23/29/neuschwanstein-532850__340.jpg",
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
      },
    );
  }
}

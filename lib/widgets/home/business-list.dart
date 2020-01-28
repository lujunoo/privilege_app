import 'package:flutter/material.dart';
import 'package:v_privilege/component/sliver-tabBar-delegate.dart';
import 'package:v_privilege/component/loading.dart';

class BusinessList extends StatefulWidget {
  @override
  _BusinessListState createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {
  List dataList = [
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f8fd),
      appBar: AppBar(
        title: Text("商家列表"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, bool) {
            return [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: SliverTabBarDelegate(
                  maxHeight: 90,
                  minHeight: 35 + MediaQuery.of(context).padding.top,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    reverse: true,
                    child: Header(),
                  ),
                ),
              ),
            ];
          },
          body: ListView.builder(
            itemCount: dataList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index == dataList.length
                  ? Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Loading(
                        isloading: true,
                      ),
                    )
                  : ListItem();
            },
          ),
        ),
      ),
    );
  }
}

//头部
class Header extends StatefulWidget {
  final List title;
  final TabController controller;

  Header({this.title, this.controller});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  int active = 0;
  String sort = "5";

//  商圈
  openSort() {
    showSearch(
        context: context,);

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "江北区",
                    style: TextStyle(color: Color(0xff333333), fontSize: 18),
                  ),
                  Icon(
                    IconData(0xe61b, fontFamily: "myIcon"),
                    size: 16,
                    color: Color(0xffAAAAAA),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 35,
                margin: EdgeInsets.only(left: 10, right: 15, top: 10),
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
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 2, right: 8),
                      child: Icon(
                        IconData(0xe6db, fontFamily: "myIcon"),
                        size: 17,
                        color: Color(0xffd3d2da),
                      ),
                    ),
                    Text(
                      "搜索商家",
                      style: TextStyle(fontSize: 15, color: Color(0xffd3d2da)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PopupMenuButton(
                child: Row(
                  children: <Widget>[
                    Text(
                      sort,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff6d6c86),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                      color: Color(0xff6d6c86),
                    )
                  ],
                ),
                initialValue: sort,
                onSelected: (data) {
                  setState(() {
                    sort = data;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      child: Text(
                        "最新上线",
                        style: TextStyle(fontSize: 14),
                      ),
                      value: "最新上线",
                    ),
                    PopupMenuItem<String>(
                      child: Text(
                        "离我最近",
                        style: TextStyle(fontSize: 14),
                      ),
                      value: "离我最近",
                    ),
                    PopupMenuItem<String>(
                      child: Text(
                        "人气最高",
                        style: TextStyle(fontSize: 14),
                      ),
                      value: "人气最高",
                    ),
                    PopupMenuItem<String>(
                      child: Text(
                        "价格最低",
                        style: TextStyle(fontSize: 14),
                      ),
                      value: "价格最低",
                    ),
                    PopupMenuItem<String>(
                      child: Text(
                        "价格最高",
                        style: TextStyle(fontSize: 14),
                      ),
                      value: "价格最高",
                    ),
                    PopupMenuItem<String>(
                      child: Text(
                        "默认",
                        style: TextStyle(fontSize: 14),
                      ),
                      value: "默认",
                    ),
                  ];
                },
              ),
              GestureDetector(
                child: Text(
                  "商圈",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff6d6c86),
                  ),
                ),
                onTap: () {
                  openSort();
                },
              ),
              Text(
                "菜系",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff6d6c86),
                ),
              ),
              Text(
                "筛选",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff6d6c86),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//精选专区
class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
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
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      "番茄芝士披萨·套餐1",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        IconData(0xe635, fontFamily: "myIcon"),
                        size: 12,
                        color: Color(0xffff9e06),
                      ),
                      Icon(
                        IconData(0xe635, fontFamily: "myIcon"),
                        size: 12,
                        color: Color(0xffff9e06),
                      ),
                      Icon(
                        IconData(0xe635, fontFamily: "myIcon"),
                        size: 12,
                        color: Color(0xffff9e06),
                      ),
                      Icon(
                        IconData(0xe635, fontFamily: "myIcon"),
                        size: 12,
                        color: Color(0xffd3d2da),
                      ),
                      Icon(
                        IconData(0xe635, fontFamily: "myIcon"),
                        size: 12,
                        color: Color(0xffd3d2da),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'VIP: ￥',
                          style:
                              TextStyle(color: Color(0xffff9e06), fontSize: 12),
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
  }
}

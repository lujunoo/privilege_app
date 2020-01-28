import 'package:flutter/material.dart';
import 'dart:async';
import 'package:v_privilege/component/loading.dart';
class SearchData extends StatefulWidget {
  @override
  _SearchDataState createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  TextEditingController controller = new TextEditingController();
  var scaffoldState = new GlobalKey<ScaffoldState>();
  FocusNode focusNode = new FocusNode();
  String searchText;
  bool loading=false;
  List historylable = [];
  submit() {
    if (controller.text == "") {
      scaffoldState.currentState.removeCurrentSnackBar();
      scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("请输入搜索内容"),
              GestureDetector(
                child: Icon(
                  Icons.close,
                  size: 18,
                ),
                onTap: () {
                  scaffoldState.currentState.removeCurrentSnackBar();
                },
              )
            ],
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return null;
    }
    setState(() {
      historylable.add(controller.text);
    });
    searchData();
  }

//  点击标签的回调函数
  callBack(data) {
    controller.text = data;
    searchData();
  }

//  开始搜索数据
  searchData() {
    setState(() {
      loading=true;
    });
    Timer(Duration(seconds: 3),(){
      focusNode.unfocus();
      setState(() {
        loading=false;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {});
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfff8f8f8),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 7),
                          child: Icon(
                            IconData(0xe6db, fontFamily: "myIcon"),
                            size: 18,
                            color: Color(0xffaaaaaa),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            cursorColor: Color(0xFFff9e06),
                            cursorWidth: 1,
                            focusNode: focusNode,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.search,
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              hintText: "水果芝士披萨",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFd3d2da),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                bottom: 0,
                              ),
                            ),
                            onSubmitted: (data) {
                              submit();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: FlatButton(
                    color: Colors.white,
                    child: Text(
                      "搜索",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      submit();
                    },
                  ),
                )
              ],
            ),
          ),
//          进度条
          SliverToBoxAdapter(
            child:focusNode.hasFocus?Column(
              children: <Widget>[
                loading?Transform.translate(
                  offset: Offset(0, -4),
                  child:LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xffff9e06)),
                    backgroundColor: Color(0x55ffe3b8),
                  ) ,
                ):Container(),
                HotSearchData(callBack:callBack ,),
                HistorySearchData(list: historylable, callBack: callBack),
              ],
            ):Container(),
          ),
           focusNode.hasFocus?SliverToBoxAdapter(
               child:Container()
           ):FeaturedArea()
        ],
      ),
    );
  }
}

//热门搜索
class HotSearchData extends StatelessWidget {
  final Function callBack;
  HotSearchData({this.callBack});
  List listData = [
    "芝士披萨",
    "海鲜披萨",
    "水果芝士披萨",
    "芝士披萨",
    "海鲜披萨",
    "水果芝士披萨",
    "芝士披萨",
    "海鲜披萨",
    "水果芝士披萨",
  ];
  List<Widget> item = [];

  List<Widget> hotLoable() {
    listData.map((data) {
      item.add(GestureDetector(
        onTap: () {
          callBack(data);
        },
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffedecf4),
          ),
          child: Text(
            data,
            style: TextStyle(fontSize: 12, color: Color(0xff333333)),
          ),
        ),
      ));
    }).toList();
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35,bottom: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "热门搜索",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff6d6c86),
              ),
            ),
          ),
          Wrap(
            runSpacing: 10,
            spacing: 15,
            children: hotLoable(),
          )
        ],
      ),
    );
  }
}

//历史搜索
class HistorySearchData extends StatefulWidget {
  final List list;
  final Function callBack;

  HistorySearchData({this.list, this.callBack});

  @override
  _HistorySearchDataState createState() => _HistorySearchDataState();
}

class _HistorySearchDataState extends State<HistorySearchData> {
  List<Widget> hotLable() {
    List<Widget> item = [];
    widget.list.map((data) {
      item.add(
        GestureDetector(
          onTap: () {
            widget.callBack(data);
          },
          child: Container(
            padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffedecf4),
            ),
            child: Text(
              data,
              style: TextStyle(fontSize: 12, color: Color(0xff333333)),
            ),
          ),
        ),
      );
    }).toList();
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 20, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "历史搜索",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff6d6c86),
                ),
              ),
              IconButton(
                icon: Icon(
                  IconData(0xe658, fontFamily: "myIcon"),
                  size: 20,
                  color: Color(0xffd3d2da),
                ),
                onPressed: () {

                },
              )
            ],
          ),
          Wrap(
            runSpacing: 10,
            spacing: 15,
            children: hotLable(),
          )
        ],
      ),
    );
  }
}

//商品列表
class FeaturedArea extends StatelessWidget {
  List list=["1","1","1","1","1","1","1","1","1","1",];
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return index==list.length?Loading(isloading: true,):Container(
          width: double.infinity,
          height: 110,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 15, right: 15, top: 6,bottom: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x55AAAAAA),
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
      }, childCount: list.length+1),
    );
  }
}

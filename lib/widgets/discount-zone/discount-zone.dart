import 'package:flutter/material.dart';
import 'package:v_privilege/component/loading.dart';

class DiscountZone extends StatefulWidget {
  @override
  _DiscountZoneState createState() => _DiscountZoneState();
}

class _DiscountZoneState extends State<DiscountZone>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: HomeHeader(),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8,bottom: 15),
              child: TabBar(
                isScrollable: true,
                controller: tabController,
                indicatorWeight: 3,
                labelColor: Color(0xff111111),
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                unselectedLabelColor: Color(0xff999999),
                indicatorSize:TabBarIndicatorSize.label,
                indicatorColor:Color(0xffff9e06),
                tabs: <Widget>[
                  Text("人气正餐"),
                  Text("速食简餐"),
                  Text("甜点蛋糕"),
                  Text("饮品咖啡"),
                  Text("酒店"),
                  Text("景点"),
                  Text("休闲娱乐"),
                  Text("美容SPA"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  TabViewPage1(),
                  TabViewPage2(),
                  TabViewPage3(),
                  TabViewPage4(),
                  TabViewPage5(),
                  TabViewPage6(),
                  TabViewPage7(),
                  TabViewPage8(),
                ],
              ),
            )
          ],
        )

      ),
    );
  }
}

//顶部标题栏
class HomeHeader extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 32,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(left: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xfff8f8f8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10, bottom: 3),
            child: Icon(
              IconData(0xe6db, fontFamily: "myIcon"),
              size: 17,
              color: Color(0xffd3d2da),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: Color(0xFFff9e06),
              cursorWidth: 1,
              textInputAction: TextInputAction.search,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                hintText: "搜索",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Color(0xffd3d2da),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  bottom: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//人气正餐
class TabViewPage1 extends StatefulWidget {
  @override
  _TabViewPage1State createState() => _TabViewPage1State();
}
class _TabViewPage1State extends State<TabViewPage1> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}

//速食简餐
class TabViewPage2 extends StatefulWidget {
  @override
  _TabViewPage2State createState() => _TabViewPage2State();
}
class _TabViewPage2State extends State<TabViewPage2> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}

//甜点蛋糕
class TabViewPage3 extends StatefulWidget {
  @override
  _TabViewPage3State createState() => _TabViewPage3State();
}
class _TabViewPage3State extends State<TabViewPage3> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}

//咖啡饮品
class TabViewPage4 extends StatefulWidget {
  @override
  _TabViewPage4State createState() => _TabViewPage4State();
}
class _TabViewPage4State extends State<TabViewPage4> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}

//酒店
class TabViewPage5 extends StatefulWidget {
  @override
  _TabViewPage5State createState() => _TabViewPage5State();
}
class _TabViewPage5State extends State<TabViewPage5> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}

//景点
class TabViewPage6 extends StatefulWidget {
  @override
  _TabViewPage6State createState() => _TabViewPage6State();
}
class _TabViewPage6State extends State<TabViewPage6> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}
//休闲娱乐
class TabViewPage7 extends StatefulWidget {
  @override
  _TabViewPage7State createState() => _TabViewPage7State();
}
class _TabViewPage7State extends State<TabViewPage7> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}
//美容spa
class TabViewPage8 extends StatefulWidget {
  @override
  _TabViewPage8State createState() => _TabViewPage8State();
}
class _TabViewPage8State extends State<TabViewPage8> {
  ScrollController scrollController=new ScrollController();
  List list=["1","1","1","1","1"];
  bool isloding =false;
//  刷新数据
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.insertAll(0,["2","2","1",]);
      });
    });
  }
//加载数据
  Future<Null> _handleLoading(){
    isloding=true;
    Future.delayed(Duration(seconds: 2), () {
      print('刷新数据');
      setState(() {
        list.addAll(["1","1","1","1"]);
      });
      isloding=false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        if(!isloding){
          _handleLoading();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: Color(0xffff9e06),
      child: ListView.builder(
        controller:scrollController ,
        itemCount: list.length+1,
        itemBuilder: (context,index){
          return index==list.length?Loading(isloading: true,):ListItemData(index:index);
        },
      ),
    )  ;
  }
}


class ListItemData extends StatelessWidget {
  int index;
  ListItemData({this.index});
  @override
  Widget build(BuildContext context) {
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
                      "${index}番茄芝士披萨·套餐",
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
  }
}



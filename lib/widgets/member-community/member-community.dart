import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:v_privilege/component/loading.dart';
import 'package:v_privilege/component/sliver-tabBar-delegate.dart';

class MemberCommunity extends StatefulWidget {
  @override
  _MemberCommunityState createState() => _MemberCommunityState();
}

class _MemberCommunityState extends State<MemberCommunity>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController = new ScrollController();
  List tabTitle = [
    "关注",
    "推荐",
    "美食",
    "旅行",
    "玩乐",
    "酒店",
    "美容",
    "家居",
  ];

//  根据动态导航初始化页面
  List<Widget> setTabPage() {
    List<Widget> tabPage = [];
    for (int i = 0; i < tabTitle.length; i++) {
      tabPage.add(TabViewPage(ishome: i == 1?true:false,id:tabTitle[i],));
    }
    return tabPage;
  }
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: tabTitle.length, vsync: this,initialIndex: 1);
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        print("11111111111111111111111111111111111111111111");
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Color(0xffff9e06),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [BoxShadow(color: Color(0x55ff9e06), blurRadius: 12)]),
          child: Icon(
            IconData(0xe618, fontFamily: "myIcon"),
            color: Colors.white,
            size: 28,
          ),
        ),
        body:NestedScrollView(
          controller:scrollController,
          headerSliverBuilder: (context, bool) {
            return [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: SliverTabBarDelegate(
                  maxHeight: 140,
                  minHeight: 47 + MediaQuery.of(context).padding.top,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    reverse: true,
                    child: Header(title: tabTitle, controller: tabController),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(controller: tabController, children: setTabPage()),
        ),
      ),
    );
  }
}

//头部
class Header extends StatefulWidget {
  final List title;
  final TabController controller;

  Header({@required this.title, this.controller});

  @override
  _HeaderState createState() => _HeaderState();
}
class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  List<Widget> setTabTitle() {
    List<Widget> tabWidget = [];
    widget.title.map((val) {
      tabWidget.add(Text(val));
    }).toList();
    return tabWidget;
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
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "会员社区",
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2017/12/28/22/03/lens-3046269__340.jpg",
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 35,
          margin: EdgeInsets.only(left: 20, right: 120),
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
                "搜索",
                style: TextStyle(fontSize: 15, color: Color(0xffd3d2da)),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
          child: TabBar(
              isScrollable: true,
              controller: widget.controller,
              unselectedLabelStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              unselectedLabelColor: Color(0xff6d6c86),
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              labelColor: Color(0xffff9e06),
              indicator: BoxDecoration(
                  color: Color(0xffffe3b8),
                  borderRadius: BorderRadius.circular(40)),
              tabs: setTabTitle()),
        ),
      ],
    );
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
    'https://cdn.pixabay.com/photo/2018/08/16/08/39/hallstatt-3609863__340.jpg',
    'https://cdn.pixabay.com/photo/2019/11/09/14/55/nature-4613735__340.jpg',
    'https://cdn.pixabay.com/photo/2016/07/30/08/13/moscow-1556561__340.jpg',
    'https://cdn.pixabay.com/photo/2016/02/29/06/43/cancun-1228131__340.jpg'
  ];

//  生成指示器
  List<Widget> indicator() {
    return list.map((val) {
      return AnimatedContainer(
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
                autoplayDelay: 5000,
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

class TabViewPage extends StatefulWidget {
  final bool ishome;
  final String id;
  TabViewPage({@required this.ishome,this.id});
  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> {
  List datalist=["1","1","1",];
  //  刷新页面
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print(widget.id);
      setState(() {
        datalist.addAll(["1","1","1",]);
      });
    });
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Color(0xffff9e06),
        child: ListView.builder(
          itemCount: datalist.length+1,
          itemBuilder: (context, index) {
            if (index == 0&&widget.ishome) {
              return HomeBanner();
            }
            if(index==datalist.length){
              return Padding(padding: EdgeInsets.only(top: 10),child: Loading(isloading: true),) ;
            }
            return ListItem(name: widget.id,);
          },
        ),
        onRefresh: _handleRefresh
    ) ;
  }
}

class ListItem extends StatelessWidget {
  final String name;
  ListItem({@required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      padding: EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))),
      child: Column(
        children: <Widget>[
//          标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2017/12/28/22/03/lens-3046269__340.jpg",
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Another__$name",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff111111),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "昨天",
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff6d6c86),
                ),
              ),
            ],
          ),
//          内容
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: Text(
              "此次的目的地主要是 挪威 ，但是国内直飞 奥斯陆 的航班很少，而且要去 北京 转机，机票又贵，之前一直听朋友大力推荐",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff111111),
              ),
            ),
          ),
//          图片
          Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(right: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2016/01/19/17/50/phone-1149925__340.jpg",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2017/12/28/22/03/lens-3046269__340.jpg",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
//          数据统计
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      IconData(0xe650, fontFamily: "myIcon"),
                      size: 24,
                      color: Color(0xff6d6c86),
                    ),
                    Text(
                      " 2312",
                      style: TextStyle(fontSize: 13, color: Color(0xff6d6c86)),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      IconData(0xe891, fontFamily: "myIcon"),
                      size: 19,
                      color: Color(0xff6d6c86),
                    ),
                    Text(
                      " 2312",
                      style: TextStyle(fontSize: 13, color: Color(0xff6d6c86)),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      IconData(0xe627, fontFamily: "myIcon"),
                      size: 20,
                      color: Color(0xff6d6c86),
                    ),
                    Text(
                      " 2312",
                      style: TextStyle(fontSize: 13, color: Color(0xff6d6c86)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

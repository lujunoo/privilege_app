import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var tabTitle = [
    '页面1',
    '页面2',
    '页面3',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitle.length,
      child: Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (context, bool) {
            return [
              SliverPersistentHeader(
                delegate: SliverTabBarDelegate(
                  child: Container(
                    height: 180 + MediaQuery.of(context).padding.top,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      reverse: true,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            height: 50,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '大标题',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  decoration:
                                      InputDecoration.collapsed(hintText: '搜索'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            child: TabBar(
                              tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                              indicatorColor: Colors.red,
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  maxHeight: 200,
                  minHeight: 55 + MediaQuery.of(context).padding.top,
                  color: Colors.white,
                ),
                pinned: true,
                floating: true,
              ),
            ];
          },
          body: TabBarView(
            children: tabTitle
                .map((s) => ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('嘿嘿嘿  $index'),
                        );
                      },
                      itemCount: 50,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final Color color;
  final double maxHeight;
  final double minHeight;

  const SliverTabBarDelegate(
      {@required this.child,
      @required this.maxHeight,
      @required this.minHeight,
      this.color})
      : assert(child != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: child,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
}

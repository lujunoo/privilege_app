import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f8fd),
      body: ListView(
        children: <Widget>[
          HearderWidget(),
          DataCount(),
          VIPCard(),
          Integral(),
          ListTitle(),
        ],
      ),
    );
  }
}

class HearderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 10),
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2015/11/26/00/14/fashion-1063100__340.jpg",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "此人已成仙",
                          style:
                              TextStyle(fontSize: 22, color: Color(0xFF333333)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "书到用时方恨少，钱到月底不够花",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF333333)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: -15,
            top: -10,
            child: IconButton(
              padding: EdgeInsets.all(1.0),
              iconSize: 24,
              icon: Icon(
                IconData(0xe6eb, fontFamily: "myIcon"),
                color: Color(0xff6d6c86),
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            right: 0,
            top: 1,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DataCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "234",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "收藏",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6d6c86),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "234",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "浏览",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6d6c86),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "234",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "卷包",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6d6c86),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VIPCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 175,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/vip-bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -8,
            left: -13,
            child: Image.asset(
              "images/vtq-icon.png",
              width: 110,
            ),
          ),
//          开通VIP
          Positioned(
            top: 15,
            right: 15,
            child: Offstage(
              offstage: true,
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFe3bc53), width: 0.5),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "开通VIP",
                  style: TextStyle(
                    color: Color(0xFFe3bc53),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
//          已开通VIP
          Positioned(
            top: 12,
            right: 17,
            child: Offstage(
              offstage: false,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/vip-icon2.png",
                    width: 18,
                  ),
                  Text(
                    "  " + "VIP2",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "CTLiShuSJ",
                        color: Color(0xFFe3bc53),
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
//          卡号
          Center(
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xffffd336), Color(0xffffffff)],
                ).createShader(Offset.zero & bounds.size);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "8888",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "8888",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "8888",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "8888",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
//          到期时间
          Positioned(
            bottom: 10,
            right: 12,
            child: Text(
              "2020-12-31 到期",
              style: TextStyle(
                fontSize: 9,
                color: Color(0xFFe3bc53),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Integral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '积分',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xffe3bc53),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        IconData(0xe60b, fontFamily: "myIcon"),
                        size: 24,
                        color: Color(0xffe3bc53),
                      ),
                      Text(
                        ' 6315',
                        style: TextStyle(
                          fontFamily: "FZSHHJW--GB1-0",
                          fontSize: 24,
                          color: Color(0xffe3bc53),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '已省',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xffe3bc53),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 15,
                    padding: EdgeInsets.only(left: 2, right: 4),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff252525),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 90,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff5bbfe1),
                                  Color(0xff4c48bb),
                                  Color(0xffe63396),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "2334",
                            style: TextStyle(
                              color: Color(0xffe3bc53),
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
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

class ListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(top:  Radius.circular(10)),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15,right: 10,left: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                IconData(0xe605, fontFamily: "myIcon"),
                                size: 25,
                                color: Color(0xfffd9a41),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff6d6c86),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            IconData(0xe62d, fontFamily: "myIcon"),
                            size: 20,
                            color: Color(0xffc7c7cc),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(top: 15,bottom: 15,right: 10,left: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 5),child: Icon(
                              IconData(0xe61c, fontFamily: "myIcon"),
                              size: 23,
                              color: Color(0xff42c8b3),
                            ),)
                            ,
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "我的钱包",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff6d6c86),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          IconData(0xe62d, fontFamily: "myIcon"),
                          size: 20,
                          color: Color(0xffc7c7cc),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.vertical(bottom:  Radius.circular(10)),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15,right: 10,left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 7),child: Icon(
                                IconData(0xe637, fontFamily: "myIcon"),
                                size: 18,
                                color: Color(0xfffb8691),
                              ),)
                              ,
                              Padding(
                                padding: EdgeInsets.only(left: 13),
                                child: Text(
                                  "邀请有礼",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff6d6c86),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            IconData(0xe62d, fontFamily: "myIcon"),
                            size: 20,
                            color: Color(0xffc7c7cc),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20,top: 20,bottom: 50),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15,right: 10,left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 6),child: Icon(
                                IconData(0xe675, fontFamily: "myIcon"),
                                size: 21,
                                color: Color(0xff817fb5),
                              ),)
                              ,
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  "设置",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff6d6c86),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            IconData(0xe62d, fontFamily: "myIcon"),
                            size: 20,
                            color: Color(0xffc7c7cc),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    )
      ;
  }
}

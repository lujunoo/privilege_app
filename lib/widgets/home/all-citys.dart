import 'package:flutter/material.dart';
//import 'package:city_pickers/city_pickers.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  TextEditingController controller = new TextEditingController();
  List<String> letter = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
  ];

  List<Widget> setletter() {
    List<Widget> arry = [];
    letter.map((data) {
      arry.add(GestureDetector(
        onVerticalDragUpdate: (data2) {
          print(data2);
          print(data);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          child: Text(
            data,
            style: TextStyle(fontSize: 14, color: Color(0xff999999)),
          ),
        ),
      ));
    }).toList();
    return arry;
  }

//  openCity() async{
//    await CityPickers.showCitiesSelector(
//      context: context,
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                pinned: false,
                snap: false,
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 35,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0x99edecf4),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: controller,
                                cursorColor: Color(0xFFff9e06),
                                cursorWidth: 1,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.search,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  hintText: "请输入城市名称",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFd3d2da),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    bottom: 0,
                                  ),
                                ),
                                onSubmitted: (data) {},
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(
                                IconData(0xe6db, fontFamily: "myIcon"),
                                size: 18,
                                color: Color(0xffaaaaaa),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("当前定位城市"),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 4, bottom: 5),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: Color(0xffedecf4),
                        ),
                        child:GestureDetector(
                          onTap: (){
//                            openCity();
                          },
                          child: Text(
                            "重新定位",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                        ,
                      ),
                    ],
                  ),
                ),
              ),
              CityList()
            ],
          ),
          Positioned(
              top: 0,
              right: 8,
              bottom: 0,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: setletter())),
        ],
      ),
    );
  }
}

//城市列表
class CityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ListTile(
          title: Text("北京市"),
          onTap: () {},
        );
      }, childCount: 20),
    );
  }
}

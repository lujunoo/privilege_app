import 'package:flutter/material.dart';
// 加载中
class Loading extends StatelessWidget {
  final bool isloading;
  Loading({@required this.isloading});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0, bottom: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isloading?Transform.scale(
              scale: 0.6,
              child:CircularProgressIndicator(
                backgroundColor: Color(0xff6d6c86),
                strokeWidth: 2.7,
                valueColor: AlwaysStoppedAnimation(Color(0xffd3d2da)),
              ),
            ):Text(""),
            Text(
              isloading?"数据加载中...":"我也是有底线的~",
              style: TextStyle(fontSize: 12, color: Color(0xff6d6c86)),
            )
          ],
        ));
  }
}

class Loading2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child:Transform.scale(
          scale: 0.7,
          child: CircularProgressIndicator(
            backgroundColor: Color(0xff6d6c86),
            strokeWidth: 2.6,
            valueColor: AlwaysStoppedAnimation(Color(0xffd3d2da)),
          ),
        )
        ,
      ),
    );
  }
}

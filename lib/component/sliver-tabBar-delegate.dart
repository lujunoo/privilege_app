import 'package:flutter/material.dart';
//实现吸顶appBar的自定义头部类,必须继承SliverPersistentHeaderDelegate
class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;
  final Color color;

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

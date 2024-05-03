import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        //labelColor: Colors.black,
        labelPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size8,
        ),
        indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size14,
            ),
            child: Icon(Icons.grid_4x4_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size14,
            ),
            child: FaIcon(FontAwesomeIcons.heart),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  CustomTabBar({
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(color: Palette.facebookBlue, width: 3.0),
        ),
      ),
      indicatorPadding: EdgeInsets.zero,
      tabs: icons
          .asMap()
          .map((index, icon) {
            return MapEntry(
                index,
                Tab(
                  icon: Icon(
                    icon,
                    color: index == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                ));
          })
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

///
/// Created by NieBin on 18-12-6
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///

import "package:flutter/material.dart";
import 'package:flutter_layouts_higher/lib/page_lib.dart';
import 'package:flutter_layouts_higher/lib/constant_lib.dart';
import 'package:flutter_layouts_higher/lib/view_lib.dart';

class MainPage extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  var curType = PageType.Home;

  Widget _body() {
    switch (curType) {
      case PageType.Home:
        return HomePage();
      case PageType.Other:
        return OtherPage();
    }
    return HomePage();
  }

  BottomNavigationBarItem _barItem(PageType type) {
    var color = type == curType
        ? BOTTOM_COLORS[COLOR_LIGHT_INDEX]
        : BOTTOM_COLORS[COLOR_DARK_INDEX];
    return BottomNavigationBarItem(
        title: Text(
          PAGE_TITLES[type.index],
          style: TextStyle(
            color: color,
          ),
        ),
        icon: Icon(
          PAGE_ITEM_ICONS[type.index],
          color: color,
        ));
  }

  void _itemClick(index) {
    var type = convertPageType(index);
    curType = type;
    switch (type) {
      case PageType.Home:
        break;
      case PageType.Other:
        break;
    }
    setState(() {});
  }

  List<BottomNavigationBarItem> _barItems() {
    var items = List<BottomNavigationBarItem>();
    for (var type in PageType.values) {
      items.add(_barItem(type));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: MainAppBar(
//        titleColor: Colors.white,
//        titleText: MAIN_PAGE,
//      ),
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        items: _barItems(),
        onTap: _itemClick,
      ),
    );
  }
}

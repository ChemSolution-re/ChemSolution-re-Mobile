import 'package:flutter/material.dart';

import '../../config/transition_route.dart';
import 'tabs/main_page_tab_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();

  static PageRoute getRoute() {
    return FadeTransitionRoute<MainPage>(
      builder: (_, __, ___) => const MainPage(),
    );
  }
}

class _MainPageState extends State<MainPage> {
  MainPageTabItem _currentItem = MainPageTabItem.elements;

  void _onNavigatorBatItemPress(int index) {
    setState(() {
      _currentItem = MainPageTabItem.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentItem.tabItem,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onNavigatorBatItemPress,
        currentIndex: _currentItem.index,
        items: MainPageTabItem.values.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.iconData),
            label: item.getLabel(context),
            tooltip: item.getLabel(context),
          );
        }).toList(),
      ),
    );
  }
}

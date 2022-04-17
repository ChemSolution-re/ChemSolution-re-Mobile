import 'package:chem_solution/pages/main_page/tabs/main_page_tab_item.dart';
import 'package:chem_solution/views/chem_solution_app_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
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

import 'package:chem_solution/pages/main_page/main_page_tab_item.dart';
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
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onNavigatorBatItemPress,
        items: MainPageTabItem.values.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.iconData),
            label: item.getLabel(context),
          );
        }).toList(),
      ),
    );
  }
}

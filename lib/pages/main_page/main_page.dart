import 'package:chem_solution/l10n/chem_solution_localizations.dart';
import 'package:chem_solution/pages/main_page/main_page_tab_item.dart';
import 'package:chem_solution/resources/app_image_resources.dart';
import 'package:chem_solution/themes/main_theme.dart';
import 'package:chem_solution/views/chem_solution_app_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageTabItem _currentItem = MainPageTabItem.elements;
  bool isSearching = false;

  void _onNavigatorBatItemPress(int index) {
    setState(() {
      _currentItem = MainPageTabItem.values[index];
      isSearching = false;
    });
  }

  void _onSearchIconPress() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChemSolutionAppBar(
        isLeadingIconEnabled: false,
        isSearching: isSearching,
        onSearchIconPressed: _onSearchIconPress,
      ),
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

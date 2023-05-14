import 'package:app_store/view/today_screen.dart';
import 'package:flutter/cupertino.dart';
import 'app_screen.dart';
import 'game_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(currentIndex: 2, items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.today_fill), label: "Today"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rocket_fill), label: "Games"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.layers_alt_fill), label: "Apps"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cloud_upload_fill), label: "Updates"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), label: "Search"),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return index == 0
                ? TodayScreen()
                : index == 1
                ? GameScreen()
                : index == 2
                ? AppScreen()
                : Center();
          },
        );
      },
    );
  }
}

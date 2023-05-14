import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  AppProvider? appProviderTrue;
  AppProvider? appProviderFalse;
  @override
  Widget build(BuildContext context) {
    appProviderFalse = Provider.of<AppProvider>(context, listen: false);
    appProviderTrue = Provider.of<AppProvider>(context, listen: true);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.white,
            border: Border.all(width: 0, style: BorderStyle.none),
            middle: Row(
              children: [
                SizedBox(width: 5),
                Text(
                  "Today",
                  style: TextStyle(
                      fontSize: 35,
                      color: CupertinoColors.black,
                      letterSpacing: 1),
                ),
                Spacer(),
                Icon(
                  CupertinoIcons.profile_circled,
                  color: CupertinoColors.black,
                  size: 30,
                ),
                SizedBox(width: 5),
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "${appProviderFalse!.offerinfo[1].firstimage}",
                  height: 500,
                  width: 400,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Image.asset(
                  "${appProviderFalse!.offerinfo[0].firstimage}",
                  height: 500,
                  width: 400,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ));
  }
}

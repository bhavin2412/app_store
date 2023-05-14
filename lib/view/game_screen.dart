import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
                  "Games",
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
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NEW GAME",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 10,
                    color: CupertinoColors.activeBlue),
              ),
              SizedBox(height: 5),
              Text(
                "${appProviderFalse!.gameinfo[0].name}",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: CupertinoColors.black),
              ),
              SizedBox(height: 5),
              Text(
                "${appProviderFalse!.gameinfo[0].company}",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 15,
                    color: CupertinoColors.systemGrey),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => fristgame(index),
                    itemCount: 5),
              ),
              Divider(),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Discover Gaming",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.black),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 15,
                        color: CupertinoColors.activeBlue),
                  ),
                ],
              ),
              SizedBox(height: 5),
              SizedBox(height: 340,
                child: ListView.builder(itemBuilder: (context, index) => topchart(index),
                    itemCount: appProviderFalse!.gameinfo.length),)
            ],
          ),
        ));
  }

  Widget fristgame(int index) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        child: Image.asset('${appProviderFalse!.gameinfo[0].image![index]}'));
  }
  Widget topchart(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${appProviderFalse!.gameinfo[index].imagepath}",
                  height: 80,
                  width: 80,
                )),
            SizedBox(width: 15),
            Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${appProviderFalse!.gameinfo[index].name}",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontFamily: 'robo',
                          fontSize: 16)),
                  Text("${appProviderFalse!.gameinfo[index].company}",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontFamily: 'robo',
                          fontSize: 13)),
                  Container(
                    height: 25,
                    width: 60,
                    decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(
                        "GET",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 15,
                            color: CupertinoColors.activeBlue),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}

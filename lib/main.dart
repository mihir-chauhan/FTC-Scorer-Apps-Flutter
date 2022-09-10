import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_widgets/styled_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';
import 'custom_widgets/styled_toast_enum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        builder: (context, child) {
          return MediaQuery(
              child: child!,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0));
        },
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              navLargeTitleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: const Color(0x242424),
              )),
        ),
        home: roundsPage());
  }
}

class roundsPage extends StatefulWidget {
  @override
  _roundsPageState createState() => _roundsPageState();
}

class _roundsPageState extends State<roundsPage> {
  SharedPreferences? preferences;

  static var backgroundColor = Color(0xFF121212);
  static var itemDividerColor = Color(0xFF121212);
  static var listItemColor = Color(0xFFe4841e);
  static var titleColor = Colors.white;
  static var iconColor = Colors.white;
  static var subtitleColor = Colors.white;
  static var listItemTextColor = Color(0xFF121212);
  static bool notEasterEggMode = true;
  static int colorThemeOption = 1;

  // static SharedPreferences prefs;

  final Map<int, Widget> duckDelivery = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("No", style: TextStyle(color: Colors.white, fontSize: 15.0))
  };
  final Map<int, Widget> freightLevelBonusAuto = const <int, Widget>{
    0: Text("Team", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("Duck", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    2: Text("None", style: TextStyle(color: Colors.white, fontSize: 15.0))
  };
  final Map<int, Widget> navigating = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("No", style: TextStyle(color: Colors.white, fontSize: 15.0))
  };
  final Map<int, Widget> parking = const <int, Widget>{
    0: Text("Full", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("Partly", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    2: Text("None", style: TextStyle(color: Colors.white, fontSize: 15.0))
  };
  final Map<int, Widget> hubStatus = const <int, Widget>{
    0: Text("Balanced", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("Leaning", style: TextStyle(color: Colors.white, fontSize: 15.0)),
  };
  final Map<int, Widget> sharedHubStatusChoices = const <int, Widget>{
    0: Text("Leaning", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("Balanced", style: TextStyle(color: Colors.white, fontSize: 15.0)),
  };
  final Map<int, Widget> cappingOptions = const <int, Widget>{
    0: Text("Two", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("One", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    2: Text("Zero", style: TextStyle(color: Colors.white, fontSize: 15.0)),
  };

  int conesInTerminalAuto = 0;
  int conesInGroundJunctionAuto = 0;
  int conesInLowJunctionAuto = 0;
  int conesInMedJunctionAuto = 0;
  int conesInHighJunctionAuto = 0;

  var dualScoring = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
    this.preferences!.reload();
    if (this.preferences!.containsKey("colorTheme")) {
      colorThemeOption = this.preferences!.getInt("colorTheme")!;
      colorThemeOption -= 1;
      if (colorThemeOption == -1) {
        colorThemeOption = 5;
      }
    } else {
      colorThemeOption = 2;
      this.preferences?.setInt("colorTheme", colorThemeOption + 1);
    }
    setThemeBasedOnThemeOption();
  }

  void setThemeBasedOnThemeOption() {
    if (colorThemeOption == 0) {
      backgroundColor = Color(0xFF121212);
      itemDividerColor = Color(0xFF121212);
      listItemColor = Color(0xFFe4841e);
      titleColor = Colors.white;
      iconColor = Colors.white;
      subtitleColor = Colors.white;
      listItemTextColor = Color(0xFF121212);
      colorThemeOption = 1;
    } else if (colorThemeOption == 1) {
      backgroundColor = Color(0xFFFFB600);
      itemDividerColor = Color(0xFF121212);
      listItemColor = Color(0xFFD67923);
      titleColor = Colors.white;
      iconColor = Colors.white;
      subtitleColor = Colors.white;
      listItemTextColor = Color(0xFF121212);
      colorThemeOption = 2;
    } else if (colorThemeOption == 2) {
      backgroundColor = Color(0xFF101820);
      itemDividerColor = Color(0xFF101820);
      listItemColor = Color(0xFF93D500);
      titleColor = Colors.white;
      iconColor = Colors.white;
      subtitleColor = Colors.white;
      listItemTextColor = Color(0xFF101820);
      colorThemeOption = 3;
    } else if (colorThemeOption == 3) {
      backgroundColor = Color(0xFF003670);
      itemDividerColor = Color(0xFF003670);
      listItemColor = Color(0xFF0079fa);
      titleColor = Colors.white;
      iconColor = Colors.white;
      subtitleColor = Colors.white;
      listItemTextColor = Color(0xFF121212);
      colorThemeOption = 4;
    } else if (colorThemeOption == 4) {
      backgroundColor = Color(0xFF700c01);
      itemDividerColor = Color(0xFF700c01);
      listItemColor = Color(0xFFfc1900);
      titleColor = Colors.white;
      iconColor = Colors.white;
      subtitleColor = Colors.white;
      listItemTextColor = Color(0xFF121212);
      colorThemeOption = 5;
    } else {
      backgroundColor = Color(0xFF000000);
      itemDividerColor = Color(0xFF000000);
      listItemColor = Color(0xFF242424);
      titleColor = Colors.white;
      iconColor = Colors.white;
      subtitleColor = Colors.white;
      listItemTextColor = Color(0xFFFFFFFF);
      colorThemeOption = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new ValueListenableBuilder(
        valueListenable: dualScoring,
        builder: (context, value, widget) {
          assert(value != null);
          if(value == true) {

          }
          return new CupertinoPageScaffold(
            backgroundColor: backgroundColor,
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  backgroundColor: backgroundColor,
                  largeTitle: GestureDetector(
                    onLongPress: () {
                      HapticFeedback.heavyImpact();
                      setState(() {
                        notEasterEggMode = !notEasterEggMode;
                      });
                    },
                    onTap: () {
                      HapticFeedback.heavyImpact();
                      setState(() {
                        setThemeBasedOnThemeOption();
                        this
                            .preferences
                            ?.setInt("colorTheme", colorThemeOption);

                        showToast(
                          colorThemeOption == 1
                              ? "Innov8rz Theme"
                              : colorThemeOption == 2
                              ? "Power Play Theme"
                              : colorThemeOption == 3
                              ? "FIRST ENERGIZE Theme"
                              : colorThemeOption == 4
                              ? "Blue Alliance Theme"
                              : colorThemeOption == 5
                              ? "Red Alliance Theme"
                              : "Dark Theme",
                          context: context,
                          animation: StyledToastAnimation.slideFromBottom,
                          reverseAnimation: StyledToastAnimation.fade,
                          position: StyledToastPosition.bottom,
                          animDuration: Duration(seconds: 1),
                          duration: Duration(seconds: 3),
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.linear,
                        );
                        // setThemeVariables();
                      });
                    },
                    child: Text("Score Match",
                        style: TextStyle(color: titleColor)),
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      if (value == true) {
                        dualScoring.value = false;
                        // dualScoring.notifyListeners();
                      } else {
                        dualScoring.value = true;
                        // dualScoring.notifyListeners();
                      }
                      print(value);
                    },
                    child: Icon(
                      (value == true) ? Icons.looks_two : Icons.looks_one,
                      color: iconColor,
                      // size: 35,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        HapticFeedback.lightImpact();
                        conesInTerminalAuto = 0;
                        conesInGroundJunctionAuto = 0;
                        conesInLowJunctionAuto = 0;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.refresh,
                      color: iconColor,
                      // size: 35,
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                            "Autonomous Points - " +
                                (conesInTerminalAuto * 1).toString(),
                            style: TextStyle(color: subtitleColor)),
                      ),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    notEasterEggMode
                                        ? "Cones in Terminal"
                                        : "Cones in Terminal",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "$conesInTerminalAuto",
                                                style: TextStyle(
                                                    color: listItemTextColor,
                                                    fontSize: 25))))),
                                SizedBox(width: 10),
                                Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Container(
                                            child: Align(
                                                alignment: Alignment
                                                    .centerRight,
                                                child: CupertinoButton(
                                                  color: Colors.black,
                                                  padding: EdgeInsets.zero,
                                                  child: Text("-",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 30)),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback.lightImpact();
                                                      (conesInTerminalAuto >
                                                          0)
                                                          ? conesInTerminalAuto -= 1
                                                          : conesInTerminalAuto = conesInTerminalAuto;
                                                    });
                                                  },
                                                ))))),
                                Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: CupertinoButton(
                                                color: Colors.black,
                                                padding: EdgeInsets.zero,
                                                child: Text("+",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30)),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback.lightImpact();
                                                    (conesInTerminalAuto < 12)
                                                        ? conesInTerminalAuto += 1
                                                        : conesInTerminalAuto = conesInTerminalAuto;
                                                  });
                                                },
                                              )))),
                                ),
                              ],
                            ),
                          )),
                      Divider(height: 1, color: itemDividerColor),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    notEasterEggMode
                                        ? "Cones on Ground"
                                        : "Cones on Ground",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "$conesInGroundJunctionAuto",
                                                style: TextStyle(
                                                    color: listItemTextColor,
                                                    fontSize: 25))))),
                                SizedBox(width: 10),
                                Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Container(
                                            child: Align(
                                                alignment: Alignment
                                                    .centerRight,
                                                child: CupertinoButton(
                                                  color: Colors.black,
                                                  padding: EdgeInsets.zero,
                                                  child: Text("-",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 30)),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback.lightImpact();
                                                      (conesInGroundJunctionAuto >
                                                          0)
                                                      ? conesInGroundJunctionAuto -= 1
                                                      : conesInGroundJunctionAuto = conesInGroundJunctionAuto;
                                                });
                                              },
                                            ))))),
                                Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: CupertinoButton(
                                                color: Colors.black,
                                                padding: EdgeInsets.zero,
                                                child: Text("+",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30)),
                                                onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInGroundJunctionAuto < 12)
                                                    ? conesInGroundJunctionAuto += 1
                                                    : conesInGroundJunctionAuto = conesInGroundJunctionAuto;
                                              });
                                            },
                                          )))),
                                ),
                          ],
                            ),
                          )),
                      Divider(height: 1, color: itemDividerColor),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    notEasterEggMode
                                        ? "Cones on Low"
                                        : "Cones on Low",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "$conesInLowJunctionAuto",
                                                style: TextStyle(
                                                    color: listItemTextColor,
                                                    fontSize: 25))))),
                                SizedBox(width: 10),
                                Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Container(
                                            child: Align(
                                                alignment: Alignment
                                                    .centerRight,
                                                child: CupertinoButton(
                                                  color: Colors.black,
                                                  padding: EdgeInsets.zero,
                                                  child: Text("-",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 30)),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback.lightImpact();
                                                      (conesInLowJunctionAuto >
                                                          0)
                                                          ? conesInLowJunctionAuto -= 1
                                                          : conesInLowJunctionAuto = conesInLowJunctionAuto;
                                                    });
                                                  },
                                                ))))),
                                Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: CupertinoButton(
                                                color: Colors.black,
                                                padding: EdgeInsets.zero,
                                                child: Text("+",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30)),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback.lightImpact();
                                                    (conesInLowJunctionAuto < 12)
                                                        ? conesInLowJunctionAuto += 1
                                                        : conesInLowJunctionAuto = conesInLowJunctionAuto;
                                                  });
                                                },
                                              )))),
                                ),
                              ],
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                            "Driver Controlled Points - " +
                                (0).toString(),
                            style: TextStyle(color: subtitleColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                            "End Game Points - " +
                                (0).toString(),
                            style: TextStyle(color: subtitleColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Score Breakdown",
                            style: TextStyle(color: subtitleColor)),
                      ),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text("Autonomous",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Expanded(
                                    child: Container(
                                        child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Align(
                                                alignment: Alignment
                                                    .centerRight,
                                                child: SizedBox(
                                                    child: Text(
                                                        (0).toString(),
                                                        style: TextStyle(
                                                            color:
                                                            listItemTextColor,
                                                            fontSize: 25)))))))
                              ],
                            ),
                          )),
                      Divider(height: 1, color: itemDividerColor),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text("Driver Controlled",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Expanded(
                                    child: Container(
                                        child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Align(
                                                alignment: Alignment
                                                    .centerRight,
                                                child: SizedBox(
                                                    child: Text(
                                                        (0).toString(),
                                                        style: TextStyle(
                                                            color:
                                                            listItemTextColor,
                                                            fontSize: 25)))))))
                              ],
                            ),
                          )),
                      Divider(height: 1, color: itemDividerColor),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text("End Game",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Expanded(
                                    child: Container(
                                        child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Align(
                                                alignment: Alignment
                                                    .centerRight,
                                                child: SizedBox(
                                                    child: Text(
                                                        (0).toString(),
                                                        style: TextStyle(
                                                            color:
                                                            listItemTextColor,
                                                            fontSize: 25)))))))
                              ],
                            ),
                          )),
                      Divider(height: 1, color: itemDividerColor),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text("Total",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Expanded(
                                    child: Container(
                                        child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Align(
                                                alignment: Alignment
                                                    .centerRight,
                                                child: SizedBox(
                                                    child: Text(
                                                        (0).toString(),
                                                        style: TextStyle(
                                                            color:
                                                            listItemTextColor,
                                                            fontSize: 25)))))))
                              ],
                            ),
                          )),
                      GestureDetector(
                        child: Column(
                          children: [
                            Container(height: 15, color: Colors.transparent),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 20,
                              color: Colors.transparent,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.ios_share, color: Colors.white,
                                        size: 20),
                                    Text(" Share Match",
                                        textAlign: TextAlign.center,
                                        style:
                                        TextStyle(
                                            color: Colors.white, fontSize: 20))
                                  ]
                              ),
                            ),
                            Container(height: 35, color: Colors.transparent)
                          ],
                        ),
                        onTap: () {
                          // do some easter egg here --maybe some picture background like snowflakes for winter idk
                          // or maybe a field image opens
                          Share.share("Check out the breakdown of my ${0} point match!: \n\nAutonomous Score: " + "\n\nThis was auto-generated by FTC Scorer 2021 by Mihir Chauhan");
                        },
                      ),

                    ]))
              ],
            ),
          );
        });
  }
}

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

  final Map<int, Widget> parkingOptions = const <int, Widget>{
    0: Text("Two", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("One", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    2: Text("Zero", style: TextStyle(color: Colors.white, fontSize: 15.0)),
  };

  final Map<int, Widget> circuitOptions = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("No", style: TextStyle(color: Colors.white, fontSize: 15.0))
  };

  int conesInTerminalAuto = 0;
  int conesInGroundJunctionAuto = 0;
  int conesInLowJunctionAuto = 0;
  int conesInMedJunctionAuto = 0;
  int conesInHighJunctionAuto = 0;
  int autoParkingIndex = 0;
  int autoParkingIndex2 = 0;
  int conesInTerminalTeleOp = 0;
  int conesInGroundJunctionTeleOp = 0;
  int conesInLowJunctionTeleOp = 0;
  int conesInMedJunctionTeleOp = 0;
  int conesInHighJunctionTeleOp = 0;

  int parkingEndgame = 1;
  int circuitEndgame = 2;
  int ownedConesEndGame = 0;
  int ownedBeaconsEndGame = 0;

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
      backgroundColor = Color(0xFF000000);
      itemDividerColor = Color(0xFF121212);
      listItemColor = Color(0xFF68C3E2);
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
          if (value == true) {}
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
                        conesInMedJunctionAuto = 0;
                        conesInHighJunctionAuto = 0;
                        autoParkingIndex = 0;
                        autoParkingIndex2 = 0;

                        conesInTerminalTeleOp = 0;
                        conesInGroundJunctionTeleOp = 0;
                        conesInLowJunctionTeleOp = 0;
                        conesInMedJunctionTeleOp = 0;
                        conesInHighJunctionTeleOp = 0;

                        circuitEndgame = 1;
                        parkingEndgame = 2;
                        ownedConesEndGame = 0;
                        ownedBeaconsEndGame = 0;
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
                            (conesInTerminalAuto * 1 +
                                    conesInGroundJunctionAuto * 2 +
                                    conesInLowJunctionAuto * 3 +
                                    conesInMedJunctionAuto * 4 +
                                    conesInHighJunctionAuto * 5 +
                                    (autoParkingIndex == 0
                                        ? 0
                                        : autoParkingIndex == 1
                                            ? 2
                                            : autoParkingIndex == 2
                                                ? 2
                                                : autoParkingIndex == 3
                                                    ? 10
                                                    : 20) +
                                    (autoParkingIndex2 == 0
                                        ? 0
                                        : autoParkingIndex2 == 1
                                            ? 2
                                            : autoParkingIndex2 == 2
                                                ? 2
                                                : autoParkingIndex2 == 3
                                                    ? 10
                                                    : 20))
                                .toString(),
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
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$conesInTerminalAuto",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInTerminalAuto > 0)
                                                      ? conesInTerminalAuto -= 1
                                                      : conesInTerminalAuto =
                                                          conesInTerminalAuto;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalAuto + conesInGroundJunctionAuto + conesInLowJunctionAuto + conesInMedJunctionAuto + conesInHighJunctionAuto < 12)
                                                    ? conesInTerminalAuto += 1
                                                    : conesInTerminalAuto =
                                                        conesInTerminalAuto;
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
                                    color: listItemTextColor, fontSize: 25)),
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
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInGroundJunctionAuto >
                                                          0)
                                                      ? conesInGroundJunctionAuto -=
                                                          1
                                                      : conesInGroundJunctionAuto =
                                                          conesInGroundJunctionAuto;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalAuto + conesInGroundJunctionAuto + conesInLowJunctionAuto + conesInMedJunctionAuto + conesInHighJunctionAuto < 12)
                                                    ? conesInGroundJunctionAuto +=
                                                        1
                                                    : conesInGroundJunctionAuto =
                                                        conesInGroundJunctionAuto;
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
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$conesInLowJunctionAuto",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInLowJunctionAuto > 0)
                                                      ? conesInLowJunctionAuto -=
                                                          1
                                                      : conesInLowJunctionAuto =
                                                          conesInLowJunctionAuto;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalAuto + conesInGroundJunctionAuto + conesInLowJunctionAuto + conesInMedJunctionAuto + conesInHighJunctionAuto < 12)
                                                    ? conesInLowJunctionAuto +=
                                                        1
                                                    : conesInLowJunctionAuto =
                                                        conesInLowJunctionAuto;
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
                                    ? "Cones on Med"
                                    : "Cones on Med",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$conesInMedJunctionAuto",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInMedJunctionAuto > 0)
                                                      ? conesInMedJunctionAuto -=
                                                          1
                                                      : conesInMedJunctionAuto =
                                                          conesInMedJunctionAuto;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalAuto + conesInGroundJunctionAuto + conesInLowJunctionAuto + conesInMedJunctionAuto + conesInHighJunctionAuto < 12)
                                                    ? conesInMedJunctionAuto +=
                                                        1
                                                    : conesInMedJunctionAuto =
                                                        conesInMedJunctionAuto;
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
                                    ? "Cones on High"
                                    : "Cones on High",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$conesInHighJunctionAuto",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInHighJunctionAuto > 0)
                                                      ? conesInHighJunctionAuto -=
                                                          1
                                                      : conesInHighJunctionAuto =
                                                          conesInHighJunctionAuto;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalAuto + conesInGroundJunctionAuto + conesInLowJunctionAuto + conesInMedJunctionAuto + conesInHighJunctionAuto < 12)
                                                    ? conesInHighJunctionAuto +=
                                                        1
                                                    : conesInHighJunctionAuto =
                                                        conesInHighJunctionAuto;
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
                            Text(notEasterEggMode ? "Parking" : "Parking",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer()
                          ],
                        ),
                      )),
                  Container(
                      height: 60,
                      color: listItemColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(
                                                  CupertinoIcons.chevron_left),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (autoParkingIndex > 0)
                                                      ? autoParkingIndex -= 1
                                                      : autoParkingIndex =
                                                          autoParkingIndex;
                                                });
                                              },
                                            ))))),
                            Spacer(),
                            Text(
                                autoParkingIndex == 0
                                    ? "Not Parked"
                                    : autoParkingIndex == 1
                                        ? "Terminal"
                                        : autoParkingIndex == 2
                                            ? "Substation"
                                            : autoParkingIndex == 3
                                                ? "Signal Zone"
                                                : "Sleeve Zone",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(
                                                  CupertinoIcons.chevron_right),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (autoParkingIndex < 4)
                                                      ? autoParkingIndex += 1
                                                      : autoParkingIndex =
                                                          autoParkingIndex;
                                                });
                                              },
                                            ))))),
                          ],
                        ),
                      )),
                  if (value == true) ...[
                    Divider(height: 1, color: itemDividerColor),
                    Container(
                        height: 60,
                        color: listItemColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Text(notEasterEggMode ? "Parking 2" : "Parking 2",
                                  style: TextStyle(
                                      color: listItemTextColor, fontSize: 25)),
                              Spacer()
                            ],
                          ),
                        )),
                    Container(
                        height: 60,
                        color: listItemColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: CupertinoButton(
                                                color: Colors.black,
                                                padding: EdgeInsets.zero,
                                                child: Icon(CupertinoIcons
                                                    .chevron_left),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (autoParkingIndex2 > 0)
                                                        ? autoParkingIndex2 -= 1
                                                        : autoParkingIndex2 =
                                                            autoParkingIndex2;
                                                  });
                                                },
                                              ))))),
                              Spacer(),
                              Text(
                                  autoParkingIndex2 == 0
                                      ? "Not Parked"
                                      : autoParkingIndex2 == 1
                                          ? "Terminal"
                                          : autoParkingIndex2 == 2
                                              ? "Substation"
                                              : autoParkingIndex2 == 3
                                                  ? "Signal Zone"
                                                  : "Sleeve Zone",
                                  style: TextStyle(
                                      color: listItemTextColor, fontSize: 25)),
                              Spacer(),
                              Container(
                                  child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: CupertinoButton(
                                                color: Colors.black,
                                                padding: EdgeInsets.zero,
                                                child: Icon(CupertinoIcons
                                                    .chevron_right),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (autoParkingIndex2 < 4)
                                                        ? autoParkingIndex2 += 1
                                                        : autoParkingIndex2 =
                                                            autoParkingIndex2;
                                                  });
                                                },
                                              ))))),
                            ],
                          ),
                        )),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        "Driver Controlled Points - " +
                            (conesInTerminalTeleOp * 1 +
                                    conesInGroundJunctionTeleOp * 2 +
                                    conesInLowJunctionTeleOp * 3 +
                                    conesInMedJunctionTeleOp * 4 +
                                    conesInHighJunctionTeleOp * 5)
                                .toString(),
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
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$conesInTerminalTeleOp",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInTerminalTeleOp > 0)
                                                      ? conesInTerminalTeleOp -=
                                                          1
                                                      : conesInTerminalTeleOp =
                                                          conesInTerminalTeleOp;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalTeleOp + conesInGroundJunctionTeleOp + conesInLowJunctionTeleOp + conesInMedJunctionTeleOp + conesInHighJunctionTeleOp < 30)
                                                    ? conesInTerminalTeleOp += 1
                                                    : conesInTerminalTeleOp =
                                                        conesInTerminalTeleOp;
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
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$conesInGroundJunctionTeleOp",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInGroundJunctionTeleOp >
                                                          0)
                                                      ? conesInGroundJunctionTeleOp -=
                                                          1
                                                      : conesInGroundJunctionTeleOp =
                                                          conesInGroundJunctionTeleOp;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalTeleOp + conesInGroundJunctionTeleOp + conesInLowJunctionTeleOp + conesInMedJunctionTeleOp + conesInHighJunctionTeleOp <
                                                        30)
                                                    ? conesInGroundJunctionTeleOp +=
                                                        1
                                                    : conesInGroundJunctionTeleOp =
                                                        conesInGroundJunctionTeleOp;
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
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$conesInLowJunctionTeleOp",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInLowJunctionTeleOp > 0)
                                                      ? conesInLowJunctionTeleOp -=
                                                          1
                                                      : conesInLowJunctionTeleOp =
                                                          conesInLowJunctionTeleOp;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalTeleOp + conesInGroundJunctionTeleOp + conesInLowJunctionTeleOp + conesInMedJunctionTeleOp + conesInHighJunctionTeleOp < 30)
                                                    ? conesInLowJunctionTeleOp +=
                                                        1
                                                    : conesInLowJunctionTeleOp =
                                                        conesInLowJunctionTeleOp;
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
                                    ? "Cones on Med"
                                    : "Cones on Med",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$conesInMedJunctionTeleOp",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInMedJunctionTeleOp > 0)
                                                      ? conesInMedJunctionTeleOp -=
                                                          1
                                                      : conesInMedJunctionTeleOp =
                                                          conesInMedJunctionTeleOp;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalTeleOp + conesInGroundJunctionTeleOp + conesInLowJunctionTeleOp + conesInMedJunctionTeleOp + conesInHighJunctionTeleOp < 30)
                                                    ? conesInMedJunctionTeleOp +=
                                                        1
                                                    : conesInMedJunctionTeleOp =
                                                        conesInMedJunctionTeleOp;
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
                                    ? "Cones on High"
                                    : "Cones on High",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$conesInHighJunctionTeleOp",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (conesInHighJunctionTeleOp >
                                                          0)
                                                      ? conesInHighJunctionTeleOp -=
                                                          1
                                                      : conesInHighJunctionTeleOp =
                                                          conesInHighJunctionTeleOp;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (conesInTerminalTeleOp + conesInGroundJunctionTeleOp + conesInLowJunctionTeleOp + conesInMedJunctionTeleOp + conesInHighJunctionTeleOp < 30)
                                                    ? conesInHighJunctionTeleOp +=
                                                        1
                                                    : conesInHighJunctionTeleOp =
                                                        conesInHighJunctionTeleOp;
                                              });
                                            },
                                          )))),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        "End Game Points - " +
                            (ownedConesEndGame * 3 +
                                    ownedBeaconsEndGame * 10 +
                                    (1 - circuitEndgame) * 20 +
                                    (2 - parkingEndgame) * 2)
                                .toString(),
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
                                    ? "Owned: Cone"
                                    : "Owned: Cone",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$ownedConesEndGame",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (ownedConesEndGame > 0)
                                                      ? ownedConesEndGame -= 1
                                                      : ownedConesEndGame =
                                                          ownedConesEndGame;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (ownedConesEndGame < 25)
                                                    ? ownedConesEndGame += 1
                                                    : ownedConesEndGame =
                                                        ownedConesEndGame;
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
                                    ? "Owned: Beacon"
                                    : "Owned: Beacon",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Spacer(),
                            Container(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$ownedBeaconsEndGame",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            SizedBox(width: 10),
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: Colors.black,
                                              padding: EdgeInsets.zero,
                                              child: Icon(CupertinoIcons.minus),
                                              onPressed: () {
                                                setState(() {
                                                  HapticFeedback.lightImpact();
                                                  (ownedBeaconsEndGame > 0)
                                                      ? ownedBeaconsEndGame -= 1
                                                      : ownedBeaconsEndGame =
                                                          ownedBeaconsEndGame;
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
                                            child: Icon(CupertinoIcons.plus),
                                            onPressed: () {
                                              setState(() {
                                                HapticFeedback.lightImpact();
                                                (ownedBeaconsEndGame < 2)
                                                    ? ownedBeaconsEndGame += 1
                                                    : ownedBeaconsEndGame =
                                                        ownedBeaconsEndGame;
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
                            Text(notEasterEggMode ? "Circuit" : "Circuit",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: circuitOptions,
                                              thumbColor: colorThemeOption == 0
                                                  ? const Color(0xFF353535)
                                                  : const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int? val) {
                                                setState(() {
                                                  if (val != circuitEndgame) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  circuitEndgame = val!;
                                                });
                                              },
                                              groupValue: circuitEndgame,
                                            )))))
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
                            Text(notEasterEggMode ? "Parking" : "Parking",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: parkingOptions,
                                              thumbColor: colorThemeOption == 0
                                                  ? const Color(0xFF353535)
                                                  : const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int? val) {
                                                setState(() {
                                                  if (val != parkingEndgame) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  parkingEndgame = val!;
                                                });
                                              },
                                              groupValue: parkingEndgame,
                                            )))))
                          ],
                        ),
                      )),
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
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    (conesInTerminalAuto * 1 +
                                                            conesInGroundJunctionAuto *
                                                                2 +
                                                            conesInLowJunctionAuto *
                                                                3 +
                                                            conesInMedJunctionAuto *
                                                                4 +
                                                            conesInHighJunctionAuto *
                                                                5 +
                                                            (autoParkingIndex ==
                                                                    0
                                                                ? 0
                                                                : autoParkingIndex ==
                                                                        1
                                                                    ? 2
                                                                    : autoParkingIndex ==
                                                                            2
                                                                        ? 2
                                                                        : autoParkingIndex ==
                                                                                3
                                                                            ? 10
                                                                            : 20) +
                                                            (autoParkingIndex2 ==
                                                                    0
                                                                ? 0
                                                                : autoParkingIndex2 ==
                                                                        1
                                                                    ? 2
                                                                    : autoParkingIndex2 ==
                                                                            2
                                                                        ? 2
                                                                        : autoParkingIndex2 ==
                                                                                3
                                                                            ? 10
                                                                            : 20))
                                                        .toString(),
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
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    (conesInTerminalTeleOp * 1 +
                                                            conesInGroundJunctionTeleOp *
                                                                2 +
                                                            conesInLowJunctionTeleOp *
                                                                3 +
                                                            conesInMedJunctionTeleOp *
                                                                4 +
                                                            conesInHighJunctionTeleOp *
                                                                5)
                                                        .toString(),
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
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    (ownedConesEndGame * 3 +
                                                            ownedBeaconsEndGame *
                                                                10 +
                                                            (1 - circuitEndgame) *
                                                                20 +
                                                            (2 - parkingEndgame) *
                                                                2)
                                                        .toString(),
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
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    ((conesInTerminalAuto * 1 +
                                                                conesInGroundJunctionAuto *
                                                                    2 +
                                                                conesInLowJunctionAuto *
                                                                    3 +
                                                                conesInMedJunctionAuto *
                                                                    4 +
                                                                conesInHighJunctionAuto *
                                                                    5 +
                                                                (autoParkingIndex ==
                                                                        0
                                                                    ? 0
                                                                    : autoParkingIndex ==
                                                                            1
                                                                        ? 2
                                                                        : autoParkingIndex ==
                                                                                2
                                                                            ? 2
                                                                            : autoParkingIndex ==
                                                                                    3
                                                                                ? 10
                                                                                : 20) +
                                                                (autoParkingIndex2 ==
                                                                        0
                                                                    ? 0
                                                                    : autoParkingIndex2 ==
                                                                            1
                                                                        ? 2
                                                                        : autoParkingIndex2 ==
                                                                                2
                                                                            ? 2
                                                                            : autoParkingIndex2 ==
                                                                                    3
                                                                                ? 10
                                                                                : 20)) +
                                                            (conesInTerminalTeleOp * 1 +
                                                                conesInGroundJunctionTeleOp *
                                                                    2 +
                                                                conesInLowJunctionTeleOp *
                                                                    3 +
                                                                conesInMedJunctionTeleOp *
                                                                    4 +
                                                                conesInHighJunctionTeleOp *
                                                                    5) +
                                                            (ownedConesEndGame *
                                                                    3 +
                                                                ownedBeaconsEndGame *
                                                                    10 +
                                                                (1 - circuitEndgame) *
                                                                    20 +
                                                                (2 - parkingEndgame) *
                                                                    2))
                                                        .toString(),
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
                          width: MediaQuery.of(context).size.width,
                          height: 20,
                          color: Colors.transparent,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.ios_share,
                                    color: Colors.white, size: 20),
                                Text(" Share Match",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ]),
                        ),
                        Container(height: 35, color: Colors.transparent)
                      ],
                    ),
                    onTap: () {
                      // do some easter egg here --maybe some picture background like snowflakes for winter idk
                      // or maybe a field image opens
                      Share.share(
                          "Check out the breakdown of my ${0} point match!: \n\nAutonomous Score: " +
                              "\n\nThis was auto-generated by FTC Scorer 2021 by Mihir Chauhan");
                    },
                  ),
                ]))
              ],
            ),
          );
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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
  final Map<int, Widget> wobbleGoalDelivery = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white)),
    1: Text("No", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> wobbleGoalDelivery2 = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white)),
    1: Text("No", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> powerShotAuto = const <int, Widget>{
    0: Text("0", style: TextStyle(color: Colors.white)),
    1: Text("1", style: TextStyle(color: Colors.white)),
    2: Text("2", style: TextStyle(color: Colors.white)),
    3: Text("3", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> navigating = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white)),
    1: Text("No", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> navigating2 = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white)),
    1: Text("No", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> wobbleGoalDeliveryEndGame = const <int, Widget>{
    0: Text("None", style: TextStyle(color: Colors.white)),
    1: Text("Start", style: TextStyle(color: Colors.white)),
    2: Text("Drop", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> wobbleGoalDeliveryEndGame2 = const <int, Widget>{
    0: Text("None", style: TextStyle(color: Colors.white)),
    1: Text("Start", style: TextStyle(color: Colors.white)),
    2: Text("Drop", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> powerShotEndGame = const <int, Widget>{
    0: Text("0", style: TextStyle(color: Colors.white)),
    1: Text("1", style: TextStyle(color: Colors.white)),
    2: Text("2", style: TextStyle(color: Colors.white)),
    3: Text("3", style: TextStyle(color: Colors.white))
  };

  int wobbleGoalDeliveryValueAuto = 1;
  int wobbleGoalDeliveryValueAuto2 = 1;
  int lowTowerGoalAuto = 0;
  int highTowerGoalAuto = 0;
  int midTowerGoalAuto = 0;
  int powerShotValueAuto = 0;
  int navigatingValue = 1;
  int navigatingValue2 = 1;

  int lowTowerGoalTeleOp = 0;
  int midTowerGoalTeleOp = 0;
  int highTowerGoalTeleOp = 0;

  int wobbleGoalDeliveryValueEndGame = 0;
  int wobbleGoalDeliveryValueEndGame2 = 0;
  int wobbleRings = 0;
  int powerShotValueEndGame = 0;
  var dualScoring = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new ValueListenableBuilder(
        valueListenable: dualScoring,
        builder: (context, value, widget) {
          return new CupertinoPageScaffold(
            backgroundColor: const Color(0xFF121212),
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  backgroundColor: const Color(0xFF121212),
                  largeTitle: Text("Score Match",
                      style: TextStyle(color: Colors.white)),
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
                      value ? Icons.looks_one : Icons.looks_two,
                      color: CupertinoColors.white,
                      // size: 35,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        HapticFeedback.lightImpact();
                        wobbleGoalDeliveryValueAuto = 1;
                        wobbleGoalDeliveryValueAuto2 = 1;
                        lowTowerGoalAuto = 0;
                        highTowerGoalAuto = 0;
                        midTowerGoalAuto = 0;
                        powerShotValueAuto = 0;
                        navigatingValue = 1;
                        navigatingValue2 = 1;

                        lowTowerGoalTeleOp = 0;
                        midTowerGoalTeleOp = 0;
                        highTowerGoalTeleOp = 0;

                        wobbleGoalDeliveryValueEndGame = 0;
                        wobbleGoalDeliveryValueEndGame2 = 0;
                        wobbleRings = 0;
                        powerShotValueEndGame = 0;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.refresh,
                      color: CupertinoColors.white,
                      // size: 35,
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Autonomous Points",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Wobble 1 Delivery",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: wobbleGoalDelivery,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != wobbleGoalDeliveryValueAuto) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  wobbleGoalDeliveryValueAuto =
                                                      val;
                                                });
                                              },
                                              groupValue:
                                                  wobbleGoalDeliveryValueAuto,
                                            )))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Wobble 2 Delivery",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: wobbleGoalDelivery2,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != wobbleGoalDeliveryValueAuto2) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  wobbleGoalDeliveryValueAuto2 =
                                                      val;
                                                });
                                              },
                                              groupValue:
                                                  wobbleGoalDeliveryValueAuto2,
                                            )))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Low Tower Goal",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$lowTowerGoalAuto",
                                            style: TextStyle(
                                                color: const Color(0xFF121212),
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: const Color(0xFF121212),
                                              padding: EdgeInsets.zero,
                                              child: Text("-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if(lowTowerGoalAuto > 0) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  (lowTowerGoalAuto > 0)
                                                      ? lowTowerGoalAuto -= 1
                                                      : lowTowerGoalAuto =
                                                          lowTowerGoalAuto;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: const Color(0xFF121212),
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if(lowTowerGoalAuto < 7) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (lowTowerGoalAuto < 7)
                                                  ? lowTowerGoalAuto += 1
                                                  : lowTowerGoalAuto =
                                                      lowTowerGoalAuto;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Mid Tower Goal ",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$midTowerGoalAuto",
                                            style: TextStyle(
                                                color: const Color(0xFF121212),
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: const Color(0xFF121212),
                                              padding: EdgeInsets.zero,
                                              child: Text("-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if(midTowerGoalAuto > 0) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  (midTowerGoalAuto > 0)
                                                      ? midTowerGoalAuto -= 1
                                                      : midTowerGoalAuto =
                                                          midTowerGoalAuto;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: const Color(0xFF121212),
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if(midTowerGoalAuto < 7) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (midTowerGoalAuto < 7)
                                                  ? midTowerGoalAuto += 1
                                                  : midTowerGoalAuto =
                                                      midTowerGoalAuto;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("High Tower Goal",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$highTowerGoalAuto",
                                            style: TextStyle(
                                                color: const Color(0xFF121212),
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: const Color(0xFF121212),
                                              padding: EdgeInsets.zero,
                                              child: Text("-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if(highTowerGoalAuto > 0) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  (highTowerGoalAuto > 0)
                                                      ? highTowerGoalAuto -= 1
                                                      : highTowerGoalAuto =
                                                          highTowerGoalAuto;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: const Color(0xFF121212),
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if(highTowerGoalAuto < 7) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (highTowerGoalAuto < 7)
                                                  ? highTowerGoalAuto += 1
                                                  : highTowerGoalAuto =
                                                      highTowerGoalAuto;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Power Shot",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: powerShotAuto,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != powerShotValueAuto) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  powerShotValueAuto = val;
                                                });
                                              },
                                              groupValue: powerShotValueAuto,
                                            )))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Navigating 1",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: navigating,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != navigatingValue) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  navigatingValue = val;
                                                });
                                              },
                                              groupValue: navigatingValue,
                                            )))))
                          ],
                        ),
                      )),
                  Divider(
                      height: value ? 1 : 0, color: const Color(0xFF121212)),
                  Container(
                      height: value ? 60 : 0,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Navigating 2",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: navigating2,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != navigatingValue2) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  navigatingValue2 = val;
                                                });
                                              },
                                              groupValue: navigatingValue2,
                                            )))))
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Driver Controlled Points",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Low Tower Goal",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$lowTowerGoalTeleOp",
                                            style: TextStyle(
                                                color: const Color(0xFF121212),
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: const Color(0xFF121212),
                                              padding: EdgeInsets.zero,
                                              child: Text("-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if(lowTowerGoalTeleOp > 0) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  (lowTowerGoalTeleOp > 0)
                                                      ? lowTowerGoalTeleOp -= 1
                                                      : lowTowerGoalTeleOp =
                                                          lowTowerGoalTeleOp;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: const Color(0xFF121212),
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if(lowTowerGoalTeleOp < 50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (lowTowerGoalTeleOp < 50)
                                                  ? lowTowerGoalTeleOp += 1
                                                  : lowTowerGoalTeleOp =
                                                      lowTowerGoalTeleOp;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Mid Tower Goal ",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$midTowerGoalTeleOp",
                                            style: TextStyle(
                                                color: const Color(0xFF121212),
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: const Color(0xFF121212),
                                              padding: EdgeInsets.zero,
                                              child: Text("-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if(midTowerGoalTeleOp > 0) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  (midTowerGoalTeleOp > 0)
                                                      ? midTowerGoalTeleOp -= 1
                                                      : midTowerGoalTeleOp =
                                                          midTowerGoalTeleOp;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: const Color(0xFF121212),
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if(midTowerGoalTeleOp < 50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (midTowerGoalTeleOp < 50)
                                                  ? midTowerGoalTeleOp += 1
                                                  : midTowerGoalTeleOp =
                                                      midTowerGoalTeleOp;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("High Tower Goal",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$highTowerGoalTeleOp",
                                            style: TextStyle(
                                                color: const Color(0xFF121212),
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: const Color(0xFF121212),
                                              padding: EdgeInsets.zero,
                                              child: Text("-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if(highTowerGoalTeleOp > 0) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  (highTowerGoalTeleOp > 0)
                                                      ? highTowerGoalTeleOp -= 1
                                                      : highTowerGoalTeleOp =
                                                          highTowerGoalTeleOp;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: const Color(0xFF121212),
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if(highTowerGoalTeleOp < 50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (highTowerGoalTeleOp < 50)
                                                  ? highTowerGoalTeleOp += 1
                                                  : highTowerGoalTeleOp =
                                                      highTowerGoalTeleOp;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("End Game Points",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Wobble 1 Delivery",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children:
                                                  wobbleGoalDeliveryEndGame,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != wobbleGoalDeliveryValueEndGame) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  wobbleGoalDeliveryValueEndGame =
                                                      val;
                                                });
                                              },
                                              groupValue:
                                                  wobbleGoalDeliveryValueEndGame,
                                            )))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Wobble 2 Delivery",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children:
                                                  wobbleGoalDeliveryEndGame2,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != wobbleGoalDeliveryValueEndGame2) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  wobbleGoalDeliveryValueEndGame2 =
                                                      val;
                                                });
                                              },
                                              groupValue:
                                                  wobbleGoalDeliveryValueEndGame2,
                                            )))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Wobble Rings     ",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$wobbleRings",
                                            style: TextStyle(
                                                color: const Color(0xFF121212),
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: const Color(0xFF121212),
                                              padding: EdgeInsets.zero,
                                              child: Text("-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if(wobbleRings > 0) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  (wobbleRings > 0)
                                                      ? wobbleRings -= 1
                                                      : wobbleRings =
                                                          wobbleRings;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: const Color(0xFF121212),
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if(wobbleRings < 15) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (wobbleRings < 15)
                                                  ? wobbleRings += 1
                                                  : wobbleRings = wobbleRings;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Power Shot",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            width: 150,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    int>(
                                              children: powerShotEndGame,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if(val != powerShotValueEndGame) {
                                                    HapticFeedback.lightImpact();
                                                  }
                                                  powerShotValueEndGame = val;
                                                });
                                              },
                                              groupValue: powerShotValueEndGame,
                                            )))))
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Score Breakdown",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Autonomous",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    (((wobbleGoalDeliveryValueAuto == 0) ? 15 : 0) +
                                                            ((wobbleGoalDeliveryValueAuto2 == 0)
                                                                ? 15
                                                                : 0) +
                                                            (lowTowerGoalAuto *
                                                                3) +
                                                            ((powerShotValueAuto == 1)
                                                                ? 15
                                                                : (powerShotValueAuto ==
                                                                        2)
                                                                    ? 30
                                                                    : (powerShotValueAuto ==
                                                                            3)
                                                                        ? 45
                                                                        : 0) +
                                                            (midTowerGoalAuto *
                                                                6) +
                                                            (highTowerGoalAuto *
                                                                12) +
                                                            ((navigatingValue ==
                                                                    0)
                                                                ? 5
                                                                : 0) +
                                                            (value
                                                                ? ((navigatingValue2 ==
                                                                        0)
                                                                    ? 5
                                                                    : 0)
                                                                : 0))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF121212),
                                                        fontSize: 25)))))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Driver Controlled",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    ((lowTowerGoalTeleOp) * 2 +
                                                            (midTowerGoalTeleOp *
                                                                4) +
                                                            (highTowerGoalTeleOp *
                                                                6))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF121212),
                                                        fontSize: 25)))))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("End Game",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    (((wobbleGoalDeliveryValueEndGame == 0) ? 0 : (wobbleGoalDeliveryValueEndGame == 1) ? 5 : (wobbleGoalDeliveryValueEndGame == 2) ? 20 : 0) +
                                                            ((wobbleGoalDeliveryValueEndGame2 == 0)
                                                                ? 0
                                                                : (wobbleGoalDeliveryValueEndGame2 ==
                                                                        1)
                                                                    ? 5
                                                                    : (wobbleGoalDeliveryValueEndGame2 ==
                                                                            2)
                                                                        ? 20
                                                                        : 0) +
                                                            wobbleRings * 5 +
                                                            ((powerShotValueEndGame ==
                                                                    0)
                                                                ? 0
                                                                : (powerShotValueEndGame ==
                                                                        1)
                                                                    ? 15
                                                                    : (powerShotValueEndGame ==
                                                                            2)
                                                                        ? 30
                                                                        : (powerShotValueEndGame == 3)
                                                                            ? 45
                                                                            : 0))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            const Color(0xFF121212),
                                                        fontSize: 25)))))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: const Color(0xFF121212)),
                  Container(
                      height: 60,
                      color: const Color(0xFFe4841e),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text("Total",
                                style: TextStyle(
                                    color: const Color(0xFF121212),
                                    fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(
                                                    (((wobbleGoalDeliveryValueAuto == 0) ? 15 : 0) +
                                                            ((wobbleGoalDeliveryValueAuto2 == 0)
                                                                ? 15
                                                                : 0) +
                                                            (lowTowerGoalAuto *
                                                                3) +
                                                            ((powerShotValueAuto == 1)
                                                                ? 15
                                                                : (powerShotValueAuto == 2)
                                                                    ? 30
                                                                    : (powerShotValueAuto == 3)
                                                                        ? 45
                                                                        : 0) +
                                                            (midTowerGoalAuto *
                                                                6) +
                                                            (highTowerGoalAuto *
                                                                12) +
                                                            ((navigatingValue == 0)
                                                                ? 5
                                                                : 0) +
                                                            (value
                                                                ? ((navigatingValue2 == 0)
                                                                    ? 5
                                                                    : 0)
                                                                : 0) +
                                                            ((lowTowerGoalTeleOp) * 2 +
                                                                (midTowerGoalTeleOp *
                                                                    4) +
                                                                (highTowerGoalTeleOp *
                                                                    6)) +
                                                            ((wobbleGoalDeliveryValueEndGame == 0)
                                                                ? 0
                                                                : (wobbleGoalDeliveryValueEndGame == 1)
                                                                    ? 5
                                                                    : (wobbleGoalDeliveryValueEndGame == 2)
                                                                        ? 20
                                                                        : 0) +
                                                            ((wobbleGoalDeliveryValueEndGame2 == 0)
                                                                ? 0
                                                                : (wobbleGoalDeliveryValueEndGame2 == 1)
                                                                    ? 5
                                                                    : (wobbleGoalDeliveryValueEndGame2 == 2)
                                                                        ? 20
                                                                        : 0) +
                                                            wobbleRings * 5 +
                                                            ((powerShotValueEndGame == 0)
                                                                ? 0
                                                                : (powerShotValueEndGame == 1) ? 15 : (powerShotValueEndGame == 2) ? 30 : (powerShotValueEndGame == 3) ? 45 : 0))
                                                        .toString(),
                                                    style: TextStyle(color: const Color(0xFF121212), fontSize: 25)))))))
                          ],
                        ),
                      )),
                ]))
              ],
            ),
          );
        });
  }
}

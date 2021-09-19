import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// import 'package:shared_preferences/shared_preferences.dart';

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
    0: Text("Yes", style: TextStyle(color: Colors.white)),
    1: Text("No", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> freightLevelBonusAuto = const <int, Widget>{
    0: Text("Duck", style: TextStyle(color: Colors.white)),
    1: Text("Team", style: TextStyle(color: Colors.white)),
    2: Text("None", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> navigating = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white)),
    1: Text("No", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> parking = const <int, Widget>{
    0: Text("Full", style: TextStyle(color: Colors.white)),
    1: Text("Partly", style: TextStyle(color: Colors.white)),
    2: Text("None", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> hubStatus = const <int, Widget>{
    0: Text("Balanced", style: TextStyle(color: Colors.white)),
    1: Text("Leaning", style: TextStyle(color: Colors.white)),
  };
  final Map<int, Widget> cappingOptions = const <int, Widget>{
    0: Text("Two", style: TextStyle(color: Colors.white)),
    1: Text("One", style: TextStyle(color: Colors.white)),
    2: Text("Zero", style: TextStyle(color: Colors.white)),
  };

  int carouselDuckDeliveryAuto = 1;
  int freightInStorageUnitAuto = 0;
  int freightInShippingHubAuto = 0;
  int freightLevelAutoBonus = 2;
  int navigatingValueAutoR1 = 1;
  int navigatingStorageUnitValueAutoR1 = 2;
  int navigatingWarehouseValueAutoR1 = 2;
  int navigatingValueAutoR2 = 1;
  int navigatingStorageUnitValueAutoR2 = 2;
  int navigatingWarehouseValueAutoR2 = 2;
  int navigatingScoreAuto = 0;
  int navigatingScoreAutoR2 = 0;

  int freightInStorageUnitTeleOp = 0;
  int freightInShippingHubLevel1 = 0;
  int freightInShippingHubLevel2 = 0;
  int freightInSharedShippingHub = 0;
  int freightInShippingHubLevel3 = 0;

  int duckOrTeamElementDelivery = 0;
  int shippingHubStatus = 1;
  int sharedHubStatus = 1;
  int robot1Park = 2;
  int robot2Park = 2;
  int capping = 2;

  var dualScoring = ValueNotifier<bool>(false);

  // int i = 0;
  // void readThemeVariables() async {
  //   if(i == 0) {
  //     i++;
  //   } else {
  //     return;
  //   }
  //   try {
  //     prefs = await SharedPreferences.getInstance();
  //     setState(() {
  //       colorThemeOption = (prefs.getInt('colorThemeOption') ?? 0) + 1;
  //       print('ColorThemeOption $colorThemeOption');
  //     });
  //   } catch (e) {
  //     print('errorroror: $e');
  //     SharedPreferences.setMockInitialValues({"colorThemeOption": 0});
  //     prefs = await SharedPreferences.getInstance();
  //     setState(() {
  //       colorThemeOption = ((prefs.getInt('colorThemeOption') ?? 0) + 2) % 2;
  //       print('ColorThemeOption $colorThemeOption');
  //     });
  //   }
  // }
  //
  // void setThemeVariables() async {
  //   await prefs.setInt('colorThemeOption', colorThemeOption);
  //
  //   int testcolorThemeOption = (prefs.getInt('colorThemeOption') ?? 0);
  //   print('ColorThemeOption $testcolorThemeOption');
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // readThemeVariables();
    return new ValueListenableBuilder(
        valueListenable: dualScoring,
        builder: (context, value, widget) {
          return new CupertinoPageScaffold(
            backgroundColor: backgroundColor,
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  backgroundColor: backgroundColor,
                  largeTitle: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        notEasterEggMode = !notEasterEggMode;
                      });
                    },
                    onTap: () {
                      setState(() {
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
                          backgroundColor = Color(0xFFA5CA18);
                          itemDividerColor = Color(0xFF121212);
                          listItemColor = Color(0xFF68C3E2);
                          titleColor = Colors.white;
                          iconColor = Colors.white;
                          subtitleColor = Colors.white;
                          listItemTextColor = Color(0xFF121212);
                          colorThemeOption = 2;
                        } else if (colorThemeOption == 2) {
                          backgroundColor = Color(0xFF314c77);
                          itemDividerColor = Color(0xFF5dbca1);
                          listItemColor = Color(0xFFdab045);
                          titleColor = Colors.white;
                          iconColor = Colors.white;
                          subtitleColor = Colors.white;
                          listItemTextColor = Color(0xFF121212);
                          colorThemeOption = 3;
                        } else {
                          backgroundColor = Color(0xFF121212);
                          itemDividerColor = Color(0xFF000000);
                          listItemColor = Color(0xFF8c8c8c);
                          titleColor = Colors.white;
                          iconColor = Colors.white;
                          subtitleColor = Colors.white;
                          listItemTextColor = Color(0xFF121212);
                          colorThemeOption = 0;
                        }

                        showToast(
                          colorThemeOption == 2
                              ? "Freight Frenzy Theme"
                              : colorThemeOption == 3
                                  ? "FIRST Forward Theme"
                                  : colorThemeOption == 1 ? "Team Innov8rz Theme" : "Monochrome Theme",
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
                      value ? Icons.looks_two : Icons.looks_one,
                      color: iconColor,
                      // size: 35,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        HapticFeedback.lightImpact();
                        carouselDuckDeliveryAuto = 1;
                        freightInStorageUnitAuto = 0;
                        freightInShippingHubAuto = 0;
                        freightLevelAutoBonus = 2;
                        navigatingValueAutoR1 = 1;
                        navigatingStorageUnitValueAutoR1 = 2;
                        navigatingWarehouseValueAutoR1 = 2;
                        navigatingValueAutoR2 = 1;
                        navigatingStorageUnitValueAutoR2 = 2;
                        navigatingWarehouseValueAutoR2 = 2;
                        navigatingScoreAuto = 0;
                        navigatingScoreAutoR2 = 0;

                        freightInStorageUnitTeleOp = 0;
                        freightInShippingHubLevel1 = 0;
                        freightInShippingHubLevel2 = 0;
                        freightInSharedShippingHub = 0;
                        freightInShippingHubLevel3 = 0;

                        duckOrTeamElementDelivery = 0;
                        shippingHubStatus = 1;
                        sharedHubStatus = 1;
                        robot1Park = 2;
                        robot2Park = 2;
                        capping = 2;
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
                    child: Text("Autonomous Points",
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
                                    ? "Duck Delivery"
                                    : "🐤 Delivery",
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
                                              children: duckDelivery,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if (val !=
                                                      carouselDuckDeliveryAuto) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  carouselDuckDeliveryAuto =
                                                      val;
                                                });
                                              },
                                              groupValue:
                                                  carouselDuckDeliveryAuto,
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
                            Text(
                                notEasterEggMode
                                    ? "Freight in Storage"
                                    : "📦 in Storage Unit",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$freightInStorageUnitAuto",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (freightInStorageUnitAuto >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (freightInStorageUnitAuto > 0)
                                                      ? freightInStorageUnitAuto -=
                                                          1
                                                      : freightInStorageUnitAuto =
                                                          freightInStorageUnitAuto;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (freightInStorageUnitAuto <
                                                  50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (freightInStorageUnitAuto < 50)
                                                  ? freightInStorageUnitAuto +=
                                                      1
                                                  : freightInStorageUnitAuto =
                                                      freightInStorageUnitAuto;
                                            });
                                          },
                                        )))),
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
                                    ? "Freight in Hub      "
                                    : "📦 in Hub               ",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("$freightInShippingHubAuto",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (freightInShippingHubAuto >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (freightInShippingHubAuto > 0)
                                                      ? freightInShippingHubAuto -=
                                                          1
                                                      : freightInShippingHubAuto =
                                                          freightInShippingHubAuto;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (freightInShippingHubAuto <
                                                  50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (freightInShippingHubAuto < 50)
                                                  ? freightInShippingHubAuto +=
                                                      1
                                                  : freightInShippingHubAuto =
                                                      freightInShippingHubAuto;
                                            });
                                          },
                                        )))),
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
                                notEasterEggMode ? "Freight Bonus" : "📦 Bonus",
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
                                              children: freightLevelBonusAuto,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if (val !=
                                                      freightLevelAutoBonus) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  freightLevelAutoBonus = val;
                                                });
                                              },
                                              groupValue: freightLevelAutoBonus,
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
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                    notEasterEggMode
                                        ? "Parking 1"
                                        : "🅿 Parking 1",
                                    style: TextStyle(
                                        color: listItemTextColor,
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
                                                  backgroundColor:
                                                      Colors.black45,
                                                  onValueChanged: (int val) {
                                                    setState(() {
                                                      if (val !=
                                                          navigatingValueAutoR1) {
                                                        HapticFeedback
                                                            .lightImpact();
                                                      }
                                                      navigatingValueAutoR1 =
                                                          val;
                                                      if (navigatingValueAutoR1 ==
                                                          1) {
                                                        navigatingScoreAuto = 0;
                                                        navigatingWarehouseValueAutoR1 =
                                                            2;
                                                        navigatingStorageUnitValueAutoR1 =
                                                            2;
                                                      }
                                                    });
                                                  },
                                                  groupValue:
                                                      navigatingValueAutoR1,
                                                )))))
                              ],
                            ),
                          ],
                        ),
                      )),
                  navigatingValueAutoR1 == 0
                      ? Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Text("    Storage Unit",
                                        style: TextStyle(
                                            color: listItemTextColor,
                                            fontSize: 25)),
                                    Expanded(
                                        child: Container(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                    width: 150,
                                                    child:
                                                        CupertinoSlidingSegmentedControl<
                                                            int>(
                                                      children: parking,
                                                      thumbColor: const Color(
                                                          0xFF121212),
                                                      backgroundColor:
                                                          Colors.black45,
                                                      onValueChanged:
                                                          (int val) {
                                                        setState(() {
                                                          if (val !=
                                                              navigatingStorageUnitValueAutoR1) {
                                                            HapticFeedback
                                                                .lightImpact();
                                                          }
                                                          navigatingStorageUnitValueAutoR1 =
                                                              val;
                                                          if (navigatingStorageUnitValueAutoR1 !=
                                                              2) {
                                                            navigatingScoreAuto =
                                                                (navigatingStorageUnitValueAutoR1 ==
                                                                        0
                                                                    ? 6
                                                                    : 3);
                                                            navigatingWarehouseValueAutoR1 =
                                                                2;
                                                          }
                                                        });
                                                      },
                                                      groupValue:
                                                          navigatingStorageUnitValueAutoR1,
                                                    )))))
                                  ],
                                ),
                              ],
                            ),
                          ))
                      : SizedBox(height: 0),
                  navigatingValueAutoR1 == 0
                      ? Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Text("    Warehouse",
                                        style: TextStyle(
                                            color: listItemTextColor,
                                            fontSize: 25)),
                                    Expanded(
                                        child: Container(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                    width: 150,
                                                    child:
                                                        CupertinoSlidingSegmentedControl<
                                                            int>(
                                                      children: parking,
                                                      thumbColor: const Color(
                                                          0xFF121212),
                                                      backgroundColor:
                                                          Colors.black45,
                                                      onValueChanged:
                                                          (int val) {
                                                        setState(() {
                                                          if (val !=
                                                              navigatingWarehouseValueAutoR1) {
                                                            HapticFeedback
                                                                .lightImpact();
                                                          }
                                                          navigatingWarehouseValueAutoR1 =
                                                              val;
                                                          if (navigatingWarehouseValueAutoR1 !=
                                                              2) {
                                                            navigatingScoreAuto =
                                                                (navigatingWarehouseValueAutoR1 ==
                                                                        0
                                                                    ? 10
                                                                    : 5);
                                                            navigatingStorageUnitValueAutoR1 =
                                                                2;
                                                          }
                                                        });
                                                      },
                                                      groupValue:
                                                          navigatingWarehouseValueAutoR1,
                                                    )))))
                                  ],
                                ),
                              ],
                            ),
                          ))
                      : SizedBox(height: 0),

                  // TODO: Add Dual Scorer's Park Option Here

                  Divider(height: 1, color: itemDividerColor),
                  value
                      ? Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Text(
                                        notEasterEggMode
                                            ? "Parking 2"
                                            : "🅿 Parking 2",
                                        style: TextStyle(
                                            color: listItemTextColor,
                                            fontSize: 25)),
                                    Expanded(
                                        child: Container(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                    width: 150,
                                                    child:
                                                        CupertinoSlidingSegmentedControl<
                                                            int>(
                                                      children: navigating,
                                                      thumbColor: const Color(
                                                          0xFF121212),
                                                      backgroundColor:
                                                          Colors.black45,
                                                      onValueChanged:
                                                          (int val) {
                                                        setState(() {
                                                          if (val !=
                                                              navigatingValueAutoR2) {
                                                            HapticFeedback
                                                                .lightImpact();
                                                          }
                                                          navigatingValueAutoR2 =
                                                              val;
                                                          if (navigatingValueAutoR2 ==
                                                              1) {
                                                            navigatingScoreAutoR2 =
                                                                0;
                                                            navigatingWarehouseValueAutoR2 =
                                                                2;
                                                            navigatingStorageUnitValueAutoR2 =
                                                                2;
                                                          }
                                                        });
                                                      },
                                                      groupValue:
                                                          navigatingValueAutoR2,
                                                    )))))
                                  ],
                                ),
                              ],
                            ),
                          ))
                      : SizedBox(height: 0),
                  navigatingValueAutoR2 == 0 && value
                      ? Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Text("    Storage Unit",
                                        style: TextStyle(
                                            color: listItemTextColor,
                                            fontSize: 25)),
                                    Expanded(
                                        child: Container(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                    width: 150,
                                                    child:
                                                        CupertinoSlidingSegmentedControl<
                                                            int>(
                                                      children: parking,
                                                      thumbColor: const Color(
                                                          0xFF121212),
                                                      backgroundColor:
                                                          Colors.black45,
                                                      onValueChanged:
                                                          (int val) {
                                                        setState(() {
                                                          if (val !=
                                                              navigatingStorageUnitValueAutoR2) {
                                                            HapticFeedback
                                                                .lightImpact();
                                                          }
                                                          navigatingStorageUnitValueAutoR2 =
                                                              val;
                                                          if (navigatingStorageUnitValueAutoR2 !=
                                                              2) {
                                                            navigatingScoreAutoR2 =
                                                                (navigatingStorageUnitValueAutoR2 ==
                                                                        0
                                                                    ? 6
                                                                    : 3);
                                                            navigatingWarehouseValueAutoR2 =
                                                                2;
                                                          }
                                                        });
                                                      },
                                                      groupValue:
                                                          navigatingStorageUnitValueAutoR2,
                                                    )))))
                                  ],
                                ),
                              ],
                            ),
                          ))
                      : SizedBox(height: 0),
                  navigatingValueAutoR2 == 0 && value
                      ? Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Text("    Warehouse",
                                        style: TextStyle(
                                            color: listItemTextColor,
                                            fontSize: 25)),
                                    Expanded(
                                        child: Container(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                    width: 150,
                                                    child:
                                                        CupertinoSlidingSegmentedControl<
                                                            int>(
                                                      children: parking,
                                                      thumbColor: const Color(
                                                          0xFF121212),
                                                      backgroundColor:
                                                          Colors.black45,
                                                      onValueChanged:
                                                          (int val) {
                                                        setState(() {
                                                          if (val !=
                                                              navigatingWarehouseValueAutoR2) {
                                                            HapticFeedback
                                                                .lightImpact();
                                                          }
                                                          navigatingWarehouseValueAutoR2 =
                                                              val;
                                                          if (navigatingWarehouseValueAutoR2 !=
                                                              2) {
                                                            navigatingScoreAutoR2 =
                                                                (navigatingWarehouseValueAutoR2 ==
                                                                        0
                                                                    ? 10
                                                                    : 5);
                                                            navigatingStorageUnitValueAutoR2 =
                                                                2;
                                                          }
                                                        });
                                                      },
                                                      groupValue:
                                                          navigatingWarehouseValueAutoR2,
                                                    )))))
                                  ],
                                ),
                              ],
                            ),
                          ))
                      : SizedBox(height: 0),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Driver Controlled Points",
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
                                    ? "Freight in Storage"
                                    : "📦 in Storage Unit",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$freightInStorageUnitTeleOp",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (freightInStorageUnitTeleOp >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (freightInStorageUnitTeleOp >
                                                          0)
                                                      ? freightInStorageUnitTeleOp -=
                                                          1
                                                      : freightInStorageUnitTeleOp =
                                                          freightInStorageUnitTeleOp;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (freightInStorageUnitTeleOp <
                                                  50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (freightInStorageUnitTeleOp < 50)
                                                  ? freightInStorageUnitTeleOp +=
                                                      1
                                                  : freightInStorageUnitTeleOp =
                                                      freightInStorageUnitTeleOp;
                                            });
                                          },
                                        )))),
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
                                    ? "Freight in Hub L1 "
                                    : "📦 in Hub Level 1 ",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$freightInShippingHubLevel1",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (freightInShippingHubLevel1 >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (freightInShippingHubLevel1 >
                                                          0)
                                                      ? freightInShippingHubLevel1 -=
                                                          1
                                                      : freightInShippingHubLevel1 =
                                                          freightInShippingHubLevel1;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (freightInShippingHubLevel1 <
                                                  50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (freightInShippingHubLevel1 < 50)
                                                  ? freightInShippingHubLevel1 +=
                                                      1
                                                  : freightInShippingHubLevel1 =
                                                      freightInShippingHubLevel1;
                                            });
                                          },
                                        )))),
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
                                    ? "Freight in Hub L2 "
                                    : "📦 in Hub Level 2 ",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$freightInShippingHubLevel2",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (freightInShippingHubLevel2 >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (freightInShippingHubLevel2 >
                                                          0)
                                                      ? freightInShippingHubLevel2 -=
                                                          1
                                                      : freightInShippingHubLevel2 =
                                                          freightInShippingHubLevel2;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (freightInShippingHubLevel2 <
                                                  50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (freightInShippingHubLevel2 < 50)
                                                  ? freightInShippingHubLevel2 +=
                                                      1
                                                  : freightInShippingHubLevel2 =
                                                      freightInShippingHubLevel2;
                                            });
                                          },
                                        )))),
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
                                    ? "Freight in Hub L3 "
                                    : "📦 in Hub Level 3 ",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$freightInShippingHubLevel3",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (freightInShippingHubLevel3 >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (freightInShippingHubLevel3 >
                                                          0)
                                                      ? freightInShippingHubLevel3 -=
                                                          1
                                                      : freightInShippingHubLevel3 =
                                                          freightInShippingHubLevel3;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (freightInShippingHubLevel3 <
                                                  50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (freightInShippingHubLevel3 < 50)
                                                  ? freightInShippingHubLevel3 +=
                                                      1
                                                  : freightInShippingHubLevel3 =
                                                      freightInShippingHubLevel3;
                                            });
                                          },
                                        )))),
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
                                    ? "Freight in Shared "
                                    : "📦 in Shared Hub ",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$freightInSharedShippingHub",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (freightInSharedShippingHub >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (freightInSharedShippingHub >
                                                          0)
                                                      ? freightInSharedShippingHub -=
                                                          1
                                                      : freightInSharedShippingHub =
                                                          freightInSharedShippingHub;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (freightInSharedShippingHub <
                                                  50) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (freightInSharedShippingHub < 50)
                                                  ? freightInSharedShippingHub +=
                                                      1
                                                  : freightInSharedShippingHub =
                                                      freightInSharedShippingHub;
                                            });
                                          },
                                        )))),
                          ],
                        ),
                      )),
                  Divider(height: 1, color: itemDividerColor),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("End Game Points",
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
                                    ? "Carousel Delivery"
                                    : "🐤/👥 Delivery     ",
                                style: TextStyle(
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "$duckOrTeamElementDelivery",
                                            style: TextStyle(
                                                color: listItemTextColor,
                                                fontSize: 25))))),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CupertinoButton(
                                              color: listItemTextColor,
                                              padding: EdgeInsets.zero,
                                              child: Text("–",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              onPressed: () {
                                                setState(() {
                                                  if (duckOrTeamElementDelivery >
                                                      0) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  (duckOrTeamElementDelivery >
                                                          0)
                                                      ? duckOrTeamElementDelivery -=
                                                          1
                                                      : duckOrTeamElementDelivery =
                                                          duckOrTeamElementDelivery;
                                                });
                                              },
                                            ))))),
                            Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          color: listItemTextColor,
                                          padding: EdgeInsets.zero,
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                          onPressed: () {
                                            setState(() {
                                              if (duckOrTeamElementDelivery <
                                                  12) {
                                                HapticFeedback.lightImpact();
                                              }
                                              (duckOrTeamElementDelivery < 12)
                                                  ? duckOrTeamElementDelivery +=
                                                      1
                                                  : duckOrTeamElementDelivery =
                                                      duckOrTeamElementDelivery;
                                            });
                                          },
                                        )))),
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
                                    ? "Shipping Hub"
                                    : "🚢 Shipping Hub",
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
                                              children: hubStatus,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if (val !=
                                                      shippingHubStatus) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  shippingHubStatus = val;
                                                });
                                              },
                                              groupValue: shippingHubStatus,
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
                            Text(
                                notEasterEggMode
                                    ? "Shared Hub"
                                    : "🔗 Shared Hub",
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
                                              children: hubStatus,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if (val != sharedHubStatus) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  sharedHubStatus = val;
                                                });
                                              },
                                              groupValue: sharedHubStatus,
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
                            Text(
                                notEasterEggMode ? "Parking 1" : "🅿 Parking 1",
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
                                              children: parking,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if (val != robot1Park) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  robot1Park = val;
                                                });
                                              },
                                              groupValue: robot1Park,
                                            )))))
                          ],
                        ),
                      )),
                  Divider(height: 1, color: itemDividerColor),
                  value
                      ? Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    notEasterEggMode
                                        ? "Parking 2"
                                        : "🅿 Parking 2",
                                    style: TextStyle(
                                        color: listItemTextColor,
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
                                                  children: parking,
                                                  thumbColor:
                                                      const Color(0xFF121212),
                                                  backgroundColor:
                                                      Colors.black45,
                                                  onValueChanged: (int val) {
                                                    setState(() {
                                                      if (val != robot2Park) {
                                                        HapticFeedback
                                                            .lightImpact();
                                                      }
                                                      robot2Park = val;
                                                    });
                                                  },
                                                  groupValue: robot2Park,
                                                )))))
                              ],
                            ),
                          ))
                      : SizedBox(height: 0),
                  value
                      ? Divider(height: 1, color: itemDividerColor)
                      : SizedBox(height: 0),
                  Container(
                      height: 60,
                      color: listItemColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text(notEasterEggMode ? "Capping" : "🧢 Capping",
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
                                              children: cappingOptions,
                                              thumbColor:
                                                  const Color(0xFF121212),
                                              backgroundColor: Colors.black45,
                                              onValueChanged: (int val) {
                                                setState(() {
                                                  if (val != capping) {
                                                    HapticFeedback
                                                        .lightImpact();
                                                  }
                                                  capping = val;
                                                });
                                              },
                                              groupValue: capping,
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
                                                    (((carouselDuckDeliveryAuto ==
                                                                    0)
                                                                ? 10
                                                                : 0) +
                                                            (freightInStorageUnitAuto *
                                                                2) +
                                                            (freightInShippingHubAuto *
                                                                6) +
                                                            (freightLevelAutoBonus ==
                                                                    0
                                                                ? 10
                                                                : freightLevelAutoBonus ==
                                                                        1
                                                                    ? 20
                                                                    : 0) +
                                                            navigatingScoreAuto +
                                                            (value
                                                                ? navigatingScoreAutoR2
                                                                : 0))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF121212),
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
                                                    ((freightInStorageUnitTeleOp * 1) +
                                                            (freightInShippingHubLevel1 *
                                                                2) +
                                                            (freightInShippingHubLevel2 *
                                                                4) +
                                                            (freightInShippingHubLevel3 *
                                                                6) +
                                                            (freightInSharedShippingHub *
                                                                4))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF121212),
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
                                                    ((duckOrTeamElementDelivery *
                                                                6) +
                                                            (shippingHubStatus ==
                                                                    0
                                                                ? 10
                                                                : 0) +
                                                            (sharedHubStatus ==
                                                                    0
                                                                ? 20
                                                                : 0) +
                                                            (robot1Park == 0
                                                                ? 6
                                                                : robot1Park ==
                                                                        1
                                                                    ? 3
                                                                    : 0) +
                                                            (dualScoring.value
                                                                ? (robot2Park ==
                                                                        0
                                                                    ? 6
                                                                    : robot2Park ==
                                                                            1
                                                                        ? 3
                                                                        : 0)
                                                                : 0) +
                                                            (capping == 0
                                                                ? 30
                                                                : capping == 1
                                                                    ? 15
                                                                    : 0))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF121212),
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
                                                    ((((carouselDuckDeliveryAuto ==
                                                                        0)
                                                                    ? 10
                                                                    : 0) +
                                                                (freightInStorageUnitAuto *
                                                                    2) +
                                                                (freightInShippingHubAuto *
                                                                    6) +
                                                                (freightLevelAutoBonus ==
                                                                        0
                                                                    ? 10
                                                                    : freightLevelAutoBonus ==
                                                                            1
                                                                        ? 20
                                                                        : 0) +
                                                                navigatingScoreAuto +
                                                                (value
                                                                    ? navigatingScoreAutoR2
                                                                    : 0)) +
                                                            ((freightInStorageUnitTeleOp * 1) +
                                                                (freightInShippingHubLevel1 *
                                                                    2) +
                                                                (freightInShippingHubLevel2 *
                                                                    4) +
                                                                (freightInShippingHubLevel3 *
                                                                    6) +
                                                                (freightInSharedShippingHub *
                                                                    4)) +
                                                            ((duckOrTeamElementDelivery *
                                                                    6) +
                                                                (shippingHubStatus ==
                                                                        0
                                                                    ? 10
                                                                    : 0) +
                                                                (sharedHubStatus ==
                                                                        0
                                                                    ? 20
                                                                    : 0) +
                                                                (robot1Park == 0
                                                                    ? 6
                                                                    : robot1Park ==
                                                                            1
                                                                        ? 3
                                                                        : 0) +
                                                                (dualScoring
                                                                        .value
                                                                    ? (robot2Park ==
                                                                            0
                                                                        ? 6
                                                                        : robot2Park ==
                                                                                1
                                                                            ? 3
                                                                            : 0)
                                                                    : 0) +
                                                                (capping == 0
                                                                    ? 30
                                                                    : capping ==
                                                                            1
                                                                        ? 15
                                                                        : 0)))
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            listItemTextColor,
                                                        fontSize: 25)))))))
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

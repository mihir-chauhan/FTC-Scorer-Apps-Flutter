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
  static var backgroundColor = Color(0xFF121212);
  static var itemDividerColor = Color(0xFF121212);
  static var listItemColor = Color(0xFFe4841e);
  static var titleColor = Colors.white;
  static var iconColor = Colors.white;
  static var subtitleColor = Colors.white;
  static var listItemTextColor = Color(0xFF121212);
  static bool innov8rzColorScheme = true;

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
  final Map<int, Widget> autoStorageUnitParking = const <int, Widget>{
    0: Text("Full", style: TextStyle(color: Colors.white)),
    1: Text("Partly", style: TextStyle(color: Colors.white)),
    2: Text("None", style: TextStyle(color: Colors.white))
  };
  final Map<int, Widget> autoWarehouseParking = const <int, Widget>{
    0: Text("Full", style: TextStyle(color: Colors.white)),
    1: Text("Partly", style: TextStyle(color: Colors.white)),
    2: Text("None", style: TextStyle(color: Colors.white))
  };

  int carouselDuckDeliveryAuto = 1;
  int freightInStorageUnitAuto = 0;
  int freightInShippingHubAuto = 0;
  int freightLevelAutoBonus = 2;
  int navigatingValueAuto = 1;
  int navigatingStorageUnitValueAuto = 2;
  int navigatingWarehouseValueAuto = 2;
  int navigatingScoreAuto = 0;

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
            backgroundColor: backgroundColor,
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  backgroundColor: backgroundColor,
                  largeTitle: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (innov8rzColorScheme) {
                          backgroundColor = Color(0xFFCFE385);
                          itemDividerColor = Color(0xFF1E5AA8);
                          listItemColor = Color(0xFF68C3E2);
                          titleColor = Colors.white;
                          iconColor = Colors.white;
                          subtitleColor = Colors.white;
                          listItemTextColor = Color(0xFF121212);
                          innov8rzColorScheme = false;
                        } else {
                          backgroundColor = Color(0xFF121212);
                          itemDividerColor = Color(0xFF121212);
                          listItemColor = Color(0xFFe4841e);
                          titleColor = Colors.white;
                          iconColor = Colors.white;
                          subtitleColor = Colors.white;
                          listItemTextColor = Color(0xFF121212);
                          innov8rzColorScheme = true;
                        }
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
                      value ? Icons.looks_one : Icons.looks_two,
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
                        navigatingValueAuto = 1;
                        navigatingStorageUnitValueAuto = 2;
                        navigatingWarehouseValueAuto = 2;
                        navigatingScoreAuto = 0;
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
                                innov8rzColorScheme
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
                                innov8rzColorScheme
                                    ? "Freight in Storage"
                                    : "📦 in Storage Unit  ",
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
                                innov8rzColorScheme
                                    ? "Freight in Hub      "
                                    : "📦 in Shipping Hub",
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
                                innov8rzColorScheme
                                    ? "Freight Bonus"
                                    : "📦 Bonus",
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
                                    innov8rzColorScheme
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
                                                          navigatingValueAuto) {
                                                        HapticFeedback
                                                            .lightImpact();
                                                      }
                                                      navigatingValueAuto = val;
                                                      if(navigatingValueAuto == 1) {
                                                        navigatingScoreAuto = 0;
                                                        navigatingWarehouseValueAuto = 2;
                                                        navigatingStorageUnitValueAuto = 2;
                                                      }
                                                    });
                                                  },
                                                  groupValue:
                                                      navigatingValueAuto,
                                                )))))
                              ],
                            ),
                          ],
                        ),
                      )),
                  navigatingValueAuto == 0
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
                                                      children:
                                                          autoStorageUnitParking,
                                                      thumbColor: const Color(
                                                          0xFF121212),
                                                      backgroundColor:
                                                          Colors.black45,
                                                      onValueChanged:
                                                          (int val) {
                                                        setState(() {
                                                          if (val !=
                                                              navigatingStorageUnitValueAuto) {
                                                            HapticFeedback
                                                                .lightImpact();
                                                          }
                                                          navigatingStorageUnitValueAuto =
                                                              val;
                                                          if (navigatingStorageUnitValueAuto !=
                                                              2) {
                                                            navigatingScoreAuto = (navigatingStorageUnitValueAuto == 0 ? 6 : 3);
                                                            navigatingWarehouseValueAuto =
                                                                2;
                                                          }
                                                        });
                                                      },
                                                      groupValue:
                                                          navigatingStorageUnitValueAuto,
                                                    )))))
                                  ],
                                ),
                              ],
                            ),
                          ))
                      : SizedBox(height: 0),
                  navigatingValueAuto == 0
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
                                                      children:
                                                          autoWarehouseParking,
                                                      thumbColor: const Color(
                                                          0xFF121212),
                                                      backgroundColor:
                                                          Colors.black45,
                                                      onValueChanged:
                                                          (int val) {
                                                        setState(() {
                                                          if (val !=
                                                              navigatingWarehouseValueAuto) {
                                                            HapticFeedback
                                                                .lightImpact();
                                                          }
                                                          navigatingWarehouseValueAuto =
                                                              val;
                                                          if (navigatingWarehouseValueAuto !=
                                                              2) {
                                                            navigatingScoreAuto = (navigatingWarehouseValueAuto == 0 ? 10 : 5);
                                                            navigatingStorageUnitValueAuto =
                                                                2;
                                                          }
                                                        });
                                                      },
                                                      groupValue:
                                                          navigatingWarehouseValueAuto,
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("End Game Points",
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
                                    color: listItemTextColor, fontSize: 25)),
                            Expanded(
                                child: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                child: Text(( ((carouselDuckDeliveryAuto == 0) ? 10 : 0) + (freightInStorageUnitAuto * 2) + (freightInShippingHubAuto * 6) + (freightLevelAutoBonus == 0 ? 10 : freightLevelAutoBonus == 1 ? 20 : 0) + navigatingScoreAuto).toString(),
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
                                                child: Text((1).toString(),
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
                                                child: Text((1).toString(),
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
                                                child: Text((1).toString(),
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

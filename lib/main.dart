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

  final Map<int, Widget> autoNavigationOptions = const <int, Widget>{
    0: Text("Yes", style: TextStyle(color: Colors.white, fontSize: 15.0)),
    1: Text("No", style: TextStyle(color: Colors.white, fontSize: 15.0)),
  };

  int autoNavigationVal = 1;
  int autoNavigationVal2 = 1;
  int backstagePixelsAuto = 0;
  int backdropPixelsAuto = 0;
  int spikeMarkIndex = 0;
  int spikeMarkIndex2 = 0;
  int yellowPixelIndex = 0;
  int yellowPixelIndex2 = 0;

  int backstagePixelsTeleOp = 0;
  int backdropPixelsTeleOp = 0;
  int mosaicTeleOp = 0;
  int setBonusTeleOp = 0;

  int suspendingEndgame = 2;
  int parkingEndgame = 2;
  int droneLaunchIndex = 0;
  int droneLaunchIndex2 = 0;


  var dualScoring = ValueNotifier<bool>(false);

  ScrollController controller = new ScrollController();

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
      listItemColor = Color(0xFFFFB600);
      titleColor = Colors.white;
      iconColor = Colors.white;
      subtitleColor = Colors.white;
      listItemTextColor = Color(0xFF121212);
      colorThemeOption = 2;
    } else if (colorThemeOption == 2) {
      backgroundColor = Color(0xFF101820);
      itemDividerColor = Color(0xFF101820);
      listItemColor = Color(0xFFD22E92);
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

  bool showScoreInHeader = false;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.hasClients) {
        if (controller.position.pixels > 50 && !showScoreInHeader) {
          setState(() {
            showScoreInHeader = true;
          });
        } else if (controller.position.pixels <= 50 && showScoreInHeader) {
          setState(() {
            showScoreInHeader = false;
          });
        }
      }
    });
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
              controller: controller,
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
                              ? "CENTERSTAGE Theme"
                              : colorThemeOption == 3
                              ? "FIRST IN SHOW Theme"
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
                    child: Text(
                        !showScoreInHeader
                            ? "Score Match"
                            : "Score Match: ${01}",
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
                          autoNavigationVal = 1;
                          autoNavigationVal2 = 1;
                          backstagePixelsAuto = 0;
                          backdropPixelsAuto = 0;
                          spikeMarkIndex = 0;
                          spikeMarkIndex2 = 0;
                          yellowPixelIndex = 0;
                          yellowPixelIndex2 = 0;

                          backstagePixelsTeleOp = 0;
                          backdropPixelsTeleOp = 0;
                          mosaicTeleOp = 0;
                          setBonusTeleOp = 0;

                          suspendingEndgame = 2;
                          parkingEndgame = 2;
                          droneLaunchIndex = 0;
                          droneLaunchIndex2 = 0;
                        });
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              CupertinoIcons.refresh,
                              color: iconColor,
                            ),
                          ))),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Autonomous Points - " +
                            ((autoNavigationVal == 1 ? 0 : 5) +
                                (value == true ? (autoNavigationVal2 == 1 ? 0 : 5) : 0) +
                                (backstagePixelsAuto * 3) +
                                (backdropPixelsAuto * 5) +
                                (spikeMarkIndex == 0 ? 0 : spikeMarkIndex == 1 ? 10 : 20) +
                                (value == true ? (spikeMarkIndex2 == 0 ? 0 : spikeMarkIndex2 == 1 ? 10 : 20) : 0) +
                                (yellowPixelIndex == 0 ? 0 : yellowPixelIndex == 1 ? 10 : 20) +
                                (value == true ? (yellowPixelIndex2 == 0 ? 0 : yellowPixelIndex2 == 1 ? 10 : 20) : 0)
                            ).toString(),
                            style: TextStyle(color: subtitleColor)),
                      ),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text(notEasterEggMode
                                    ? "Navigating"
                                    : "Navigating",
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
                                                  children: autoNavigationOptions,
                                                  thumbColor: colorThemeOption ==
                                                      0
                                                      ? const Color(0xFF353535)
                                                      : const Color(0xFF121212),
                                                  backgroundColor: Colors
                                                      .black45,
                                                  onValueChanged: (int? val) {
                                                    setState(() {
                                                      if (val !=
                                                          autoNavigationVal) {
                                                        HapticFeedback
                                                            .lightImpact();
                                                      }
                                                      autoNavigationVal = val!;
                                                    });
                                                  },
                                                  groupValue: autoNavigationVal,
                                                )))))
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
                                  Text(notEasterEggMode
                                      ? "Navigating 2"
                                      : "Navigating 2",
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
                                                    children: autoNavigationOptions,
                                                    thumbColor: colorThemeOption ==
                                                        0
                                                        ? const Color(0xFF353535)
                                                        : const Color(0xFF121212),
                                                    backgroundColor: Colors
                                                        .black45,
                                                    onValueChanged: (int? val) {
                                                      setState(() {
                                                        if (val !=
                                                            autoNavigationVal2) {
                                                          HapticFeedback
                                                              .lightImpact();
                                                        }
                                                        autoNavigationVal2 = val!;
                                                      });
                                                    },
                                                    groupValue: autoNavigationVal2,
                                                  )))))
                                ],
                              ),
                            )),
                      ],
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
                                        ? "Backstage Pixels"
                                        : "Backstage Pixels",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text("$backstagePixelsAuto",
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
                                                  child: Icon(
                                                      CupertinoIcons.minus,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (backstagePixelsAuto > 0)
                                                          ?
                                                      backstagePixelsAuto -= 1
                                                          : backstagePixelsAuto =
                                                          backstagePixelsAuto;
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
                                                child: Icon(CupertinoIcons.plus,
                                                    color: iconColor),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (backstagePixelsAuto +
                                                        backdropPixelsAuto <
                                                        30)
                                                        ?
                                                    backstagePixelsAuto += 1
                                                        : backstagePixelsAuto =
                                                        backstagePixelsAuto;
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
                                        ? "Backdrop Pixels"
                                        : "Backdrop Pixels",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text("$backdropPixelsAuto",
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
                                                  child: Icon(
                                                      CupertinoIcons.minus,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (backdropPixelsAuto > 0)
                                                          ?
                                                      backdropPixelsAuto -= 1
                                                          : backdropPixelsAuto =
                                                          backdropPixelsAuto;
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
                                                child: Icon(CupertinoIcons.plus,
                                                    color: iconColor),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (backdropPixelsAuto +
                                                        backstagePixelsAuto <
                                                        30)
                                                        ?
                                                    backdropPixelsAuto += 1
                                                        : backdropPixelsAuto =
                                                        backdropPixelsAuto;
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
                                Text(notEasterEggMode
                                    ? "Spike Mark"
                                    : "Spike Mark",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
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
                                                alignment: Alignment
                                                    .centerRight,
                                                child: CupertinoButton(
                                                  color: Colors.black,
                                                  padding: EdgeInsets.zero,
                                                  child: Icon(
                                                      CupertinoIcons
                                                          .chevron_left,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (spikeMarkIndex > 0)
                                                          ? spikeMarkIndex -= 1
                                                          : spikeMarkIndex =
                                                          spikeMarkIndex;
                                                    });
                                                  },
                                                ))))),
                                Spacer(),
                                Text(
                                    spikeMarkIndex == 0
                                        ? "Not Placed"
                                        : spikeMarkIndex == 1
                                        ? "White Pixel"
                                        : "Team Prop",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
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
                                                  child: Icon(
                                                      CupertinoIcons
                                                          .chevron_right,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (spikeMarkIndex < 2)
                                                          ? spikeMarkIndex += 1
                                                          : spikeMarkIndex =
                                                          spikeMarkIndex;
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
                                  Text(notEasterEggMode
                                      ? "Spike Mark 2"
                                      : "Spike Mark 2",
                                      style: TextStyle(
                                          color: listItemTextColor,
                                          fontSize: 25)),
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
                                                  alignment: Alignment
                                                      .centerRight,
                                                  child: CupertinoButton(
                                                    color: Colors.black,
                                                    padding: EdgeInsets.zero,
                                                    child: Icon(
                                                        CupertinoIcons
                                                            .chevron_left,
                                                        color: iconColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        HapticFeedback
                                                            .lightImpact();
                                                        (spikeMarkIndex2 > 0)
                                                            ?
                                                        spikeMarkIndex2 -= 1
                                                            : spikeMarkIndex2 =
                                                            spikeMarkIndex2;
                                                      });
                                                    },
                                                  ))))),
                                  Spacer(),
                                  Text(
                                      spikeMarkIndex2 == 0
                                          ? "Not Placed"
                                          : spikeMarkIndex2 == 1
                                          ? "White Pixel"
                                          : "Team Prop",
                                      style: TextStyle(
                                          color: listItemTextColor,
                                          fontSize: 25)),
                                  Spacer(),
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
                                                    child: Icon(
                                                        CupertinoIcons
                                                            .chevron_right,
                                                        color: iconColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        HapticFeedback
                                                            .lightImpact();
                                                        (spikeMarkIndex2 < 4)
                                                            ?
                                                        spikeMarkIndex2 += 1
                                                            : spikeMarkIndex2 =
                                                            spikeMarkIndex2;
                                                      });
                                                    },
                                                  ))))),
                                ],
                              ),
                            )),
                      ],
                      Divider(height: 1, color: itemDividerColor),
                      Container(
                          height: 60,
                          color: listItemColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Text(notEasterEggMode
                                    ? "Yellow Pixel"
                                    : "Yellow Pixel",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
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
                                                alignment: Alignment
                                                    .centerRight,
                                                child: CupertinoButton(
                                                  color: Colors.black,
                                                  padding: EdgeInsets.zero,
                                                  child: Icon(
                                                      CupertinoIcons
                                                          .chevron_left,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (yellowPixelIndex > 0)
                                                          ?
                                                      yellowPixelIndex -= 1
                                                          : yellowPixelIndex =
                                                          yellowPixelIndex;
                                                    });
                                                  },
                                                ))))),
                                Spacer(),
                                Text(
                                    yellowPixelIndex == 0
                                        ? "Not Placed"
                                        : yellowPixelIndex == 1
                                        ? "White Pixel"
                                        : "Team Prop",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
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
                                                  child: Icon(
                                                      CupertinoIcons
                                                          .chevron_right,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (yellowPixelIndex < 2)
                                                          ?
                                                      yellowPixelIndex += 1
                                                          : yellowPixelIndex =
                                                          yellowPixelIndex;
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
                                  Text(notEasterEggMode
                                      ? "Yellow Pixel 2"
                                      : "Yellow Pixel 2",
                                      style: TextStyle(
                                          color: listItemTextColor,
                                          fontSize: 25)),
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
                                                  alignment: Alignment
                                                      .centerRight,
                                                  child: CupertinoButton(
                                                    color: Colors.black,
                                                    padding: EdgeInsets.zero,
                                                    child: Icon(
                                                        CupertinoIcons
                                                            .chevron_left,
                                                        color: iconColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        HapticFeedback
                                                            .lightImpact();
                                                        (yellowPixelIndex2 > 0)
                                                            ?
                                                        yellowPixelIndex2 -= 1
                                                            : yellowPixelIndex2 =
                                                            yellowPixelIndex2;
                                                      });
                                                    },
                                                  ))))),
                                  Spacer(),
                                  Text(
                                      yellowPixelIndex2 == 0
                                          ? "Not Placed"
                                          : yellowPixelIndex2 == 1
                                          ? "White Pixel"
                                          : "Team Prop",
                                      style: TextStyle(
                                          color: listItemTextColor,
                                          fontSize: 25)),
                                  Spacer(),
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
                                                    child: Icon(
                                                        CupertinoIcons
                                                            .chevron_right,
                                                        color: iconColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        HapticFeedback
                                                            .lightImpact();
                                                        (yellowPixelIndex2 < 4)
                                                            ?
                                                        yellowPixelIndex2 += 1
                                                            : yellowPixelIndex2 =
                                                            yellowPixelIndex2;
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
                                (backdropPixelsTeleOp * 3 + backstagePixelsTeleOp * 1 + mosaicTeleOp * 10 + setBonusTeleOp * 10).toString(),
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
                                        ? "Backstage Pixels"
                                        : "Backstage Pixels",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "$backstagePixelsTeleOp",
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
                                                  child: Icon(
                                                      CupertinoIcons.minus,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (backstagePixelsTeleOp >
                                                          0)
                                                          ?
                                                      backstagePixelsTeleOp -=
                                                      1
                                                          : backstagePixelsTeleOp =
                                                          backstagePixelsTeleOp;
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
                                                child: Icon(CupertinoIcons.plus,
                                                    color: iconColor),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (backstagePixelsTeleOp +
                                                        backdropPixelsTeleOp <
                                                        94)
                                                        ?
                                                    backstagePixelsTeleOp += 1
                                                        : backstagePixelsTeleOp =
                                                        backstagePixelsTeleOp;
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
                                        ? "Backdrop Pixels"
                                        : "Backdrop Pixels",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "$backdropPixelsTeleOp",
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
                                                  child: Icon(
                                                      CupertinoIcons.minus,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (backdropPixelsTeleOp >
                                                          0)
                                                          ?
                                                      backdropPixelsTeleOp -=
                                                      1
                                                          : backdropPixelsTeleOp =
                                                          backdropPixelsTeleOp;
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
                                                child: Icon(CupertinoIcons.plus,
                                                    color: iconColor),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (backstagePixelsTeleOp +
                                                        backdropPixelsTeleOp <
                                                        94)
                                                        ?
                                                    backdropPixelsTeleOp +=
                                                    1
                                                        : backdropPixelsTeleOp =
                                                        backdropPixelsTeleOp;
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
                                        ? "Mosaics"
                                        : "Mosaics",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "$mosaicTeleOp",
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
                                                  child: Icon(
                                                      CupertinoIcons.minus,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (mosaicTeleOp >
                                                          0)
                                                          ?
                                                      mosaicTeleOp -=
                                                      1
                                                          : mosaicTeleOp =
                                                          mosaicTeleOp;
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
                                                child: Icon(CupertinoIcons.plus,
                                                    color: iconColor),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (mosaicTeleOp <
                                                        10)
                                                        ?
                                                    mosaicTeleOp +=
                                                    1
                                                        : mosaicTeleOp =
                                                        mosaicTeleOp;
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
                                        ? "Set Bonus"
                                        : "Set Bonus",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
                                Container(
                                    child: Container(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "$setBonusTeleOp",
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
                                                  child: Icon(
                                                      CupertinoIcons.minus,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (setBonusTeleOp >
                                                          0)
                                                          ?
                                                      setBonusTeleOp -=
                                                      1
                                                          : setBonusTeleOp =
                                                          setBonusTeleOp;
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
                                                child: Icon(CupertinoIcons.plus,
                                                    color: iconColor),
                                                onPressed: () {
                                                  setState(() {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    (setBonusTeleOp <
                                                        3)
                                                        ?
                                                    setBonusTeleOp +=
                                                    1
                                                        : setBonusTeleOp =
                                                        setBonusTeleOp;
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
                                (((2-suspendingEndgame) * 20)
                                    + ((2-parkingEndgame) * 5)
                                    + (droneLaunchIndex == 0 ? 0 : droneLaunchIndex == 1 ? 30 : droneLaunchIndex == 2 ? 20 : 10)
                                    + (value == true ? (droneLaunchIndex2 == 0 ? 0 : droneLaunchIndex2 == 1 ? 30 : droneLaunchIndex2 == 2 ? 20 : 10) : 0))
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
                                Text(notEasterEggMode ? "Suspending" : "Suspending",
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
                                                  children: parkingOptions,
                                                  thumbColor: colorThemeOption ==
                                                      0
                                                      ? const Color(0xFF353535)
                                                      : const Color(0xFF121212),
                                                  backgroundColor: Colors
                                                      .black45,
                                                  onValueChanged: (int? val) {
                                                    setState(() {
                                                      if (val !=
                                                          suspendingEndgame) {
                                                        HapticFeedback
                                                            .lightImpact();
                                                      }
                                                      suspendingEndgame = val!;
                                                      if(parkingEndgame != 2 && suspendingEndgame != 2) {
                                                        if(suspendingEndgame == 0) {
                                                          parkingEndgame = 2;
                                                        } else if(suspendingEndgame == 1) {
                                                          parkingEndgame = 1;
                                                        }
                                                      }
                                                    });
                                                  },
                                                  groupValue: suspendingEndgame,
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
                                                  children: parkingOptions,
                                                  thumbColor: colorThemeOption ==
                                                      0
                                                      ? const Color(0xFF353535)
                                                      : const Color(0xFF121212),
                                                  backgroundColor: Colors
                                                      .black45,
                                                  onValueChanged: (int? val) {
                                                    setState(() {
                                                      if (val !=
                                                          parkingEndgame) {
                                                        HapticFeedback
                                                            .lightImpact();
                                                      }
                                                      parkingEndgame = val!;
                                                      if(suspendingEndgame != 2 && parkingEndgame != 2) {
                                                        if(parkingEndgame == 0) {
                                                          suspendingEndgame = 2;
                                                        } else if(parkingEndgame == 1) {
                                                          suspendingEndgame = 1;
                                                        }
                                                      }
                                                    });
                                                  },
                                                  groupValue: parkingEndgame,
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
                                Text(notEasterEggMode
                                    ? "Drone Launch"
                                    : "Drone Launch",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
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
                                                alignment: Alignment
                                                    .centerRight,
                                                child: CupertinoButton(
                                                  color: Colors.black,
                                                  padding: EdgeInsets.zero,
                                                  child: Icon(
                                                      CupertinoIcons
                                                          .chevron_left,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (droneLaunchIndex > 0)
                                                          ? droneLaunchIndex -= 1
                                                          : droneLaunchIndex =
                                                          droneLaunchIndex;
                                                    });
                                                  },
                                                ))))),
                                Spacer(),
                                Text(
                                    droneLaunchIndex == 0
                                        ? "Not Launched"
                                        : droneLaunchIndex == 1
                                        ? "Zone 1"
                                        : droneLaunchIndex == 1
                                        ? "Zone 2"
                                        : "Zone 3",
                                    style: TextStyle(
                                        color: listItemTextColor,
                                        fontSize: 25)),
                                Spacer(),
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
                                                  child: Icon(
                                                      CupertinoIcons
                                                          .chevron_right,
                                                      color: iconColor),
                                                  onPressed: () {
                                                    setState(() {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      (droneLaunchIndex < 3)
                                                          ? droneLaunchIndex += 1
                                                          : droneLaunchIndex =
                                                          droneLaunchIndex;
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
                                  Text(notEasterEggMode
                                      ? "Drone Launch 2"
                                      : "Drone Launch 2",
                                      style: TextStyle(
                                          color: listItemTextColor,
                                          fontSize: 25)),
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
                                                  alignment: Alignment
                                                      .centerRight,
                                                  child: CupertinoButton(
                                                    color: Colors.black,
                                                    padding: EdgeInsets.zero,
                                                    child: Icon(
                                                        CupertinoIcons
                                                            .chevron_left,
                                                        color: iconColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        HapticFeedback
                                                            .lightImpact();
                                                        (droneLaunchIndex2 > 0)
                                                            ? droneLaunchIndex2 -= 1
                                                            : droneLaunchIndex2 =
                                                            droneLaunchIndex2;
                                                      });
                                                    },
                                                  ))))),
                                  Spacer(),
                                  Text(
                                      droneLaunchIndex2 == 0
                                          ? "Not Launched"
                                          : droneLaunchIndex2 == 1
                                          ? "Zone 1"
                                          : droneLaunchIndex2 == 1
                                          ? "Zone 2"
                                          : "Zone 3",
                                      style: TextStyle(
                                          color: listItemTextColor,
                                          fontSize: 25)),
                                  Spacer(),
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
                                                    child: Icon(
                                                        CupertinoIcons
                                                            .chevron_right,
                                                        color: iconColor),
                                                    onPressed: () {
                                                      setState(() {
                                                        HapticFeedback
                                                            .lightImpact();
                                                        (droneLaunchIndex2 < 3)
                                                            ? droneLaunchIndex2 += 1
                                                            : droneLaunchIndex2 =
                                                            droneLaunchIndex2;
                                                      });
                                                    },
                                                  ))))),
                                ],
                              ),
                            )),
                      ],
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
                                                    child: Text(((autoNavigationVal == 1 ? 0 : 5) +
                                                        (value == true ? (autoNavigationVal2 == 1 ? 0 : 5) : 0) +
                                                        (backstagePixelsAuto * 3) +
                                                        (backdropPixelsAuto * 5) +
                                                        (spikeMarkIndex == 0 ? 0 : spikeMarkIndex == 1 ? 10 : 20) +
                                                        (value == true ? (spikeMarkIndex2 == 0 ? 0 : spikeMarkIndex2 == 1 ? 10 : 20) : 0) +
                                                        (yellowPixelIndex == 0 ? 0 : yellowPixelIndex == 1 ? 10 : 20) +
                                                        (value == true ? (yellowPixelIndex2 == 0 ? 0 : yellowPixelIndex2 == 1 ? 10 : 20) : 0)
                                                    ).toString(),
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
                                                        (backdropPixelsTeleOp * 3 + backstagePixelsTeleOp * 1 + mosaicTeleOp * 10 + setBonusTeleOp * 10)
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
                                                        (0)
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
                                                    child: Text((01).toString(),
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
                          Share.share("Check out the breakdown of my ${0}\n" +
                              "Cones in Terminal: ${0}\n" +
                              "Cones on Ground Junction: ${0}\n" +
                              "Cones on Low Junction: ${0}\n" +
                              "Cones on Medium Junction: ${0}\n" +
                              "Cones on High Junction: ${0}\n" +
                              "Robot 1 Parking: ${0}\n" +
                              (value == true
                                  ? "Robot 1 Parking: ${0}\n"
                                  : "") +
                              "\nDriver Controlled Score: ${0}\n" +
                              "Cones in Terminal: ${0}\n" +
                              "Cones on Ground Junction: ${0}\n" +
                              "Cones on Low Junction: ${0}\n" +
                              "Cones on Medium Junction: ${0}\n" +
                              "Cones on High Junction: ${0}\n" +
                              "\nEnd Game Score: ${0}\n" +
                              "Owned Junctions with Cones: ${0}\n" +
                              "Owned Junctions with Beacon: ${0}\n" +
                              "Circuit Complete: ${0}\n" +
                              "Parked Robots: ${0}\n" +
                              "\n\nThis was auto-generated by FTC Scorer 2023 by Mihir Chauhan");
                        },
                      ),
                    ]))
              ],
            ),
          );
        });
  }
}

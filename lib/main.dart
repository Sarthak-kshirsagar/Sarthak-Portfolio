import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fading_in_widget/fading_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:portfolio/sectoins/profilePage.dart';
import 'package:portfolio/sectoins/tabbarview.dart';
import 'package:portfolio/sectoins/widgets/buttonsP.dart';
import 'package:portfolio/sectoins/tabbarview.dart';
import 'package:portfolio/sectoins/widgets/dummypage.dart';
import 'package:portfolio/sectoins/widgets/projectInfo.dart';
import 'package:portfolio/sectoins/widgets/projectLandingPage.dart';
import 'package:portfolio/sectoins/widgets/tabbarr.dart';
import 'package:portfolio/sectoins/widgets/videoPlayerr.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:video_player/video_player.dart';
import 'package:portfolio/sectoins/widgets/projectInfo.dart';
//hi this is the dummydata
void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LandingPage(
      scrollToWidget: () {},
    ),
  ));
}

class LandingPage extends StatefulWidget {
  final VoidCallback scrollToWidget;
  LandingPage({super.key, required this.scrollToWidget});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  // Color c1 = Colors.red;
  ScrollController scroll1 = new ScrollController();
  double ht = 0;
  late TabController _tabController;
  ScrollController s1 = new ScrollController();
  double heightTab = 0;
  double projectPageOccurance = 400;
  double contactPafeOccurance = 1500;
  bool isProjecVisible = false;
  bool isContactVisible = false;

  bool isTechStackVisible = false;
  bool isProgrammingLanguagesVisible = false;
  bool isContactPageVisible = false;

  double techStackHeight = 0;
  double programmingLanguageHeight = 0;
  double contactPageHeight = 0;
  void assignHeights() {
    double screenSize = MediaQuery.of(context).size.width;
    if (screenSize > 600 && screenSize <= 800) {
      setState(() {
        techStackHeight = 500;
        programmingLanguageHeight = 1300;
        contactPageHeight = 1800;
      });
    } else if (screenSize <= 600) {
      setState(() {
        techStackHeight = 200;
        programmingLanguageHeight = 500;
        contactPageHeight = 1600;
      });
    }
  }

  ScrollController mobileWidgetScrollController = new ScrollController();

  void mobileDeviceWidgetsVisibility() {
    setState(() {
      isTechStackVisible =
          mobileWidgetScrollController.offset >= techStackHeight;
      isProgrammingLanguagesVisible =
          mobileWidgetScrollController.offset >= programmingLanguageHeight;
      isContactPageVisible =
          mobileWidgetScrollController.offset >= contactPageHeight;
    });
  }

  void scrollToWidget(double scrollHeight) {
    s1.animateTo(scrollHeight,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  void scrollToWigetMobile(double mobileWidgetOccurance) {
    Navigator.pop(context);
    mobileWidgetScrollController.animateTo(mobileWidgetOccurance,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  showdialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Container(
                // color: Colors.white,
                // child: VideoPlayerr(),

                ),
          ),
        );
      },
    );
  }

  bool isLoadedContent = false;
  void loadingEffect() {
    Future.delayed(Duration(seconds: 40));
    setState(() {
      isLoadedContent = true;
    });
    print("done");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadingEffect();
    mobileWidgetScrollController.addListener(mobileDeviceWidgetsVisibility);
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);

    setState(() {
      heightTab = 1150;
    });
    _tabController.addListener(() {
      setState(() {
        switch (_tabController.index) {
          case 0:
            heightTab = 1150;
            break;
          case 1:
            heightTab = 800;
            break;
          case 2:
            heightTab = 800;
            break;
        }
      });

      scroll1.addListener(() {
        if (scroll1.offset == 0) {
          _tabController.animateTo(0);
        }
      });
    });
    // Size deviceSize= MediaQuery.of(context).size;
    // if(deviceSize.width>600){
    //
    // }else{
    //   _tabController.addListener(() {
    //     setState(() {
    //       switch(_tabController.index){
    //         case 0:
    //           heightTab =300;
    //           break;
    //         case 1:
    //           heightTab = 300;
    //           break;
    //         case 2:
    //           heightTab=300;
    //           break;
    //       }
    //     });
    //   });
    // }
    s1.addListener(onscroll);
  }

  void onscroll() {
    setState(() {
      isProjecVisible = s1.offset >= projectPageOccurance;
      isContactVisible = s1.offset >= contactPafeOccurance;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    scroll1.dispose(); // Dispose of the ScrollController
    super.dispose();
  }

  Helloo h1 = new Helloo();
  bool showTab1 = true;
  bool showTab2 = false;
  bool showTab3 = false;
  void toShowTab2() {
    setState(() {
      showTab1 = false;
      showTab2 = true;
      showTab3 = false;
    });
  }

  void toShowTab3() {
    setState(() {
      showTab1 = false;
      showTab2 = false;
      showTab3 = true;
    });
  }

  void toShowTab1() {
    setState(() {
      showTab1 = true;
      showTab2 = false;
      showTab3 = false;
      print("executed");
    });
  }

  Color c1 = Colors.red;
  Color allProjects = Colors.grey;
  Color LatestProjects = Colors.grey;
  Color UpcomingProjects = Colors.grey;
  void showProjectBottomborder(bool tab1, bool tab2, bool tab3) {
    if (tab1 == true) {
      setState(() {
        allProjects = Colors.purple;
        UpcomingProjects = Colors.grey;
        LatestProjects = Colors.grey;
      });
    } else if (tab2 == true) {
      setState(() {
        LatestProjects = Colors.purple;
        allProjects = Colors.grey;
        UpcomingProjects = Colors.grey;
      });
    } else if (tab3 == true) {
      setState(() {
        LatestProjects = Colors.grey;
        allProjects = Colors.grey;
        UpcomingProjects = Colors.purple;
      });
    }
  }

  void scrollToSectionMobile() {}
  bool showSocial = true;
  bool showAcademic = false;
  void showQualificationsOrSocialSection(bool a1, bool a2) {
    setState(() {
      showSocial = a1;
      showAcademic = a2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSzie = MediaQuery.of(context).size;
    assignHeights();
    loadingEffect();
//for laptops
    if (screenSzie.width > 800) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //navigation bar
              navbar(),
              // SizedBox(height: 50,),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: s1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //selfinformation ui
                          selfInfo(context),
                          SizedBox(
                            height: 50,
                          ),

                          //skill ui
                          Center(child: skillUi()),
                          // tab bar and projects
                          AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInQuad,
                            opacity: isProjecVisible ? 1.0 : 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple.shade50,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Projects",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      // width: 500,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade50,
                                      ),

                                      child: DefaultTabController(
                                          animationDuration: Duration.zero,
                                          initialIndex: 0,
                                          length: 3,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 500,
                                                child: TabBar(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  controller: _tabController,
                                                  tabs: [
                                                    Tab(
                                                      child: Text("All",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18)),
                                                    ),
                                                    Tab(
                                                      child: Text("Latest",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18)),
                                                    ),
                                                    Tab(
                                                      child: Text("Upcoming",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: heightTab,
                                                child: TabBarView(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    controller: _tabController,
                                                    children: [
                                                      Container(

                                                          // height:1500,
                                                          // width: MediaQuery.of(context).size.width,
                                                          child: AllProjects(
                                                              context)),
                                                      Container(
                                                        // height: 400,
                                                        child: Latest(context),
                                                      ),
                                                      Container(
                                                        // height: 400,
                                                        child:
                                                            Upcoming(context),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // tab bar

                          SizedBox(height: 50),
                          AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: isContactVisible ? 1.0 : 0.0,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      width: 500,
                                      height: 500,
                                      // color:Colors.black,
                                      //for button and content
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          //for buttons
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showQualificationsOrSocialSection(
                                                      true, false);
                                                },
                                                child: Container(
                                                  width: 80,
                                                  height: 80,
                                                  child: Icon(Icons.group),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showQualificationsOrSocialSection(
                                                      false, true);
                                                },
                                                child: Container(
                                                  width: 80,
                                                  height: 80,
                                                  child: Icon(
                                                      Icons.school_rounded),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //for socail content
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 10),
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/profilePic.jpg"),
                                                  radius: 50,
                                                  backgroundColor: Colors.black,
                                                ),
                                                Text("Sarthak Kshirsagar",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25)),
                                                SizedBox(height: 10),
                                                Text("App Developer"),
                                                SizedBox(height: 20),
                                                if (showSocial == true)
                                                  Column(
                                                    children: [
                                                      Container(
                                                        //for social links
                                                        child: InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            width: 250,
                                                            height: 60,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  width: 40,
                                                                  height: 40,
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/github-sign.png"),
                                                                ),
                                                                SizedBox(
                                                                  width: 40,
                                                                ),
                                                                Text("GitHub",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        //for social links
                                                        child: InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            width: 250,
                                                            height: 60,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  width: 40,
                                                                  height: 40,
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/linkedin.png"),
                                                                ),
                                                                SizedBox(
                                                                  width: 40,
                                                                ),
                                                                Text("GitHub",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        //for social links
                                                        child: InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            width: 250,
                                                            height: 60,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  width: 40,
                                                                  height: 40,
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/instagram.png"),
                                                                ),
                                                                SizedBox(
                                                                  width: 40,
                                                                ),
                                                                Text("GitHub",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (showAcademic == true)
                                                  Column(
                                                    children: [
                                                      Text("Academic Details",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16)),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 250,
                                                          height: 60,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                child: Image.asset(
                                                                    "assets/mortarboard.png"),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                  "B.Tech CSE(AI & ML)",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 250,
                                                          height: 60,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                child: Image.asset(
                                                                    "assets/school.png"),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                    "Pimpri Chinchwad College\nOf Engineering",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 250,
                                                          height: 60,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                child: Image.asset(
                                                                    "assets/patent.png"),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                  "Patent :- Optimal Crowd\nDistribution",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15,
                                                                    // color: Colors.
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 50,
                                          child: Text("Get in Touch",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              )),
                                        ),
                                        Container(
                                          width: 350,
                                          height: 350,
                                          // color:Colors.green,
                                          child: Column(
                                            children: [
                                              textfileds(Icons.perm_identity, 1,
                                                  "Full Name"),
                                              SizedBox(height: 10),
                                              textfileds(
                                                  Icons.mail, 1, "Email"),
                                              SizedBox(height: 10),
                                              textfileds(
                                                  Icons.message, 2, "Message"),
                                              SizedBox(height: 20),
                                              Container(
                                                width: 250,
                                                height: 40,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.black),
                                                      foregroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.white),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text("Contact")),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //highlights
                                  SizedBox(width: 50),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 50,
                                        child: Text("Highlights",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 20,
                                        child: Container(
                                            width: 400,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  Material(
                                                    elevation: 20,
                                                    child: Container(
                                                      width: 350,
                                                      height: 350,
                                                      child: Image.asset(
                                                          "assets/botD.jpg"),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Container(
                                                      width: 350,
                                                      height: 350,
                                                      child: Image.asset(
                                                          "assets/botD.jpg")),
                                                  SizedBox(width: 15),
                                                  Container(
                                                      width: 350,
                                                      height: 350,
                                                      child: Image.asset(
                                                          "assets/botD.jpg")),
                                                  SizedBox(width: 15),
                                                  Container(
                                                      width: 350,
                                                      height: 350,
                                                      child: Image.asset(
                                                          "assets/botD.jpg")),
                                                ],
                                              ),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              // projectSection()
            ],
          ),
        ),
      );

      // =========================tab======================
    } else if (screenSzie.width > 600 && screenSzie.width <= 799) {
      return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            // backgroundColor: Colors.purple.shade50,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    scrollToWigetMobile(40);
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.home, color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Home",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(SwipeablePageRoute(
                      builder: (context) => ProfilePageLanding(),
                    ));
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("About",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToWigetMobile(2150);
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.add_chart_rounded,
                            color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Projects",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToWigetMobile(2850);
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.mail, color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Contact",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 250,
                    child: Divider(color: Colors.grey, thickness: 1.5)),
                Text("Other Links",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/github-sign.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("GitHub",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/linkedin.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("LinkedIn",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/instagram.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Instagram",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 250,
                    child: Divider(color: Colors.grey, thickness: 1.5)),
                Text("Academic Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/mortarboard.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("B.Tech CSE(AI & ML)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/school.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Pimpri Chinchwad College\nOf Engineering",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/patent.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Patent :- Optimal Crowd\nDistribution",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              // color: Colors.
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            controller: mobileWidgetScrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("I'm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.purpleAccent)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sarthak Kshirsagar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        // width: 250.0,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Canterbury',
                          ),
                          child: Container(
                            height: 50,
                            // width: 250,
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                // ScaleAnimatedText('Frontend Developer'),
                                // ScaleAnimatedText('Backend Developer'),
                                // ScaleAnimatedText('Ai & Ml Enthusiasatic'),
                                TyperAnimatedText("Full Stack\nApp Developer",
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ))
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectLandingPage(
                                        iconLink: botIcon,
                                        videoLink: botVideo,
                                        projectName: "Sarthak",
                                        projectTagline: "as,j,adfadf",
                                        techStack: techUsed,
                                        bulletPoints: botBullet,
                                        overView: botDExplorer),
                                  ));
                            },
                            child: Text("Download Cv")),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  child:
                      Image.asset(fit: BoxFit.cover, "assets/profilePic.jpg"),
                ),

                SizedBox(
                  height: 100,
                ),
                AnimatedOpacity(
                  opacity: isTechStackVisible ? 1.0 : 0.0,
                  duration: Duration(seconds: 2),
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.purpleAccent, width: 0.5),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purpleAccent,
                              // blurStyle: BlurStyle.inner,
                              spreadRadius: 5,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Column(
                              children: [
                                Text("Tech Stack",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Divider(),
                                SizedBox(
                                  height: 15,
                                ),
                                Wrap(
                                  spacing: 25,
                                  runSpacing: 20,
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight, "flutter.png"),
                                    ),
                                    // SizedBox(width: 10,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight,
                                          "springboot.png"),
                                    ),
                                    // SizedBox(width: 10,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight, "django.png"),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight,
                                          "firebase.png"),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight,
                                          "google-cloud.png"),
                                    ),
                                    // Container(
                                    //   width: 50,
                                    //   height: 50,
                                    //
                                    //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Center(
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //
                      //     child:Wrap(
                      //       alignment: WrapAlignment.spaceEvenly,
                      //       crossAxisAlignment: WrapCrossAlignment.center,
                      //       // spacing: 5,
                      //       runSpacing: 10,
                      //       children: [
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //       ],
                      //     )
                      //
                      //
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      //number of projectss
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DottedBorder(
                                    dashPattern: [10],
                                    color: Colors.black,
                                    radius: Radius.circular(10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Text(
                                          "10 ",
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.purpleAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  // width: 250,
                                  child: Text(
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      "Projects using Flutter &\nOther Tech"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // =========================projects sections==============
                    ],
                  ),
                ),
                //sectionnnnnnnnnnnnnnnnnnnnnnnnnn
                SizedBox(
                  height: 50,
                ),
                AnimatedOpacity(
                  opacity: isProgrammingLanguagesVisible ? 1.0 : 0.0,
                  duration: Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500,
                          height: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 210,
                                    height: 280,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.pinkAccent, width: 0.5),
                                      borderRadius: BorderRadius.circular(28),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.pinkAccent,
                                          // blurStyle: BlurStyle.outer,
                                          spreadRadius: 5,
                                          blurRadius: 15,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                            textAlign: TextAlign.center,
                                            "Programming\nLanguages",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                        Divider(),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Wrap(
                                            spacing: 10,
                                            runSpacing: 20,
                                            alignment:
                                                WrapAlignment.spaceAround,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            direction: Axis.horizontal,
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                child: Image.asset(
                                                    fit: BoxFit.fitHeight,
                                                    "javaimg.png"),
                                              ),
                                              Container(
                                                width: 60,
                                                height: 60,
                                                child: Image.asset(
                                                    fit: BoxFit.fitHeight,
                                                    "cLogo.png"),
                                              ),
                                              Container(
                                                width: 60,
                                                height: 60,
                                                child: Image.asset(
                                                    "pythonLogo.jpg"),
                                              ),
                                              Container(
                                                width: 70,
                                                height: 70,
                                                child: Image.asset("dart.png"),
                                              ),
                                              // Container(
                                              //   width: 50,
                                              //   height: 50,
                                              //
                                              //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                              // ),
                                              // Container(
                                              //   width: 50,
                                              //   height: 50,
                                              //
                                              //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                              // ),
                                              // Container(
                                              //   width: 50,
                                              //   height: 50,
                                              //
                                              //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 200,
                                    height: 260,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.green, width: 0.5),
                                      borderRadius: BorderRadius.circular(28),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green,
                                          // blurStyle: BlurStyle.outer,
                                          spreadRadius: 5,
                                          blurRadius: 15,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("Tools",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                        Divider(),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 20,
                                          alignment: WrapAlignment.center,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          direction: Axis.horizontal,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 70,
                                              child: Image.asset(
                                                  fit: BoxFit.fitHeight,
                                                  "git.png"),
                                            ),
                                            Container(
                                              width: 70,
                                              height: 50,
                                              child: Image.asset(
                                                  fit: BoxFit.fitHeight,
                                                  "vslogo.jpg"),
                                            ),
                                            Container(
                                              width: 70,
                                              height: 50,
                                              child: Image.asset(
                                                  fit: BoxFit.fitHeight,
                                                  "andriods.png"),
                                            ),
                                            Container(
                                              width: 70,
                                              height: 50,
                                              child: Image.asset(
                                                  fit: BoxFit.fitHeight,
                                                  "figmaLogo.png"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Projects",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showProjectBottomborder(true, false, false);
                                    toShowTab1();
                                    print(showTab2);
                                  },
                                  child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(20),
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: allProjects, width: 2))

                                          // color: c1,

                                          ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                          "All",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    showProjectBottomborder(false, true, false);
                                    toShowTab2();
                                    print(showTab2);
                                  },
                                  child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: LatestProjects,
                                                  width: 2))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                          "Latest",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    showProjectBottomborder(false, false, true);
                                    toShowTab3();
                                  },
                                  child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: UpcomingProjects,
                                                  width: 2))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                          "Upcoming",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        if (showTab1 == true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 380,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Container(
                                width: 350,
                                height: 300,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: digiRickIcon,
                                              videoLink: digiRickVide,
                                              overView: digiRickshaw,
                                              bulletPoints: dgiRickshawBullet,
                                              techStack: digiRickshawTech,
                                              projectName: "DigiRickshaw",
                                              projectTagline: "Driving Companion"),
                                          "DigiRickshaw",
                                          "Your Driving Companion",
                                          "assets/icon.jpg"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: botIcon,
                                              videoLink: botVideo,
                                              overView: botDExplorer,
                                              bulletPoints: botBullet,
                                              techStack: techUsed,
                                              projectName: "BotDExplorer",
                                              projectTagline: "Analyze Efficiently"),
                                          "BotDExplorer",
                                          "Analyze Efficiently",
                                          "assets/botD.jpg"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: digiCommunityIcon,
                                              videoLink: digiCommunityVideo,
                                              overView: digiCommunity,
                                              bulletPoints: digiCommunityBullet,
                                              techStack: digicommunitytech,
                                              projectName: "Digi-Community",
                                              projectTagline: "Teaching Assistant"),
                                          "Digi Community",
                                          "Your Teaching Assistant",
                                          "assets/tution.jpg"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: projectLocoIcon,
                                              videoLink: projectLocoVideo,
                                              overView: projectLoco,
                                              bulletPoints: projectLocoBullet,
                                              techStack: projectLocotech,
                                              projectName: "Project Loco",
                                              projectTagline: "Optimal Crowd Distribution"),
                                          "Project Loco",
                                          "Optimal Crowd Distribution",
                                          "assets/headdetection.jpg"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: photographyAppIcon,
                                              videoLink: photographyVideo,
                                              overView: picShot,
                                              bulletPoints: picshotBullet,
                                              techStack: picshottech,
                                              projectName: "PicShot",
                                              projectTagline: "Capture,Connect,Create"),
                                          "PicShot",
                                          "Capture,Connect,Create",
                                          "assets/photography.jpg"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (showTab2 == true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 380,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Container(
                                width: 350,
                                height: 300,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      // InkWell(
                                      //
                                      //     onTap: (){
                                      //       var hii= VideoPlayerr(projectName:"asdkn", ProjectInfo:"Analyze Effectively,Insightfully", techUsed:techUsed, timeLineDates:botExpTimeLine);
                                      //       // showProjectdia(context, hi);
                                      //       Navigator.push(context, MaterialPageRoute(builder: (context) => hii,));
                                      //     },child: responsiveProjectUi("hi", "Analyze Efficiently", "assets/botD.jpg")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: digiRickIcon,
                                              videoLink: digiRickVide,
                                              overView: digiRickshaw,
                                              bulletPoints: dgiRickshawBullet,
                                              techStack: digiRickshawTech,
                                              projectName: "DigiRickshaw",
                                              projectTagline: "Driving Companion"),
                                          "DigiRickshaw",
                                          "Your Driving Companion",
                                          "assets/icon.jpg"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: botIcon,
                                              videoLink: botVideo,
                                              overView: botDExplorer,
                                              bulletPoints: botBullet,
                                              techStack: techUsed,
                                              projectName: "BotDExplorer",
                                              projectTagline: "Analyze Efficiently"),
                                          "BotDExplorer",
                                          "Analyze Efficiently",
                                          "assets/botD.jpg"),
                                     
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: projectLocoIcon,
                                              videoLink: projectLocoVideo,
                                              overView: projectLoco,
                                              bulletPoints: projectLocoBullet,
                                              techStack: projectLocotech,
                                              projectName: "Project Loco",
                                              projectTagline: "Optimal Crowd Distribution"),
                                          "Project Loco",
                                          "Optimal Crowd Distribution",
                                          "assets/headdetection.jpg"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (showTab3 == true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 380,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Container(
                                width: 350,
                                height: 300,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [

                                      SizedBox(
                                        width: 20,
                                      ),
                                     
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: digiCommunityIcon,
                                              videoLink: digiCommunityVideo,
                                              overView: digiCommunity,
                                              bulletPoints: digiCommunityBullet,
                                              techStack: digicommunitytech,
                                              projectName: "Digi-Community",
                                              projectTagline: "Teaching Assistant"),
                                          "Digi Community",
                                          "Your Teaching Assistant",
                                          "assets/tution.jpg"),
                                     
                                      SizedBox(
                                        width: 20,
                                      ),
                                      responsiveProjectUi(
                                          context,
                                          ProjectLandingPage(
                                              iconLink: photographyAppIcon,
                                              videoLink: photographyVideo,
                                              overView: picShot,
                                              bulletPoints: picshotBullet,
                                              techStack: picshottech,
                                              projectName: "PicShot",
                                              projectTagline: "Capture,Connect,Create"),
                                          "PicShot",
                                          "Capture,Connect,Create",
                                          "assets/photography.jpg"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
                // Container(
                //   height: 380,
                //   // width: 400,
                //   child:  Container(
                //     width:350,
                //     height:300,
                //     child: SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: Row(
                //
                //
                //         children: [
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 20,),
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 20,),
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 20,),
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                ,
                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: isContactPageVisible ? 1.0 : 0.0,
                  curve: Curves.linear,
                  child: Column(
                    children: [
                      Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child: Image.asset("assets/photo.jpg"),
                            ),
                            Form(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                textfileds(Icons.perm_identity, 1, "Name"),
                                SizedBox(
                                  height: 10,
                                ),
                                textfileds(Icons.mail, 1, "Email Address"),
                                SizedBox(
                                  height: 10,
                                ),
                                textfileds(Icons.message, 2, "Message"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.black),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                      onPressed: () {},
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(fontSize: 14),
                                      )),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
    }
    // =============mobile devices=========================
    else {
      return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            // backgroundColor: Colors.purple.shade50,

            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    scrollToWigetMobile(40);
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.home, color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Home",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(SwipeablePageRoute(
                      builder: (context) => ProfilePageLanding(),
                    ));
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("About",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToWigetMobile(1650);
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.add_chart_rounded,
                            color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Projects",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    scrollToWigetMobile(2350);
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Icon(Icons.mail, color: Colors.black, size: 20),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Contact",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 250,
                    child: Divider(color: Colors.grey, thickness: 1.5)),
                Text("Other Links",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/github-sign.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("GitHub",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/linkedin.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("LinkedIn",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/instagram.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Instagram",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 250,
                    child: Divider(color: Colors.grey, thickness: 1.5)),
                Text("Academic Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/mortarboard.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("B.Tech CSE(AI & ML)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/school.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Pimpri Chinchwad College\nOf Engineering",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/patent.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Patent :- Optimal Crowd\nDistribution",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              // color: Colors.
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            controller: mobileWidgetScrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLoadedContent == false) Text("hi"),
                if (isLoadedContent == true)
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("I'm",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.purpleAccent)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sarthak Kshirsagar",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          // width: 250.0,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Canterbury',
                            ),
                            child: Container(
                              height: 50,
                              // width: 250,
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  // ScaleAnimatedText('Frontend Developer'),
                                  // ScaleAnimatedText('Backend Developer'),
                                  // ScaleAnimatedText('Ai & Ml Enthusiasatic'),
                                  TyperAnimatedText("Full Stack\nApp Developer",
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ))
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProjectLandingPage(
                                          iconLink: botIcon,
                                          videoLink: botVideo,
                                          projectName: "Sarthak",
                                          projectTagline: "as,j,adfadf",
                                          techStack: techUsed,
                                          bulletPoints: botBullet,
                                          overView: botDExplorer),
                                    ));
                              },
                              child: Text("Download Cv")),
                        ),
                      ],
                    ),
                  ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  child:
                      Image.asset(fit: BoxFit.cover, "assets/profilePic.jpg"),
                ),

                SizedBox(
                  height: 100,
                ),
                AnimatedOpacity(
                  opacity: isTechStackVisible ? 1.0 : 0.0,
                  duration: Duration(seconds: 2),
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.purpleAccent, width: 0.5),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purpleAccent,
                              // blurStyle: BlurStyle.inner,
                              spreadRadius: 5,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Column(
                              children: [
                                Text("Tech Stack",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Divider(),
                                SizedBox(
                                  height: 15,
                                ),
                                Wrap(
                                  spacing: 25,
                                  runSpacing: 20,
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight, "flutter.png"),
                                    ),
                                    // SizedBox(width: 10,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight,
                                          "springboot.png"),
                                    ),
                                    // SizedBox(width: 10,),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight, "django.png"),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight,
                                          "firebase.png"),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(
                                          fit: BoxFit.fitHeight,
                                          "google-cloud.png"),
                                    ),
                                    // Container(
                                    //   width: 50,
                                    //   height: 50,
                                    //
                                    //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Center(
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //
                      //     child:Wrap(
                      //       alignment: WrapAlignment.spaceEvenly,
                      //       crossAxisAlignment: WrapCrossAlignment.center,
                      //       // spacing: 5,
                      //       runSpacing: 10,
                      //       children: [
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //         Container(
                      //           width:100,
                      //           height: 50,
                      //           child: Image.asset("assets/devops.png"),
                      //         ),
                      //       ],
                      //     )
                      //
                      //
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      //number of projectss
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DottedBorder(
                                    dashPattern: [10],
                                    color: Colors.black,
                                    radius: Radius.circular(10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Text(
                                          "10 ",
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.purpleAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  // width: 250,
                                  child: Text(
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      "Projects using \n Flutter &\nOther Tech"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // =========================projects sections==============
                    ],
                  ),
                ),
                //sectionnnnnnnnnnnnnnnnnnnnnnnnnn
                SizedBox(
                  height: 50,
                ),
                AnimatedOpacity(
                  opacity: isProgrammingLanguagesVisible ? 1.0 : 0.0,
                  duration: Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Column(
                    children: [
                      Container(
                        width: 500,
                        height: 350,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 210,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.pinkAccent, width: 0.5),
                                    borderRadius: BorderRadius.circular(28),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.pinkAccent,
                                        // blurStyle: BlurStyle.outer,
                                        spreadRadius: 5,
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                          textAlign: TextAlign.center,
                                          "Programming\nLanguages",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17)),
                                      Divider(),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Wrap(
                                          spacing: 10,
                                          runSpacing: 20,
                                          alignment: WrapAlignment.spaceAround,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          direction: Axis.horizontal,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: Image.asset(
                                                  fit: BoxFit.fitHeight,
                                                  "javaimg.png"),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: Image.asset(
                                                  fit: BoxFit.fitHeight,
                                                  "cLogo.png"),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child:
                                                  Image.asset("pythonLogo.jpg"),
                                            ),
                                            Container(
                                              width: 70,
                                              height: 70,
                                              child: Image.asset("dart.png"),
                                            ),
                                            // Container(
                                            //   width: 50,
                                            //   height: 50,
                                            //
                                            //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                            // ),
                                            // Container(
                                            //   width: 50,
                                            //   height: 50,
                                            //
                                            //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                            // ),
                                            // Container(
                                            //   width: 50,
                                            //   height: 50,
                                            //
                                            //   child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  height: 260,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 0.5),
                                    borderRadius: BorderRadius.circular(28),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green,
                                        // blurStyle: BlurStyle.outer,
                                        spreadRadius: 5,
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text("Tools",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17)),
                                      Divider(),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 20,
                                        alignment: WrapAlignment.center,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            child: Image.asset(
                                                fit: BoxFit.fitHeight,
                                                "git.png"),
                                          ),
                                          Container(
                                            width: 70,
                                            height: 50,
                                            child: Image.asset(
                                                fit: BoxFit.fitHeight,
                                                "vslogo.jpg"),
                                          ),
                                          Container(
                                            width: 70,
                                            height: 50,
                                            child: Image.asset(
                                                fit: BoxFit.fitHeight,
                                                "andriods.png"),
                                          ),
                                          Container(
                                            width: 70,
                                            height: 50,
                                            child: Image.asset(
                                                fit: BoxFit.fitHeight,
                                                "figmaLogo.png"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  showProjectBottomborder(true, false, false);
                                  toShowTab1();
                                  print(showTab2);
                                },
                                child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(20),
                                        border: Border(
                                            bottom: BorderSide(
                                                color: allProjects, width: 2))

                                        // color: c1,

                                        ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text(
                                        "All",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  showProjectBottomborder(false, true, false);
                                  toShowTab2();
                                  print(showTab2);
                                },
                                child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: LatestProjects,
                                                width: 2))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text(
                                        "Latest",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  showProjectBottomborder(false, false, true);
                                  toShowTab3();
                                },
                                child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: UpcomingProjects,
                                                width: 2))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text(
                                        "Upcoming",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      if (showTab1 == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 380,
                            // width: 400,
                            child: Container(
                              width: 350,
                              height: 300,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: digiRickIcon,
                                            videoLink: digiRickVide,
                                            overView: digiRickshaw,
                                            bulletPoints: dgiRickshawBullet,
                                            techStack: digiRickshawTech,
                                            projectName: "DigiRickshaw",
                                            projectTagline: "Driving Companion"),
                                        "DigiRickshaw",
                                        "Your Driving Companion",
                                        "assets/icon.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: botIcon,
                                            videoLink: botVideo,
                                            overView: botDExplorer,
                                            bulletPoints: botBullet,
                                            techStack: techUsed,
                                            projectName: "BotDExplorer",
                                            projectTagline: "Analyze Efficiently"),
                                        "BotDExplorer",
                                        "Analyze Efficiently",
                                        "assets/botD.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: digiCommunityIcon,
                                            videoLink: digiCommunityVideo,
                                            overView: digiCommunity,
                                            bulletPoints: digiCommunityBullet,
                                            techStack: digicommunitytech,
                                            projectName: "Digi-Community",
                                            projectTagline: "Teaching Assistant"),
                                        "Digi Community",
                                        "Teaching Assistant",
                                        "assets/tution.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: projectLocoIcon,
                                            videoLink: projectLocoVideo,
                                            overView: projectLoco,
                                            bulletPoints: projectLocoBullet,
                                            techStack: projectLocotech,
                                            projectName: "Project Loco",
                                            projectTagline: "Optimal Crowd Distribution"),
                                        "Project Loco",
                                        "Optimal Crowd Distribution",
                                        "assets/headdetection.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: photographyAppIcon,
                                            videoLink: photographyVideo,
                                            overView: picShot,
                                            bulletPoints: picshotBullet,
                                            techStack: picshottech,
                                            projectName: "PicShot",
                                            projectTagline: "Capture,Connect,Create"),
                                        "PicShot",
                                        "Capture,Connect,Create",
                                        "assets/photography.jpg"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (showTab2 == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 380,
                            // width: 400,
                            child: Container(
                              width: 350,
                              height: 300,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: digiRickIcon,
                                            videoLink: digiRickVide,
                                            overView: digiRickshaw,
                                            bulletPoints: dgiRickshawBullet,
                                            techStack: digiRickshawTech,
                                            projectName: "DigiRickshaw",
                                            projectTagline: "Driving Companion"),
                                        "DigiRickshaw",
                                        "Your Driving Companion",
                                        "assets/icon.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: botIcon,
                                            videoLink: botVideo,
                                            overView: botDExplorer,
                                            bulletPoints: botBullet,
                                            techStack: techUsed,
                                            projectName: "BotDExplorer",
                                            projectTagline: "Analyze Efficiently"),
                                        "BotDExplorer",
                                        "Analyze Efficiently",
                                        "assets/botD.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),

                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: projectLocoIcon,
                                            videoLink: projectLocoVideo,
                                            overView: projectLoco,
                                            bulletPoints: projectLocoBullet,
                                            techStack: projectLocotech,
                                            projectName: "Project Loco",
                                            projectTagline: "Optimal Crowd Distribution"),
                                        "Project Loco",
                                        "Optimal Crowd Distribution",
                                        "assets/headdetection.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (showTab3 == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 380,
                            // width: 400,
                            child: Container(
                              width: 350,
                              height: 300,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [

                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: digiCommunityIcon,
                                            videoLink: digiCommunityVideo,
                                            overView: digiCommunity,
                                            bulletPoints: digiCommunityBullet,
                                            techStack: digicommunitytech,
                                            projectName: "Digi-Community",
                                            projectTagline: "Teaching Assistant"),
                                        "Digi Community",
                                        "Teaching Assistant",
                                        "assets/tution.jpg"),
                                    SizedBox(
                                      width: 20,
                                    ),

                                    SizedBox(
                                      width: 20,
                                    ),
                                    responsiveProjectUi(
                                        context,
                                        ProjectLandingPage(
                                            iconLink: photographyAppIcon,
                                            videoLink: photographyVideo,
                                            overView: picShot,
                                            bulletPoints: picshotBullet,
                                            techStack: picshottech,
                                            projectName: "PicShot",
                                            projectTagline: "Capture,Connect,Create"),
                                        "PicShot",
                                        "Capture,Connect,Create",
                                        "assets/photography.jpg"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
                // Container(
                //   height: 380,
                //   // width: 400,
                //   child:  Container(
                //     width:350,
                //     height:300,
                //     child: SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: Row(
                //
                //
                //         children: [
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 20,),
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 20,),
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //           SizedBox(width: 20,),
                //           Container(
                //             width: 300,
                //             height: 450,
                //
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 ClipRRect(
                //                     borderRadius: BorderRadius.only(
                //
                //
                //                         bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
                //                     child: Image.asset(fit: BoxFit.fitWidth,"assets/parents.jpg")),
                //                 Text("zdjbld",style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 20,
                //                 ),),
                //                 Text("ad,kndflnadf"),
                //               ],
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                ,
                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: isContactPageVisible ? 1.0 : 0.0,
                  curve: Curves.linear,
                  child: Column(
                    children: [
                      Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child: Image.asset("assets/photo.jpg"),
                            ),
                            Form(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                textfileds(Icons.perm_identity, 1, "Name"),
                                SizedBox(
                                  height: 10,
                                ),
                                textfileds(Icons.mail, 1, "Email Address"),
                                SizedBox(
                                  height: 10,
                                ),
                                textfileds(Icons.message, 2, "Message"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.black),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                      onPressed: () {},
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(fontSize: 14),
                                      )),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
    }
  }

  Widget responsiveProjectUi(
      BuildContext context, Widget w, heading, subHeading, imageLink) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            SwipeablePageRoute(
              builder: (context) => w,
            ));
      },
      child: Container(
        width: 250,
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    topRight: Radius.circular(80)),
                child: Image.asset(fit: BoxFit.fitWidth, "${imageLink}")),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                heading,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                subHeading,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textfileds(IconData i, int size, name) {
    Size screenSize = MediaQuery.of(context).size;
    double width = 0;
    if (screenSize.width > 600) {
      width = 400;
    } else {
      width = 250;
    }
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        maxLines: size,
        decoration: InputDecoration(
            hintMaxLines: 8,
            icon: Icon(i),
            label: Text("${name}"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.59,
                ))),
      ),
    );
  }

  Widget buttons(String buttonName, double scrollHei) {
    return TextButton(
      onPressed: () {
        scrollToWidget(scrollHei);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        overlayColor: MaterialStatePropertyAll(Colors.white),
        // overlayColor: ,

        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) return Colors.purple;
          return Colors.black;
        }),
      ),
      child: Text(
        '${buttonName}',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget navbar() {
    return Material(
      elevation: 2,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     blurRadius: 10,
            //     spreadRadius: 10,
            //     blurStyle: BlurStyle.outer,
            //
            //   ),
            // ]
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
            ),
            Text(
              "Sarthak Kshirsagar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.purpleAccent.shade200,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Row(
              children: [
                buttons("Home", 0),
                SizedBox(
                  width: 20,
                ),
                buttons("About", 100),
                SizedBox(
                  width: 20,
                ),
                buttons("Projects", 900),
                SizedBox(
                  width: 20,
                ),
                buttons("Contact", 2300)
              ],
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}

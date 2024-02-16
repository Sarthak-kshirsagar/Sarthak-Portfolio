import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pod_player/pod_player.dart';
import 'package:portfolio/sectoins/widgets/projectLandingPage.dart';
import 'package:portfolio/sectoins/widgets/tabbarr.dart';
import 'package:portfolio/sectoins/widgets/videoPlayerr.dart';
import 'package:portfolio/sectoins/widgets/projectInfo.dart';
import 'package:portfolio/main.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'dummypage.dart';
// import 'package:portfolio/main.darrt/LandingPage/';
// Widget buttons(String buttonName){
//
//
//   return TextButton(
//
//     onPressed: () {
//
//     },
//
//
//     style: ButtonStyle(
//       backgroundColor: MaterialStatePropertyAll(Colors.white),
//       overlayColor: MaterialStatePropertyAll(Colors.white),
//       // overlayColor: ,
//
//       foregroundColor: MaterialStateProperty.resolveWith<Color>(
//               (Set<MaterialState> states) {
//             if (states.contains(MaterialState.hovered))
//               return Colors.blue;
//             return Colors.black;
//           }),
//     ),
//     child:  Text(
//       '${buttonName}',
//
//       style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),
//     ),
//   );
// }

Widget projectUi(double imageheight, double width, double projectWidgetHeight,
    String mainHeading, String subHeading, String imgLink) {
  return Transform.translate(
    offset: Offset(10, 5),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: projectWidgetHeight,
                  height: projectWidgetHeight,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90),
                          topRight: Radius.circular(90)),
                      child: Image.asset(fit: BoxFit.fitHeight, "${imgLink}")),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text("${mainHeading}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      Text("${subHeading}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
          // Container(
          //
          //   width:width,
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(width:0.5,color: Colors.grey),
          //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),topRight:Radius.circular(0)),
          //   ),
          //
          //   height:projectWidgetHeight,
          //   child: Column(
          //     children: [
          //
          //       ClipRRect(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),topRight: Radius.circular(0)),child: Image.asset(fit: BoxFit.fill,width:width,height:imageheight,imgLink)),
          //       SizedBox(height:10,),
          //
          //       // Text("${mainHeading}"),
          //      Container(child: Text("${mainHeading}",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),),
          //       Container(child: Text("${subHeading}",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold)),)
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}

Widget selfInfo(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(0),

    // height: 500,

    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
          ),

          Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 500,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 450,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "LET'S INTRODUCE ABOUT \n MYSELF",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    "Hello, I am a passionate Flutter developer and Computer Science and Engineering student specializing in Artificial Intelligence and Machine Learning. With a robust skill set that encompasses Django, Flutter, and Firebase, I have successfully undertaken multiple app development projects.\n\nMy unique niche lies in seamlessly integrating Machine Learning into these applications, showcasing a dynamic fusion of cutting-edge technologies. From crafting intuitive Flutter interfaces to implementing powerful backend solutions with Django and Firebase, I bring a versatile approach to app development. \n\n Explore my portfolio to witness the synergy of my coding expertise and AI/ML proficiency in action."),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DummyPage(),
                                  ));

                              print("lhlsdhld");
                            },
                            child: Text("Download Cv")),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(

            margin: EdgeInsets.all(0),

            height: 500,

            width: 700,

            child: Image.asset(

                fit: BoxFit.fitWidth, width: 650, "assets/landinggif.gif"),

          ),
        ],
      ),
    ),
  );
}

Widget skillUi() {
  return FittedBox(
    fit: BoxFit.fitHeight,
    child: Container(
      // height: 600,

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              // fit: BoxFit.fitHeight,
              child: Container(
                width: 500,
                height: 300,
                child: GridView.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 5 / 3,
                    crossAxisCount: 3,
                    children: [
                      Container(
                          child: Image.asset(width: 50, "assets/flutter.png")),
                      Container(
                          child: Image.asset(width: 50, "assets/django.png")),
                      Container(
                          width: 10,
                          child:
                              Image.asset(width: 50, "assets/springboot.png")),
                      Container(
                          child:
                              Image.asset(width: 50, "assets/googlecloud.jpg")),
                      Container(
                          height: 10, child: Image.asset("assets/pytorch.png")),
                      Container(
                          child: Image.asset(width: 50, "assets/tensor.png")),
                    ]),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Container(
              height: 300,
              width: 600,
              child: Stack(
                children: [
                  DottedBorder(
                      dashPattern: [10],
                      color: Colors.black,
                      radius: Radius.circular(10),
                      child: Container(width: 150, height: 150)),
                  Positioned(
                    left: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "10 ",
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.purpleAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 250,
                          child: Text(
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              "Projects using \n Flutter and Other Tech"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Widget projectSection(){
//   return
//        Column(
//          children: [
//            TabBar(tabs: [
//              Tab(
//                child: Text("Projects"),
//
//              ),
//              Tab(
//                child: Text("Projects"),
//
//              ),
//
//            ]),
//            Container(
//              height: 500,
//              child: DefaultTabController(length: 3, child: Scaffold(
//                appBar:null,
//
//                body: TabBarView(children: [
//                  GridView.count(mainAxisSpacing: 5,
//                    crossAxisSpacing: 10,
//                    physics: NeverScrollableScrollPhysics(),
//                    childAspectRatio: 3 / 3,
//                    crossAxisCount: 3,
//                    shrinkWrap: true,
//                    children: [
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                      projectUi(200, 200, "Project 1", "Projects xyz",
//                          "assets/tensor.png"),
//                    ],),
//                  Text("kjhkdfh"),
//                  Text("kjbdskf"),
//
//
//                ]),
//              )),
//            ),
//          ],
//        );
//
//
// }
void _scaleDialog(BuildContext ct, var hi) {
  showGeneralDialog(
    context: ct,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);

      return Transform.scale(
        scale: curve,
        child: _dialog(ctx, hi),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}

Widget _dialog(BuildContext context, var hi) {
  return AlertDialog(
    elevation: 10,
    iconColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50.0))),
    backgroundColor: Colors.white,
    contentPadding: EdgeInsets.all(0),
    content: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width / 2 + 250,

        // color: Colors.white,
        child: hi,
      ),
    ),
  );
}

showProjectdia(BuildContext ctx, var hi) {
  return showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        elevation: 10,
        iconColor: Colors.white,
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(0),
        content: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width / 2 + 250,

            // color: Colors.white,
            child: hi,
          ),
        ),
      );
    },
  );
}

Widget AllProjects(BuildContext ctx) {
  return Container(
    width: MediaQuery.of(ctx).size.width,
    // height: MediaQuery.of(ctx).size.height,
    margin: EdgeInsets.all(100),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              InkWell(
                  onTap: () {
                    // Navigator.push(ctx, MaterialPageRoute(builder: (context) => VideoPlayerr(projectName:"asdkn", ProjectInfo:"Analyze Effectively,Insightfully", techUsed:techUsed, timeLineDates:botExpTimeLine),));
                    var hi = VideoPlayerr(
                        projectName: "asdkn",
                        ProjectInfo: "Analyze Effectively,Insightfully",
                        techUsed: techUsed,
                        timeLineDates: botExpTimeLine);
                    // showDialog(context: ctx  , builder: (context) {
                    //   return AlertDialog(
                    //     content: SingleChildScrollView(
                    //       child: Container(
                    //
                    //         child: hi,
                    //
                    //       ),
                    //     ),
                    //   );
                    // },);
                    // showProjectdia(ctx, hi);
                    // _scaleDialog(ctx, hi);
                    Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:botIcon, videoLink:botVideo, projectName: "BotDEexplorer", projectTagline: "Analyze Effectively", techStack:techUsed, bulletPoints: botBullet, overView: botDExplorer),));
                  },
                  child: projectUi(280, 400, 300, "BotDExplorer", "Analyze Effectivley",
                      "assets/botD.jpg")),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:digiRickIcon, videoLink:digiRickVide, projectName: "DigiRickshaw", projectTagline: "projectTagline", techStack:digiRickshawTech, bulletPoints: dgiRickshawBullet, overView: digiRickshaw),));
                },
                child: projectUi(380, 400, 380, "Digi Rickshaw", "Driving Companion",
                    "assets/dp.jpg"),
              ),

              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:projectLocoIcon, videoLink:projectLocoVideo, projectName: "ProjectLoco", projectTagline: "projectTagline", techStack:projectLocotech, bulletPoints: projectLocoBullet, overView: projectLoco),));
                },
                child: projectUi(280, 400, 300, "ProjectLoco", "Optimal Crowd Distribution",
                    "assets/headdetection.jpg"),
              ),


              //
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:digiParentsIcon, videoLink:digiParentVideo, projectName: "DigiParents", projectTagline: "projectTagline", techStack:digicommunitytech, bulletPoints: digiCommunityBullet, overView: digiCommunity),));
                },
                child: projectUi(280, 400, 300, "DigiParents", "Connecting Teachers & Students Digitally",
                    "assets/parents.jpg"),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:photographyAppIcon, videoLink:photographyVideo, projectName: "PicShot", projectTagline: "Capture Moments", techStack:picshottech, bulletPoints: botBullet, overView: botDExplorer),));
                },
                child: projectUi(380, 400, 380, "PicShot", "Capture,Connect,Create",
                    "assets/photography.jpg"),
              ),

              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:digiCommunityIcon, videoLink: digiCommunityVideo, projectName: "DigiCommunity", projectTagline: "projectTagline", techStack:digicommunitytech, bulletPoints: digiCommunityBullet, overView: digiCommunity),));
                },
                child: projectUi(280, 400, 300, "DigiCommunity", "Fostering Connectivity in Tuition Education",
                    "assets/tution.jpg"),
              ),

            ],
          ),
        ),
        // SizedBox(height:50),
      ],
    ),
  );
}

Widget Upcoming(BuildContext ctx) {
  return Container(
    width: MediaQuery.of(ctx).size.width,
    // height: MediaQuery.of(ctx).size.height,
    margin: EdgeInsets.all(100),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:digiCommunityIcon, videoLink: digiCommunityVideo, projectName: "DigiCommunity", projectTagline: "projectTagline", techStack:digicommunitytech, bulletPoints: digiCommunityBullet, overView: digiCommunity),));
                },
                child: projectUi(280, 400, 300, "Digi Community", "TFostering Connectivity in Tuition Education",
                    "assets/tution.jpg"),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:photographyAppIcon, videoLink:photographyVideo, projectName: "PicShot", projectTagline: "projectTagline", techStack:picshottech, bulletPoints: botBullet, overView: botDExplorer),));
                },
                child: projectUi(380, 400, 380, "PicShot", "Capture,Connect,Create",
                    "assets/photography.jpg"),
              ),
              SizedBox(
                width: 20,
              ),
              // projectUi(200,400, 350, "BotExp", "SubHeading","assets/.png"),

              //
            ],
          ),
        ),
        // SizedBox(height: 20,),
      ],
    ),
  );
}

Widget Latest(BuildContext ctx) {
  return Container(
    width: MediaQuery.of(ctx).size.width,
    // height: MediaQuery.of(ctx).size.height,
    margin: EdgeInsets.all(100),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:digiRickIcon, videoLink:digiRickVide, projectName: "DigiRickshaw", projectTagline: "projectTagline", techStack:digiRickshawTech, bulletPoints: dgiRickshawBullet, overView: digiRickshaw),));
                },
                child: projectUi(280, 400, 300, "Digi Rickshaw", "Driving Companion",
                    "assets/dp.jpg"),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:botIcon, videoLink: botVideo, projectName: "BotDExplorer", projectTagline: "projectTagline", techStack:techUsed, bulletPoints: botBullet, overView: botDExplorer),));
                },
                child: projectUi(380, 400, 380, "BotDExplorer", "Analyze Effectively",
                    "assets/botD.jpg"),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(ctx, SwipeablePageRoute(builder: (context) => ProjectLandingPage(iconLink:projectLocoIcon, videoLink: projectLocoVideo, projectName: "ProjectLoco", projectTagline: "projectTagline", techStack:projectLocotech, bulletPoints: projectLocoBullet, overView: projectLoco),));
                },
                child: projectUi(200, 400, 300, "Project Loco", "Smart Travel,Smarter Commutes",
                    "assets/headdetection.jpg"),
              ),

              //
            ],
          ),
        ),
        // SizedBox(height: 20,),
      ],
    ),
  );
}

List<Widget> slideritems = [
  Image.asset("assets/photography.jpg"),
  Image.asset("assets/photography.jpg"),
  Image.asset("assets/photography.jpg"),
  Image.asset("assets/photography.jpg"),
  Image.asset("assets/photography.jpg"),
];

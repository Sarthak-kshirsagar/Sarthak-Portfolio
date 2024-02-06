import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fading_in_widget/fading_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:portfolio/sectoins/tabbarview.dart';
import 'package:portfolio/sectoins/widgets/buttonsP.dart';
import 'package:portfolio/sectoins/tabbarview.dart';
import 'package:portfolio/sectoins/widgets/dummypage.dart';
import 'package:portfolio/sectoins/widgets/projectInfo.dart';
import 'package:portfolio/sectoins/widgets/tabbarr.dart';
import 'package:portfolio/sectoins/widgets/videoPlayerr.dart';
import 'package:video_player/video_player.dart';
void main(){
  return runApp(MaterialApp(
    home: LandingPage(
      scrollToWidget: (){

      },
    ),
  ));
}

class LandingPage extends StatefulWidget {
  final VoidCallback  scrollToWidget;
   LandingPage({super.key,required this.scrollToWidget});

  @override

  State<LandingPage> createState() => _LandingPageState();

}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {

  // Color c1 = Colors.red;
  ScrollController scroll1 = new ScrollController();
  double ht = 0;
  late TabController _tabController;
  ScrollController s1 = new ScrollController();
  double heightTab =0;


  void scrollToWidget(double scrollHeight){
    s1.animateTo(scrollHeight, duration: Duration(seconds:1), curve:Curves.easeIn
    );
  }
  showdialog()async{
    return  showDialog(context: context, builder: (context) {
      return AlertDialog(
        // backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Container(
          // color: Colors.white,
            // child: VideoPlayerr(),
            
          ),
        ),
      );
    },);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 3, vsync: this);

    setState(() {
      heightTab=1150;
    });
    _tabController.addListener(() {
      setState(() {
        switch(_tabController.index){
          case 0:
            heightTab =1150;
            break;
          case 1:
            heightTab = 800;
            break;
          case 2:
            heightTab=800;
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
  void toShowTab2(){
    setState(() {
      showTab1=false;
      showTab2=true;
      showTab3=false;
    });
  }
  void toShowTab3(){
    setState(() {
      showTab1=false;
      showTab2=false;
      showTab3=true;
    });
  }
  void toShowTab1(){
    setState(() {
      showTab1=true;
      showTab2=false;
      showTab3=false;
      print("executed");
    });
  }
  Color c1 = Colors.red;
  @override
  Widget build(BuildContext context) {
    Size screenSzie = MediaQuery.of(context).size;

    if(screenSzie.width>600){
      return Scaffold(
        body: SafeArea(child: Column(
          children: [
            //navigation bar
            navbar(),
            SizedBox(height: 50,),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: s1,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //selfinformation ui
                        selfInfo(context),
                        SizedBox(height: 50,),

                        //skill ui
                        Center(child: skillUi()),
                        // tab bar and projects
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Text("Projects",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),),
                                SizedBox(height: 50,),
                                Container(

                                  // width: 500,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200]
                                  ),

                                  child: DefaultTabController(animationDuration:Duration.zero,initialIndex: 0,length: 3, child:
                                  Column(

                                    children: [

                                      Container(width: 500,child: TabBar(

                                        physics: NeverScrollableScrollPhysics(),
                                        controller: _tabController,

                                        tabs: [
                                          Tab(
                                            child: Text("All"),
                                          ),
                                          Tab(
                                            child: Text("Latest"),
                                          ),
                                          Tab(
                                            child: Text("Upcoming"),
                                          ),
                                        ],
                                      ),


                                      ),
                                      Container(


                                        height:heightTab,
                                        child: TabBarView(physics: NeverScrollableScrollPhysics(),controller: _tabController,children: [
                                          Container(

                                            // height:1500,
                                            // width: MediaQuery.of(context).size.width,
                                              child: AllProjects(context)),
                                          Container(

                                            // height: 400,
                                            child: Latest(context),
                                          ),
                                          Container(

                                            // height: 400,
                                            child: Upcoming(context),
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



                        // tab bar





                        Text("Contact Me",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),),

                        Container(
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Image.asset("assets/profilePic.jpg",fit: BoxFit.fitWidth),
                                      width: 500,
                                      height: 400,
                                      decoration: BoxDecoration(

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        textfileds(1,"Full Name"),
                                        SizedBox(height: 10,),
                                        textfileds(1,"Email"),
                                        SizedBox(height: 10,),
                                        textfileds(1,"Subject"),
                                        SizedBox(height: 10,),
                                        textfileds(5,"Message"),
                                        SizedBox(height: 10,),
                                        Container(
                                          width: 150,
                                          child: ElevatedButton(

                                              style: ButtonStyle(

                                                backgroundColor: MaterialStatePropertyAll(Colors.black),
                                                foregroundColor: MaterialStatePropertyAll(Colors.white),
                                              )
                                              ,onPressed: (){
                                            showdialog();
                                          }, child: Text("Submit")),
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),

                            ],
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
        ),);
    }else{

      return Scaffold(appBar: AppBar(

      ),drawer:Drawer(
        backgroundColor: Colors.white,
        child: Column(

          children: [
           InkWell(
             onTap: (){},
             child: Container(
               width: 250,
               height: 60,

               child: Row(

                 children: [
                   Icon(Icons.home,color: Colors.purple,size:30),
                   SizedBox(width:20,),
                   Text("Home",style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize:15,
                   )
                   ),


                 ],
               ),
             ),
           ),
            InkWell(
              onTap: (){},
              child: Container(
                width: 250,
                height: 60,

                child: Row(

                  children: [
                    Icon(Icons.person,color: Colors.purple,size:30),
                    SizedBox(width:20,),
                    Text("About",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15,
                    )
                    ),


                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                width: 250,
                height: 60,

                child: Row(

                  children: [
                    Icon(Icons.add_chart_rounded,color: Colors.purple,size:30),
                    SizedBox(width:20,),
                    Text("Projects",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15,
                    )
                    ),


                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                width: 250,
                height: 60,

                child: Row(

                  children: [
                    Icon(Icons.mail,color: Colors.purple,size:30),
                    SizedBox(width:20,),
                    Text("Contact",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15,
                    )
                    ),


                  ],
                ),
              ),
            ),
            Divider(color: Colors.black,thickness: 2),
            Text("Social Links"),
            InkWell(
              onTap: (){},
              child: Container(
                width: 250,
                height: 60,

                child: Row(

                  children: [
                    Icon(Icons.mail,color: Colors.purple,size:30),
                    SizedBox(width:20,),
                    Text("GitHub",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15,
                    )
                    ),


                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                width: 250,
                height: 60,

                child: Row(

                  children: [
                    Icon(Icons.mail,color: Colors.purple,size:30),
                    SizedBox(width:20,),
                    Text("LinkedIn",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15,
                    )
                    ),


                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                width: 250,
                height: 60,

                child: Row(

                  children: [
                    Icon(Icons.mail,color: Colors.purple,size:30),
                    SizedBox(width:20,),
                    Text("LeetCode",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15,
                    )
                    ),


                  ],
                ),
              ),
            ),




          ],
        ),
      ),body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("I'm",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize:25,color: Colors.purpleAccent
              )),
            SizedBox(height: 10,),
            Text("Sarthak Kshirsagar",style: TextStyle(
              fontSize:35,
              fontWeight: FontWeight.bold,
            ),),

              SizedBox(height: 10,),
          SizedBox(
            // width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize:20.0,
                fontFamily: 'Canterbury',
              ),
              child: Container(
                height: 80,
                // width: 250,
                child: AnimatedTextKit(
          repeatForever: true,
                  animatedTexts: [
                    // ScaleAnimatedText('Frontend Developer'),
                    // ScaleAnimatedText('Backend Developer'),
                    // ScaleAnimatedText('Ai & Ml Enthusiasatic'),
                    TyperAnimatedText("Full Stack\nApp Developer",textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:25,
                    ))
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(


                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),onPressed: (){

                }, child: Text("Download Cv")),
              ),
              SizedBox(height: 10,),
              Container(
                child: Image.asset("assets/profilePic.jpg"),
              ),

              SizedBox(height:100,),
              Center(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent[50],
                          // border: Border.all(color: Colors.purpleAccent,width: 0.5),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purpleAccent,
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 20,
                              blurRadius: 15,
                            ),
                          ],


                        ),
                        child: Column(
                          children: [
                            Text("Tech Stack",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 20
                            )),
                            Divider(),
                            SizedBox(height:15,),
                            Wrap(
                              spacing: 8,
                              runSpacing:20,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,

                                  child: Image.asset(fit: BoxFit.fitHeight,"flutter.png"),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,

                                  child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,

                                  child: Image.asset(fit: BoxFit.fitHeight,"django.png"),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,

                                  child: Image.asset(fit: BoxFit.fitHeight,"firebase.png"),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,

                                  child: Image.asset(fit: BoxFit.fitHeight,"google-cloud.png"),
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
            SizedBox(height:20,),
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
                    SizedBox(height: 20,),
                    //number of projectss
                    Container(margin: EdgeInsets.only(left:10),height:150, width:MediaQuery.of(context).size.width,
                      child: Stack(
alignment: Alignment.center,
                        children: [


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              DottedBorder(


                                  dashPattern: [10]
                                  ,
                                  color: Colors.black,
                                  radius: Radius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width:50,
                                        height: 50,
                                      child:  Text("10 ", style: TextStyle(fontSize:40,
                                          color: Colors.purpleAccent,
                                          fontWeight: FontWeight.bold
                                      ),),

                                    ),
                                  )),
                                  SizedBox(width:20,),
                              Container(
                                // width: 250,
                                child: Text(style: TextStyle(
                                  fontSize:18,
                                  fontWeight: FontWeight.bold,

                                ), "Projects using \n Flutter &\nOther Tech"),
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
            SizedBox(height: 50,),
              Container(
                width:500,
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent[50],
                            // border: Border.all(color: Colors.purpleAccent,width: 0.5),
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pinkAccent,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 20,
                                blurRadius: 15,
                              ),
                            ],


                          ),
                          child: Column(
                            children: [
                              Text(textAlign: TextAlign.center,"Programming Languages",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 20
                              )),
                              Divider(),
                              SizedBox(height:15,),
                              Wrap(
                                spacing:20,
                                runSpacing:20,
                                alignment: WrapAlignment.spaceAround,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,

                                    child: Image.asset(fit: BoxFit.fitHeight,"springboot.png"),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,

                                    child: Image.asset(fit: BoxFit.fitHeight,"javaimg.png"),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 50,

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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width:80,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            // color: Colors.green[50],
                            // border: Border.all(color: Colors.purpleAccent,width: 0.5),
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 20,
                                blurRadius: 15,
                              ),
                            ],


                          ),
                          child: Column(
                            children: [
                              Text("Tools",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 20
                              )),
                              Divider(),
                              SizedBox(height:15,),
                              Wrap(
                                spacing: 8,
                                runSpacing:20,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,

                                    child: Image.asset(fit: BoxFit.fitHeight,"git.png"),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 50,

                                    child: Image.asset(fit: BoxFit.fitHeight,"vscode.jpg"),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 50,

                                    child: Image.asset(fit: BoxFit.fitHeight,"andriods.png"),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 50,

                                    child: Image.asset(fit: BoxFit.fitHeight,"figma.png"),
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
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Projects",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height:20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    InkWell(
                      onTap: (){
                        toShowTab1();
                        print(showTab2);
                      },



                      child: Container(width:100,decoration:


                          BoxDecoration(
                            borderRadius: BorderRadius.circular(20),




                            // color: c1,


                          ),child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("All",style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 15
                            ),)),
                          )),
                    ),
                    InkWell(
                      onTap: (){
                        toShowTab2();
                        print(showTab2);
                      },
                      child:  Container(width:100,decoration:


                      BoxDecoration(
                          border: Border.all(

                              color: Colors.white
                          )
                      ),child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Latest",style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 15
                        ),)),
                      )),
                    ),
                    InkWell(
                      onTap: (){
                        toShowTab3();
                      },

                      child:  Container(width:100,decoration:


                      BoxDecoration(
                          border: Border.all(

                              color: Colors.white
                          )
                      ),child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Upcoming",style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 15
                        ),)),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              if(showTab1==true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 380,
                    // width: 400,
                    child:  Container(
                      width:350,
                      height:300,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(


                          children: [
                            responsiveProjectUi("BotDExplorer", "Analyze Efficiently", "assets/botD.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("Digi Rickshaw", "Analyze Efficiently", "assets/icon.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("Digi Community", "Analyze Efficiently", "assets/tution.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("Project Loco", "Optimal Crowd Distribution", "assets/headdetection.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("Digi Parents", "Analyze Efficiently", "assets/parents.jpg"),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if(showTab2==true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 380,
                    // width: 400,
                    child:  Container(
                      width:350,
                      height:300,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(


                          children: [
                            InkWell(

                                onTap: (){
                                  var hi = VideoPlayerr(projectName:"asdkn", ProjectInfo:"Analyze Effectively,Insightfully", techUsed:techUsed, timeLineDates:botExpTimeLine);
                                  showProjectdia(context, hi);
                                },child: responsiveProjectUi("hi", "Analyze Efficiently", "assets/botD.jpg")),
                            SizedBox(width: 20,),
                            responsiveProjectUi("BotDExplorer", "Analyze Efficiently", "assets/botD.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("BotDExplorer", "Analyze Efficiently", "assets/botD.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("BotDExplorer", "Analyze Efficiently", "assets/botD.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("BotDExplorer", "Analyze Efficiently", "assets/botD.jpg"),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if(showTab3==true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 380,
                    // width: 400,
                    child:  Container(
                      width:350,
                      height:300,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(


                          children: [
                            responsiveProjectUi("DigiCommunity", "Analyze Efficiently", "assets/tution.jpg"),
                            SizedBox(width: 20,),
                            responsiveProjectUi("PicShot", "Analyze Efficiently", "assets/photography.jpg"),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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



              Text("Contact",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,

                      child: Image.asset("assets/photo.jpg"),
                    ),
                    Form(child: Column(
                      children: [
                        SizedBox(height: 10,),
                        textfileds(1, "Name"),
                        SizedBox(height: 10,),
                        textfileds(1, "Email Address"),
                        SizedBox(height: 10,),
                        textfileds(1, "Contact Number"),
                        SizedBox(height: 10,),
                        textfileds(1, "Address"),
                        SizedBox(height: 10,),
                        Container(
                          width: 150,
                          height:50,
                          child: ElevatedButton(

                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.black),
                            foregroundColor: MaterialStatePropertyAll(Colors.white)

                          ),onPressed: (){}, child: Text("Contact",style: TextStyle(
                            fontSize:14
                          ),)),
                        ),

                      ],
                    )),
                    SizedBox(height: 50,),

                  ],
                ),
              ),




            ],
          ),
        ),
      ));
    }

  }


Widget responsiveProjectUi(heading,subHeading,imageLink){
    return  Container(
      width: 300,
      height: 450,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(


                  bottomLeft: Radius.circular(80) ,topRight: Radius.circular(80)),
              child: Image.asset(fit: BoxFit.fitWidth, "${imageLink}")),
          Text(heading,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          Text(subHeading),
        ],
      ),
    );
}

Widget textfileds(int size,name){
    Size screenSize = MediaQuery.of(context).size;
    double width = 0;
    if(screenSize.width>600){
      width=400;
    }else{
      width=250;
    }
    return  Container(

      width:width,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
      maxLines:size,
        decoration: InputDecoration(
          hintMaxLines: 10,

            label: Text("${name}"),

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color:Colors.grey,
                  width: 1.59,
                )
            )
        ),
      ),
    );
}
  Widget buttons(String buttonName,double scrollHei){


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
              if (states.contains(MaterialState.hovered))
                return Colors.blue;
              return Colors.black;
            }),
      ),
      child:  Text(
        '${buttonName}',

        style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget navbar(){
    return  Container(
      height: 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 10,
              blurStyle: BlurStyle.outer,

            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 50,),
          Text("Sarthak", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),),
          SizedBox(width: 50,),
          Row(

            children: [
              buttons("Home",0),
              SizedBox(width: 20,),
              buttons("About",100),
              SizedBox(width: 20,),
              buttons("Projects",900),
              SizedBox(width: 20,),
              buttons("Contact",2300)
            ],
          ),
          SizedBox(width: 20,)
        ],
      ),
    );
  }
}
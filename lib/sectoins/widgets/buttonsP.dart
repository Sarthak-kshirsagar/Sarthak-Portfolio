import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pod_player/pod_player.dart';
import 'package:portfolio/sectoins/widgets/tabbarr.dart';
import 'package:portfolio/sectoins/widgets/videoPlayerr.dart';
import 'package:portfolio/sectoins/widgets/projectInfo.dart';
import 'package:portfolio/main.dart';

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

Widget projectUi(double imageheight,double width,double projectWidgetHeight,String mainHeading,String subHeading,String imgLink){
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
                  width:projectWidgetHeight,
                  height:projectWidgetHeight,
                  child: ClipRRect(

                  borderRadius:BorderRadius.only(bottomLeft: Radius.circular(90),


                      topRight: Radius.circular(90)),child: Image.asset(fit: BoxFit.fitWidth,"${imgLink}")),

                ),
                Container(
                  margin: EdgeInsets.only(left:50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text("${mainHeading}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
                      Text("${subHeading}",style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 15,
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




Widget selfInfo(BuildContext context){
  return Container(
    // height: 500,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 500,
            width: 700,
            child: Image.asset(
              fit: BoxFit.fitHeight,
                width: 650, "assets/landingpage.png"),
          ),
        ),

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
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly,
                        children: [
                          Text(
                            "LET'S INTRODUCE ABOUT \n MYSELF",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,

                            ),),
                          SizedBox(height: 20,),
                          Text(
                              "Hello, I am a passionate Flutter developer and Computer Science and Engineering student specializing in Artificial Intelligence and Machine Learning. With a robust skill set that encompasses Django, Flutter, and Firebase, I have successfully undertaken multiple app development projects.\n\nMy unique niche lies in seamlessly integrating Machine Learning into these applications, showcasing a dynamic fusion of cutting-edge technologies. From crafting intuitive Flutter interfaces to implementing powerful backend solutions with Django and Firebase, I bring a versatile approach to app development. \n\n Explore my portfolio to witness the synergy of my coding expertise and AI/ML proficiency in action."),
                        ],
                      ),
                    )),
                SizedBox(height: 20,),
                ElevatedButton(


                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                            Colors.white),
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.black)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DummyPage(),));
                      print("lhlsdhld");
                    },
                    child: Text("Download Cv")),


              ],
            ),
          ),
        )
      ],
    ),
  );
}


Widget skillUi(){
  return    FittedBox(
    fit: BoxFit.fitHeight,
    child: Container(
      // height: 600,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            // fit: BoxFit.fitHeight,
            child: Container(
              width: 500,
              height:300,
              child: GridView.count(crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 4 / 3,
                  crossAxisCount: 3,
                  children: [
                    Container(
                        child: Image.asset(
                            width: 80, "assets/flutter.png")
                    ),
                    Container(

                        child: Image.asset(
                            width: 80, "assets/django.png")
                    ),
                    Container(
                        width: 10,
                        child: Image.asset(
                            width: 80, "assets/springboot.png")
                    ),
                    Container(
                        child: Image.asset(
                            width: 80, "assets/googlecloud.jpg")
                    ),
                    Container(
                        height: 10,
                        child: Image.asset("assets/pytorch.png")
                    ),
                    Container(
                        child: Image.asset(
                            width: 80, "assets/tensor.png")
                    ),
                  ]),
            ),
          ),
          SizedBox(width:100 ,),
          Container(height:300, width: 600,
            child: Stack(

              children: [
                DottedBorder(

                    dashPattern: [10]
                    ,
                    color: Colors.black,
                    radius: Radius.circular(10),
                    child: Container(
                        width: 150,
                        height: 150
                    )),

                Positioned(
                  left: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("10 ", style: TextStyle(fontSize: 80,
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: 250,
                        child: Text(style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,

                        ), "Projects using \n Flutter and Other Tech"),
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
showProjectdia(BuildContext ctx,var hi){
  return showDialog(context: ctx  , builder: (context) {

    return AlertDialog(

      backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       InkWell(
        onTap: (){
          Navigator.pop(context);
    },
        child: Icon(Icons.close,color: Colors.orange,size:30,))
      ],
    ),
      contentPadding: EdgeInsets.all(0),

      content: SingleChildScrollView(
        child: Container(
          width:MediaQuery.of(context).size.width - 500,

          // color: Colors.white,
          child: hi,

          ),


        ),
      );

  },);
}
Widget AllProjects(BuildContext ctx){
  return
    Container(
      width: MediaQuery.of(ctx).size.width,
      // height: MediaQuery.of(ctx).size.height,
      margin: EdgeInsets.all(100),
      child: Column(

        // mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             InkWell(onTap: (){
               // Navigator.push(ctx, MaterialPageRoute(builder: (context) => VideoPlayerr(projectName:"asdkn", ProjectInfo:"Analyze Effectively,Insightfully", techUsed:techUsed, timeLineDates:botExpTimeLine),));
              var hi = VideoPlayerr(projectName:"asdkn", ProjectInfo:"Analyze Effectively,Insightfully", techUsed:techUsed, timeLineDates:botExpTimeLine);
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
               showProjectdia(ctx, hi);
             },child: projectUi(280,400, 350, "BotDExplorer", "SubHeading","assets/botD.jpg")),
              SizedBox(width: 20,),
              projectUi(380,400,450, "PicShot", "SubHeading","assets/photography.jpg"),
              SizedBox(width: 20,),
              projectUi(280,400, 350, "DigiCommunity", "SubHeading","assets/tution.jpg"),


              //


            ],
          ),
          SizedBox(height: 20,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              projectUi(280,400, 350, "DigiParents", "SubHeading","assets/parents.jpg"),
              SizedBox(width: 20,),
              projectUi(280,400, 350, "ProjectLoco", "SubHeading","assets/headdetection.jpg"),
            ],
          ),
          // SizedBox(height:50),


        ],
      ),
    );

}
Widget Upcoming(BuildContext ctx){
  return
    Container(
      width: MediaQuery.of(ctx).size.width,
      // height: MediaQuery.of(ctx).size.height,
      margin: EdgeInsets.all(100),
      child: Column(

        // mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              projectUi(280,400, 350, "Digi Community", "SubHeading","assets/tution.jpg"),
              SizedBox(width: 20,),
              projectUi(380,400,450, "PicShot", "SubHeading","assets/photography.jpg"),
              SizedBox(width: 20,),
              // projectUi(200,400, 350, "BotExp", "SubHeading","assets/.png"),


              //


            ],
          ),
          // SizedBox(height: 20,),




        ],
      ),
    );





}
Widget Latest(BuildContext ctx){
  return Container(
    width: MediaQuery.of(ctx).size.width,
    // height: MediaQuery.of(ctx).size.height,
    margin: EdgeInsets.all(100),
    child: Column(

      // mainAxisAlignment: MainAxisAlignment.center,


      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            projectUi(280,400, 350, "Digi Rickshaw", "SubHeading","assets/botD.jpg"),
            SizedBox(width: 20,),
            projectUi(380,400,450, "BotDExplorer", "SubHeading","assets/botD.jpg"),
            SizedBox(width: 20,),
            projectUi(200,400, 350, "Project Loco", "SubHeading","assets/headdetection.jpg"),


            //


          ],
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


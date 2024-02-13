// import 'package:portfolio/main.dart'
import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sectoins/widgets/projectInfo.dart';
import 'package:timeline_tile/timeline_tile.dart';
// import 'package:timelines/timelines.dart';
import 'package:video_player/video_player.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'buttonsP.dart';

class VideoPlayerr extends StatefulWidget {
  String projectName;
  String ProjectInfo;
  List techUsed;
  List<String> timeLineDates;
   VideoPlayerr({required this.projectName,required this.ProjectInfo,required this.techUsed,required this.timeLineDates});


  @override
  State<VideoPlayerr> createState() => _VideoPlayerrState();
}

class _VideoPlayerrState extends State<VideoPlayerr> {
  late VideoPlayerController v2 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    v2 = VideoPlayerController.asset(
        "assets/botexp.mp4"
    )..initialize().then((_){
      setState(() {
        v2.play();
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    Size screenSzie = MediaQuery.of(context).size;
    //for tablets and laptops
    if(screenSzie.width>600){
      return Container(
        decoration: BoxDecoration(
         color: Colors.white,
        ),
        // height: 800,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.start,


            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("BotDExplorer",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.purple,
                    // color: Colors.white
                    // color: Colors.white
                  )),
                  Container(
                    // color: Colors.white,
                    child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: Colors.orange,size:30,)),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              //technologies useddd
              Container(
                child: Row(

                  children: [
                    Text("Technologies Used:- ",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 18,
                        // color: Colors.purple
                    ),),
                    Container(
                      height: 50,
                      width: 250,
                      child: Row(
                        children: [
                          Container(
                            width:200,

                            child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: widget.techUsed.length,itemBuilder: (context, index) {
                              return  Row(
                                children: [
                                  Container(
                                    width: 38,
                                    height:38,
                                    child:widget.techUsed[index],
                                  ),
                                  SizedBox(width:15,)
                                ],
                              );
                            },),
                          ),

                        ],
                      ),
                    )

                    // SizedBox(width: 20,),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   child:techUsed[1],
                    // ),
                    // SizedBox(width: 20,),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   child:Image.asset("assets/googlecloud.jpg"),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Timeline:- ",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18,
                  // color: Colors.purple
              ),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    height: 80,
                    width:800,
                    child:ListView.builder(scrollDirection: Axis.horizontal,itemCount: widget.timeLineDates.length,itemBuilder: (context, index) {
                      String? heading;
                      if(index==0){
                        heading = "Conception";
                      }else if(index==1){
                        heading = "Desigining";
                      }else if(index==2){
                        heading = "Database Design";
                      }else if(index==3){
                        heading = "Development";
                      }else if(index==4){
                        heading = "Deployment";
                      }
                      return timelinetile("${heading}","26/12/2003");
                    },) ,
                  ),
                  // timelinetile("Conception","26/12/2003"),
                  // timelinetile("Conception","26/12/2003"),
                  // timelinetile("Conception","26/12/2003"),
                  // timelinetile("Conception","26/12/2003"),
                ],
              ),

              SizedBox(height: 10,),



              ///////dummy widget
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: BorderDirectional(bottom: BorderSide(color: Colors.purple,width: 2))
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Screens",style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 20,
                              // color: Colors.purple
                            )),
                          ) ,
                        ),

                        SizedBox(height:10,),
                        Container(
                          width:600,
                          height:400,
                          margin: EdgeInsets.all(0),

                          child: CarouselSlider(items: slideritems, options: CarouselOptions(
                            // height: 300,
                            autoPlay: true,

                            autoPlayCurve: Curves.easeInOut, // Set the auto-play curve
                            autoPlayAnimationDuration: Duration(milliseconds: 500), // Set the auto-play animation duration
                            // aspectRatio: 16/9,
                          )),
                        ),

                      ],

                    ),
                    Container(
                        width: 350,
                        height: 600,
                        child: VideoPlayer(v2))
                  ],
                ),
              ),
              Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About this App",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20,
                    ),),
                    Text("Information goes hereee"),
                  ],
                ),
              ),
              // SizedBox(height: 100,),






            ],
          ),
        ),
      );
    }
    // ===============================================================
    // for mobile devices
    else{
      return Scaffold(
        body: Container(
          // height: 500,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.projectName}",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize:30,color: Colors.purpleAccent,
                  )),
                  SizedBox(height: 20,),
                  Text("Technologies Used:-",style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),),
                  SizedBox(height:10,),
                  Container(
                    width: 250,
                    height: 70,
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: widget.techUsed.length,itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 20,),
                          Container(
                            width:40,
                            height: 50,
                            child:widget.techUsed[index],
                          ),
                          SizedBox(width: 20,),
                        ],
                      );
                    },),
                  ),
                  //timeline


                  // Videoplayer
                  // Text("TimeLine:"),
                  // Container(
                  //   width: 250,
                  //   height: 500,
                  //   child:Column(
                  //     children: [
                  //       Row(
                  //         children: [
                  //
                  //           timelinetileMobile(TimelineAxis.horizontal,"kajdfbk", "date"),
                  //           timelinetileMobile(TimelineAxis.horizontal,"kajdfbk", "date"),
                  //           TimelineDivider(
                  //             begin: 0.1,
                  //             end: 0.9,
                  //             thickness: 6,
                  //             color: Colors.purple,
                  //           ),
                  //
                  //         ],
                  //
                  //       ),
                  //       timelinetileMobile(TimelineAxis.vertical,"kajdfbk", "date"),
                  //     ],
                  //   ) ,
                  //
                  // ),
                  SizedBox(height:10,),
                  Divider(),
                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  // Text("asdnds",style: TextStyle(fontWeight: FontWeight.bold,fontSize:16)),
                      Container(
                        margin: EdgeInsets.all(0),
                        height:400,
                        width: 300,
                        // color: Colors.white,
                        child: ListView.builder(padding:EdgeInsets.all(0),scrollDirection: Axis.horizontal,itemCount:slideritems.length,itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: 250,
                                height: 400,
                                child:slideritems[index],
                              ),
                              SizedBox(width:20,),
                            ],
                          );
                        },),
                        // child: CarouselSlider(items: slideritems, options: CarouselOptions(
                        //   // height: 300,
                        // // height: 500,
                        //   autoPlay: true,
                        //   autoPlayCurve: Curves.easeInOut, // Set the auto-play curve
                        //   autoPlayAnimationDuration: Duration(milliseconds: 500), // Set the auto-play animation duration
                        //   // aspectRatio: 16/9,
                        // )),
                      ),
                    ],
                  ),

                  Text("Demo",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple
                  ),),

                  SizedBox(height: 10,),

                  Container(
                    width:400,
                    height: 600,
                    // color: Colors.grey,
                    child: VideoPlayer(v2),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:20,),
                      Divider(),
                      Text("About App",style: TextStyle(

                        fontWeight: FontWeight.bold,fontSize:20,color: Colors.purpleAccent,

                      )),


                      Container(
                        width: 300,
                        height: 250,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(height:20,),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      );
    }




  }
  Widget timelinetileMobile(TimelineAxis a1,name,date){
    return Container(
      width:60,
      height: 100,
      child: TimelineTile(
        lineXY: 0.9,
        indicatorStyle: IndicatorStyle(
            color: Colors.green
        ),
        afterLineStyle: LineStyle(
            color: Colors.red,
            thickness: 10
        ),
        beforeLineStyle: LineStyle(
          color: Colors.red,
          thickness: 10,
        ),
        axis: a1,
        alignment: TimelineAlign.manual,
        endChild: Container(
          child: Text("${date}",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:15,
          )),
          constraints: const BoxConstraints(
            // minWidth: 120,
          ),
          // color: Colors.lightGreenAccent,
        ),
        startChild: Container(
          child: Text("${name}",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:15,
          )),
          // color: Colors.amberAccent,/
        ),
        // lineXY: 10,
      ),
    );
  }
  Widget timelinetile(name,date){
    return Container(
      width: 150,
      height: 100,
      child: TimelineTile(
        indicatorStyle: IndicatorStyle(
          // indicator: Icon(Icons.check,color: Colors.orange,size:30,),
          width: 20,
          height: 20,
          iconStyle: IconStyle(iconData: Icons.check,fontSize: 20,),
          color: Colors.green,


        ),
        afterLineStyle: LineStyle(
          color: Colors.grey,
          thickness: 10
        ),
        beforeLineStyle: LineStyle(
          color: Colors.grey,
          thickness: 10,
        ),
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.center,
        endChild: Container(
          child: Text("${date}",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:15,
          )),
          constraints: const BoxConstraints(
            // minWidth: 120,
          ),
          // color: Colors.lightGreenAccent,
        ),
        startChild: Container(
          child: Text("${name}",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:15,
          )),
          // color: Colors.amberAccent,/
        ),
        lineXY: 10,
      ),
    );
  }
}

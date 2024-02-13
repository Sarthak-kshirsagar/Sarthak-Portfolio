import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProjectLandingPage extends StatefulWidget {
  String projectName;
  String projectTagline;
  List techStack;
  String overView;
  List bulletPoints=[];
  String iconLink;
  String videoLink;
   ProjectLandingPage({required this.iconLink,required this.videoLink,required this.projectName,required this.projectTagline,required this.techStack,required this.bulletPoints,required this.overView});

  @override
  State<ProjectLandingPage> createState() => _ProjectLandingPageState();
}

class _ProjectLandingPageState extends State<ProjectLandingPage> {
  String techStack1="";
  String techStack2="";
  String techStack3="";
  String techStack4="";
  Color overViewBorder = Colors.grey;
  Color demoBorder  = Colors.grey;
  bool isOverviewSelected = true;
  bool isDemoSelected = false;

  void makeOverViewBorder(){
    setState(() {
      overViewBorder = Colors.purple;
      demoBorder = Colors.grey;
    });
  }
  void showTab(bool one,bool two){
    setState(() {
      isOverviewSelected = one;
      isDemoSelected = two;


    });
  }
  void makeDemoBorder(){
    setState(() {
      overViewBorder = Colors.grey;
      demoBorder = Colors.purple;
    });
  }
  late VideoPlayerController v2 ;
  void setValues(){
    print("function called");
    print("name is ${widget.projectName}");
    if(widget.projectName=="ProjectLoco"||widget.projectName=="Project Loco"){
      setState(() {
         techStack1="Python";
         techStack2="Pytorch";
         techStack3 = "Flutter";
         techStack4 = "Firebase";
      });
    }else{
      setState(() {
         techStack1="Flutter";
         techStack2="Firebase";
         if(widget.techStack.length>2){
           techStack3 = "Django";
           techStack4 = "Firebase";
         }else{
           print("length is not grater");
         }
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setValues();
    v2 = VideoPlayerController.asset(
        "assets/botexp.mp4"
    )..initialize().then((_){
      setState(() {
        v2.play();
      });
    });

    print("lendth is ");
    print(widget.techStack.length);
  }
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width<600){
      return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text("Project Details",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 25,
                ),),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: 400,
                      // height: 700,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(

                            blurRadius:6,
                            // blurStyle: BlurStyle.solid,
                            spreadRadius:6,
                            color: Colors.purple.shade50,
                            // blurStyle: BlurStyle.
                          )
                        ],
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all( color: Colors.purple.shade50,width:2.5),
                        // color: Colors.grey,

                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //image

                            Container(
                              margin: EdgeInsets.all(0),
                              width:60,
                              height:50,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(fit: BoxFit.fill,widget.iconLink)),
                            ),

                            //project name
                            SizedBox(height:10,),
                            Text("${widget.projectName}",style: TextStyle(
                              // color: Colors.white,
                              fontWeight: FontWeight.bold,fontSize: 25,
                            ),),
                            //tagline

                            Text("${widget.projectTagline}",style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),

                            SizedBox(height: 30,),
                            //tech Stack

                            Container(
                              width: 450,
                              height: 80,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 10,),
                                    Container(
                                      width:100,
                                      height: 40,
                                      decoration: BoxDecoration(border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,

                                      ),
                                          borderRadius: BorderRadius.all(Radius.circular(50))

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            widget.techStack[0],
                                            Text("${techStack1}",style: TextStyle(fontWeight: FontWeight.bold)),


                                          ],
                                        ),
                                      ),

                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width:100,
                                      height: 40,
                                      decoration: BoxDecoration(border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,

                                      ),
                                          borderRadius: BorderRadius.all(Radius.circular(50))

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(

                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            widget.techStack[1],
                                            Text("${techStack2}",style: TextStyle(fontWeight: FontWeight.bold)),


                                          ],
                                        ),
                                      ),

                                    ),
                                    SizedBox(width: 10,),
                                    if(widget.techStack.length>2)
                                    Container(
                                      width:100,
                                      height: 40,
                                      decoration: BoxDecoration(border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,

                                      ),
                                          borderRadius: BorderRadius.all(Radius.circular(50))

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            widget.techStack[2],
                                            Text("${techStack3}",style: TextStyle(fontWeight: FontWeight.bold)),


                                          ],
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //tabbar for the project
                            Center(
                              child: Container(


                                // margin: EdgeInsets.only(left:45),
                                width: 400,
                                height:60,
                                decoration: BoxDecoration(
                                  // border: BorderDirectional(bottom: BorderSide(
                                  //   color: Colors.black,
                                  //   width: 1,
                                  //
                                  // ))
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: (){
                                          makeOverViewBorder();
                                          showTab(true,false);
                                        },


                                        // focusColor: Colors.purple,
                                        child: Container(
                                          width: 120,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: BorderDirectional(bottom: BorderSide(
                                              color:overViewBorder,
                                              width: 2,

                                            )),
                                          ),
                                          child: Center(child: Text("Overview",style: TextStyle(
                                              fontWeight: FontWeight.bold,fontSize:14
                                          ),)),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: (){
                                          makeDemoBorder();
                                          showTab(false,true);
                                        },
                                        child: Container(
                                          width: 120,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            // color: demoBorder,
                                            // color: Colors.red,
                                              border: BorderDirectional(bottom: BorderSide(
                                                color: demoBorder,
                                                width: 2,

                                              ))
                                          ),
                                          child: Center(child: Text("Demo",style: TextStyle(
                                              fontWeight: FontWeight.bold,fontSize:14
                                          ),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height:10,),
                            if(isOverviewSelected==true)
                              Align(


                                  alignment: Alignment.bottomLeft,child:


                              Text("${widget.overView}")),
                            if(isOverviewSelected==true)
                              SizedBox(height:10,),
                            if(isOverviewSelected==true)
                              Align(
                                  alignment: Alignment.bottomLeft,child: Text("Responsibilites",style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.black),))
                            ,
                            //bullet points
                            SizedBox(height:10,),
                            if(isOverviewSelected==true)
                              Column(
                                children: [
                                  Container(
                                    height:150,
                                    child: ListView.builder(itemCount: widget.bulletPoints.length,itemBuilder: (context, index) {
                                      return Expanded(child: bulletPoints("${widget.bulletPoints[index]}"));
                                    },),
                                  )
                                  // SizedBox(height:10,),
                                  // bulletPoints("asd,j,adfaas"),
                                  // SizedBox(height:10,),
                                  // bulletPoints("as,jabd,b"),
                                ],
                              ),
                            if(isDemoSelected==true)
                              Container(
                                width:400,
                                height: 600,
                                // color: Colors.grey,
                                child: VideoPlayer(v2),
                              ),


                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }else{
      return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Text("Project Details",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 25,
                  ),),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        width: 400,
                        // height: 700,
                        decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(

                              blurRadius:6,
                              // blurStyle: BlurStyle.solid,
                              spreadRadius:6,
                              color: Colors.purple.shade50,
                              // blurStyle: BlurStyle.
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all( color: Colors.purple.shade50,width:2.5),
                          // color: Colors.grey,

                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //image

                              Container(
                                margin: EdgeInsets.all(0),
                                width:80,
                                height:80,
                                child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(fit: BoxFit.fill,widget.iconLink)),
                              ),

                              //project name
                              SizedBox(height:10,),
                              Text("${widget.projectName}",style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 25,
                              ),),
                              //tagline

                              Text("${widget.projectTagline}",style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),

                              SizedBox(height: 30,),
                              //tech Stack

                              Container(
                                width: 450,
                                height: 80,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(width: 10,),
                                      Container(
                                        width:100,
                                        height: 40,
                                        decoration: BoxDecoration(border: Border.all(
                                          color: Colors.black,
                                          width: 0.5,

                                        ),
                                            borderRadius: BorderRadius.all(Radius.circular(50))

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              widget.techStack[0],
                                              Text("${techStack1}",style: TextStyle(fontWeight: FontWeight.bold)),


                                            ],
                                          ),
                                        ),

                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        width:100,
                                        height: 40,
                                        decoration: BoxDecoration(border: Border.all(
                                          color: Colors.black,
                                          width: 0.5,

                                        ),
                                            borderRadius: BorderRadius.all(Radius.circular(50))

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              widget.techStack[1],
                                              Text("${techStack2}",style: TextStyle(fontWeight: FontWeight.bold)),


                                            ],
                                          ),
                                        ),

                                      ),
                                      SizedBox(width: 10,),
                                      if(widget.techStack.length>2)
                                      Container(
                                        width:100,
                                        height: 40,
                                        decoration: BoxDecoration(border: Border.all(
                                          color: Colors.black,
                                          width: 0.5,

                                        ),
                                            borderRadius: BorderRadius.all(Radius.circular(50))

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              widget.techStack[2],
                                              Text("${techStack3}",style: TextStyle(fontWeight: FontWeight.bold)),


                                            ],
                                          ),
                                        ),

                                      ),
                                      SizedBox(width: 10,),
                                      if(widget.projectName=="ProjectLoco")
                                        Container(
                                          width:100,
                                          height: 40,
                                          decoration: BoxDecoration(border: Border.all(
                                            color: Colors.black,
                                            width: 0.5,

                                          ),
                                              borderRadius: BorderRadius.all(Radius.circular(50))

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                if(widget.techStack.length>2)
                                                widget.techStack[3],
                                                if(widget.techStack.length>2)
                                                Text("${techStack4}",style: TextStyle(fontWeight: FontWeight.bold)),


                                              ],
                                            ),
                                          ),

                                        ),
                                    ],
                                  ),
                                ),
                              ),

                              //tabbar for the project
                              Center(
                                child: Container(


                                  // margin: EdgeInsets.only(left:45),
                                  width: 400,
                                  height:60,
                                  decoration: BoxDecoration(
                                    // border: BorderDirectional(bottom: BorderSide(
                                    //   color: Colors.black,
                                    //   width: 1,
                                    //
                                    // ))
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: (){
                                            makeOverViewBorder();
                                            showTab(true,false);
                                          },


                                          // focusColor: Colors.purple,
                                          child: Container(
                                            width: 120,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              // color: Colors.red,
                                              border: BorderDirectional(bottom: BorderSide(
                                                color:overViewBorder,
                                                width: 2,

                                              )),
                                            ),
                                            child: Center(child: Text("Overview",style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize:14
                                            ),)),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: (){
                                            makeDemoBorder();
                                            showTab(false,true);
                                          },
                                          child: Container(
                                            width: 120,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              // color: demoBorder,
                                              // color: Colors.red,
                                                border: BorderDirectional(bottom: BorderSide(
                                                  color: demoBorder,
                                                  width: 2,

                                                ))
                                            ),
                                            child: Center(child: Text("Demo",style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize:14
                                            ),)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height:10,),
                              if(isOverviewSelected==true)
                                Align(


                                    alignment: Alignment.bottomLeft,child:


                                Text("${widget.overView}")),
                              if(isOverviewSelected==true)
                                SizedBox(height:10,),
                              if(isOverviewSelected==true)
                                Align(
                                    alignment: Alignment.bottomLeft,child: Text("Responsibilites",style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.black),))
                              ,
                              //bullet points
                              SizedBox(height:10,),
                              if(isOverviewSelected==true)
                                Column(
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        height:150,
                                        child: ListView.builder(itemCount: widget.bulletPoints.length,itemBuilder: (context, index) {
                                          return bulletPoints("${widget.bulletPoints[index]}");
                                        },),
                                      ),
                                    )
                                    // SizedBox(height:10,),
                                    // bulletPoints("asd,j,adfaas"),
                                    // SizedBox(height:10,),
                                    // bulletPoints("as,jabd,b"),
                                  ],
                                ),
                              if(isDemoSelected==true)
                                Container(
                                  width:400,
                                  height: 600,
                                  // color: Colors.grey,
                                  child: VideoPlayer(v2),
                                ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

  }


  Widget bulletPoints(information){
    return  Container(
      // height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,

        children: [
          // SizedBox(height:20),
          Container(
            width:8,
            height: 8,
            color: Colors.black,
          ),
          SizedBox(width:20,),
          Expanded(child: Text("${information}")),
        ],
      ),
    );
  }

}

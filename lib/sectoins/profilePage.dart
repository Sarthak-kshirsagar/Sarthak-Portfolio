import 'package:flutter/material.dart';

class ProfilePageLanding extends StatefulWidget {
  const ProfilePageLanding({super.key});

  @override
  State<ProfilePageLanding> createState() => _ProfilePageLandingState();
}

class _ProfilePageLandingState extends State<ProfilePageLanding> {
double leftOffset = 0;
  void adjustCircleAvtar(){
    double screenSize = MediaQuery.of(context).size.width;
    if(screenSize<=320){
      setState(() {
        leftOffset =80;
      });
    }else if(screenSize>320 && screenSize<=380){
      setState(() {
        leftOffset=95;
      });
    }else if(screenSize>380){
      setState(() {
        leftOffset=105;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    adjustCircleAvtar();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            height: 900,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
              // alignment: Alignment.center,

              // fit: StackFit.,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width ,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25)),
                      color: Colors.white54
                    ),

                    child: ClipRRect(

                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25)),
                    child: Image.asset(fit: BoxFit.cover,"assets/background.jpg")),
                  ),

                  //Profile


                  Positioned(
                    top: 100,
                    left:(MediaQuery.of(context).size.width - 250)/2,
                    child: Container(
                      width:250,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/icon.jpg"),
                          ),
                          Text("Sarthak Kshirsagar",style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize:18
                          )),
                          Text("short Desc")
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top:250,
                    left: 80,
                    bottom:-150,
                    right: 80,
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(15),

                      child: Container(
                        width:250,
                        height:200,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          // border: Border.all(color: Colors.purpleAccent.shade200,width: 0.5),
                          borderRadius: BorderRadius.circular(15),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:  Column(
                              children: [


                                   Text("About Me",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                                Container(width:150,child: Divider(color: Colors.purpleAccent,thickness: 1.5,)),
                                SizedBox(height: 10,),
                                Expanded(child: Text(textAlign:TextAlign.center,"Hello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlbl")),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),




                ],

              ),
              SizedBox(height:180,),
              Container(
                // height: 350,
                child: Column(
                  children: [
                    Text("Highlights",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize:18,

                    ),),
                    SizedBox(height:10,),
                    Container(
                      width:350,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            highlightsSlider("assets/icon.jpg","Hackathon Participation"),
                            SizedBox(width: 10,),
                            highlightsSlider("assets/icon.jpg","Hackathon Participation"),
                            SizedBox(width: 10,),
                            highlightsSlider("assets/icon.jpg","Hackathon Participation"),
                            SizedBox(width: 10,),

                          ],
                        ),
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget highlightsSlider(imglink,heading){
    return Container(
      // height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width:250,
            height: 250,
            child: Image.asset("${imglink}")
          ),
          SizedBox(height: 10,),
          Text("${heading}",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
          ]
      ),
    );
  }
}

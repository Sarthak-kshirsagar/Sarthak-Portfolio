import 'package:flutter/material.dart';
import 'package:portfolio/sectoins/widgets/highlights.dart';

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
    return showProfilePage(context);
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: showProfilePage(context),
    //     // child: Container(
    //     //     height: 900,
    //     //   child: Column(
    //     //     // mainAxisAlignment: MainAxisAlignment.center,
    //     //     children: [
    //     //       Stack(
    //     //         clipBehavior: Clip.none,
    //     //       // alignment: Alignment.center,
    //     //
    //     //       // fit: StackFit.,
    //     //         children: [
    //     //           Container(
    //     //             width:MediaQuery.of(context).size.width ,
    //     //             height: 300,
    //     //             decoration: BoxDecoration(
    //     //               borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25)),
    //     //               color: Colors.white54
    //     //             ),
    //     //
    //     //             child: ClipRRect(
    //     //
    //     //                 borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25)),
    //     //             child: Image.asset(fit: BoxFit.cover,"assets/background.jpg")),
    //     //           ),
    //     //
    //     //           //Profile
    //     //
    //     //
    //     //           Positioned(
    //     //             top: 100,
    //     //             left:(MediaQuery.of(context).size.width - 250)/2,
    //     //             child: Container(
    //     //               width:250,
    //     //               child: Column(
    //     //                 // crossAxisAlignment: CrossAxisAlignment.center,
    //     //                 children: [
    //     //                   CircleAvatar(
    //     //                     radius: 40,
    //     //                     backgroundImage: AssetImage("assets/profPic.jpg"),
    //     //                   ),
    //     //                   Text("Sarthak Kshirsagar",style: TextStyle(
    //     //                     fontWeight: FontWeight.bold,fontSize:18
    //     //                   )),
    //     //                   Text("short Desc")
    //     //                 ],
    //     //               ),
    //     //             ),
    //     //           ),
    //     //
    //     //           Positioned(
    //     //             top:230,
    //     //             left: 80,
    //     //             bottom:-150,
    //     //             right: 80,
    //     //             child: Material(
    //     //               elevation: 20,
    //     //               borderRadius: BorderRadius.circular(15),
    //     //
    //     //               child: Container(
    //     //                 width:550,
    //     //                 height:300,
    //     //                 decoration: BoxDecoration(
    //     //                   color:Colors.white,
    //     //                   // border: Border.all(color: Colors.purpleAccent.shade200,width: 0.5),
    //     //                   borderRadius: BorderRadius.circular(15),
    //     //
    //     //                 ),
    //     //                 child: Padding(
    //     //                   padding: const EdgeInsets.all(8.0),
    //     //                   child: Container(
    //     //                     height: 330,
    //     //                     width: 550,
    //     //                     decoration: BoxDecoration(
    //     //                       borderRadius: BorderRadius.circular(15),
    //     //                     ),
    //     //                     child:  Column(
    //     //                       children: [
    //     //
    //     //
    //     //                            Text("About Me",style: TextStyle(
    //     //                             fontWeight: FontWeight.bold,
    //     //                             fontSize: 18,
    //     //                           )),
    //     //                         Container(width:550,child: Divider(color: Colors.purpleAccent,thickness: 1.5,)),
    //     //                         SizedBox(height: 10,),
    //     //                         Expanded(child: Container(width: 300,child: Text(textAlign:TextAlign.center,"Hello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlblHello my name is Sarthak Kshorsagar form adfjlbl"))),
    //     //
    //     //
    //     //                       ],
    //     //                     ),
    //     //                   ),
    //     //                 ),
    //     //               ),
    //     //             ),
    //     //           ),
    //     //
    //     //
    //     //
    //     //
    //     //         ],
    //     //
    //     //       ),
    //     //       SizedBox(height:180,),
    //     //       Container(
    //     //         // height: 350,
    //     //         child: Column(
    //     //           children: [
    //     //             Text("Highlights",style: TextStyle(
    //     //               fontWeight: FontWeight.bold,fontSize:18,
    //     //
    //     //             ),),
    //     //             SizedBox(height:10,),
    //     //             Container(
    //     //               width:350,
    //     //               child: SingleChildScrollView(
    //     //                 scrollDirection: Axis.horizontal,
    //     //                 child: Row(
    //     //                   children: [
    //     //                     SizedBox(width: 10,),
    //     //                     highlightsSlider("assets/icon.jpg","Hackathon Participation"),
    //     //                     SizedBox(width: 10,),
    //     //                     highlightsSlider("assets/icon.jpg","Hackathon Participation"),
    //     //                     SizedBox(width: 10,),
    //     //                     highlightsSlider("assets/icon.jpg","Hackathon Participation"),
    //     //                     SizedBox(width: 10,),
    //     //
    //     //                   ],
    //     //                 ),
    //     //               )
    //     //             )
    //     //           ],
    //     //         ),
    //     //       )
    //     //     ],
    //     //   ),
    //     // ),
    //   ),
    // );
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

Widget showProfilePage(BuildContext context){
  List<HighlightsImages>highLightDetails = [
    HighlightsImages("assets/convocation.jpg","Convocation @GPP"),
    HighlightsImages("assets/bluebit.jpg","BlueBit Hackathon"),
    HighlightsImages("assets/iccuba.jpg","ICCUBEA Conference"),
    HighlightsImages("assets/bb.jpg","PCCOE"),
  ];
  if(MediaQuery.of(context).size.width<600){
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/profPic.jpg"),
                  ),
                  Text("Sarthak kshirsagar",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize:18
                  ),),
                  SizedBox(height:5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(textAlign: TextAlign.center,"Full Stack\nApp Developer",style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 15,color: Colors.purple
                    ),),
                  ),



                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Let's Introduce\n     About Myself",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18,
              )),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                width: 300,
                height: 150,
                child:   Text(
                    "Hello, I am a passionate Flutter developer and Computer Science and Engineering student specializing in Artificial Intelligence and Machine Learning. With a robust skill set that encompasses Django, Flutter, and Firebase, I have successfully undertaken multiple app development projects.\n\nMy unique niche lies in seamlessly integrating Machine Learning into these applications, showcasing a dynamic fusion of cutting-edge technologies. From crafting intuitive Flutter interfaces to implementing powerful backend solutions with Django and Firebase, I bring a versatile approach to app development. \n\n Explore my portfolio to witness the synergy of my coding expertise and AI/ML proficiency in action."),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white)
              ),onPressed: (){}, child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text("Download Cv"),
              )),
            ),
          ),
          SizedBox(height: 20,),
          Text("Highlights",style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 18
          )),
          Container(width: 80,child: Divider(color: Colors.purpleAccent,thickness: 2)),
          SingleChildScrollView(

            child: Container(
              margin: EdgeInsets.all(0),
              height: 500,
              child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: highLightDetails.length,itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width:250,
                      height: 380,
                      child: Column(
                        children: [
                          Container(
                              width:320,child: Image.asset("${highLightDetails[index].imgUrl}")),
                          SizedBox(width: 10,),
                          SizedBox(height:10),
                          Text("${highLightDetails[index].heading}",style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 16,color: Colors.purpleAccent
                          )),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                );
              },),
            ),
          ),

        ],
      ),
    ),
  );
  }else{
      return   Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/profPic.jpg"),
                      ),
                      Text("Sarthak kshirsagar",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize:18
                      ),),
                      SizedBox(height:5,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(textAlign: TextAlign.center,"Full Stack\nApp Developer",style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 15,color: Colors.purple
                        ),),
                      ),



                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Let's Introduce\n About Myself",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 18,
                  )),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width:600,
                    height:250,
                    child:   Text(
                        "Hello, I am a passionate Flutter developer and Computer Science and Engineering student specializing in Artificial Intelligence and Machine Learning. With a robust skill set that encompasses Django, Flutter, and Firebase, I have successfully undertaken multiple app development projects.\n\nMy unique niche lies in seamlessly integrating Machine Learning into these applications, showcasing a dynamic fusion of cutting-edge technologies. From crafting intuitive Flutter interfaces to implementing powerful backend solutions with Django and Firebase, I bring a versatile approach to app development. \n\n Explore my portfolio to witness the synergy of my coding expertise and AI/ML proficiency in action."),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)
                  ),onPressed: (){}, child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text("Download Cv"),
                  )),
                ),
              ),
              SizedBox(height: 20,),
              Text("Highlights",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 18
              )),
              Container(width: 80,child: Divider(color: Colors.purpleAccent,thickness: 2)),
              SingleChildScrollView(

                child: Container(
                  margin: EdgeInsets.all(0),
                  height: 500,
                  child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: highLightDetails.length,itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width:250,
                          height: 380,
                          child: Column(
                            children: [
                              Container(
                                  width:320,child: Image.asset("${highLightDetails[index].imgUrl}")),
                              SizedBox(width: 10,),
                              SizedBox(height:10),
                              Text("${highLightDetails[index].heading}",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 16,color: Colors.purpleAccent
                              )),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    );
                  },),
                ),
              ),

            ],
          ),
        ),
      );
  }

}

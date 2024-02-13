import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  ScrollController dummyCon = new ScrollController();
  double targetht = 100;
  bool isVisible = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dummyCon.addListener(onscroll);
  }
  void onscroll(){
    setState(() {
      isVisible = dummyCon.offset>=targetht;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        controller: dummyCon,
        child: Column(
          children: [
            SizedBox(height: 500,),
            Opacity(
              opacity: isVisible?1.0:0.0,
              child: Container(

                  height: 500,child: Text("dgukadfkd")),
            ),
            SizedBox(height: 500,),
            AnimatedOpacity(curve: Curves.bounceInOut,duration: Duration(seconds:50),opacity: isVisible?1.0:0.0,child: Text("Now it is visible"))
          ],
        ),
      )
    );
  }
}

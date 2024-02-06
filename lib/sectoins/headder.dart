import 'package:flutter/material.dart';
import 'package:portfolio/sectoins/widgets/buttonsP.dart';
class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return   Container(
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
          Text("Sarthak",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),),
          SizedBox(width: 50,),
          Row(

            children: [
              buttons("Home"),
              SizedBox(width: 20,),
              buttons("About"),
              SizedBox(width: 20,),
              buttons("Projects"),
              SizedBox(width: 20,),
              buttons("Contact")
            ],
          ),
          SizedBox(width: 20,)
        ],
      ),
    );
  }
}

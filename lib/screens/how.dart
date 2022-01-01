import 'dart:async';

import 'package:flutter/material.dart';

class HowToPlay extends StatefulWidget {

  @override
  _HowToPlayState createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {


  int i = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(
            milliseconds: 600), (timer) {
      setState(() {
        if(i == 3){
          i = 0;
        }else{
          i++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaH = MediaQuery.of(context).size.height;
    double mediaW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: mediaH,
        width: mediaW,
        decoration: BoxDecoration(
            gradient: LinearGradient(

                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                stops: [0,0.5,1],

                colors: [
                  Color(0xffFFCC70),
                  Color(0xffC850C0),
                  Color(0xff4158D0),
                ],

            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: mediaH*0.1,),
            Container(
              height: mediaW*0.125,
              width: mediaW*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Center(
                  child: Text("How To Play",
                    style: TextStyle(
                      fontSize: mediaW*0.055,
                      fontFamily: "Source",
                      fontWeight: FontWeight.w600,
                      color: Color(0xffDD2A7B),
                    ),)
              ),
            ),
            SizedBox(height: mediaH*0.1,),
            Container(
              height: mediaH*0.22,
              width: mediaW*0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                  softWrap: true,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'To win the game player need to cross the ',
                          style: TextStyle(
                            color: Color(0xffDD2A7B).withOpacity(0.8),
                              fontSize: mediaW*0.04,
                              fontWeight: FontWeight.w600)),
                      TextSpan(text: 'Yellow line ',
                          style: TextStyle(
                              color: Colors.yellow.shade700,
                              fontSize: mediaW*0.04,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: ' before the opponent by taping on there button ( red or blue )\n',
                          style: TextStyle(
                              color: Color(0xffDD2A7B).withOpacity(0.8),
                              fontSize: mediaW*0.04,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: 'when a player tap on there button the length of there side'
                              ' will increase and the side of opponent will decrease',
                          style: TextStyle(
                              color: Color(0xffDD2A7B).withOpacity(0.8),
                              fontSize: mediaW*0.04,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

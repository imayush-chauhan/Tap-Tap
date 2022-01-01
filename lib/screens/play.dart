import 'dart:async';
import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  final bool isComp;
  Play({required this.isComp});

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {

  @override
  void initState() {
    super.initState();
    count();
  }

  bool onPress = true;
  int countNum = 0;
  double r = 0;
  double b = 0;
  late Timer timer;
  late Timer compTimer;

  List c = [
    "",
    "3",
    "2",
    "1",
    "Go",
    "",
    "",
  ];

  redPress() {
    setState(() {
      r = r + 0.03;
      b = b - 0.03;
      if(r >= 0.45){
        onPress = false;
        if(widget.isComp == true){
          compTimer.cancel();
        }
        showWinDialog("Red's won");
      }
    });
  }

  bluePress() {
    setState(() {
      b = b + 0.03;
      r = r - 0.03;
      if(b >= 0.45){
        onPress = false;
        if(widget.isComp == true){
          compTimer.cancel();
        }
        showWinDialog("Blue's won");
      }
    });
  }

  count(){
    countNum != 0 ?
    timer = Timer.periodic(
        Duration(
            milliseconds: 800), (timer) {
      setState(() {
        countNum++;
        if(countNum == 5){
          onPress = true;
          countNum = 0;
          if(widget.isComp == true){
            compTimer = Timer.periodic(
                Duration(milliseconds: 250), (timer) {
              redPress();
            });
          }
          timer.cancel();
        }
      });
    }) : Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        countNum++;
        count();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    compTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double mediaQH = MediaQuery.of(context).size.height;
    double mediaQW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: mediaQH,
              width: mediaQW,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: mediaQH * 0.5 + mediaQH * r,
                    width: mediaQW,
                    color: Colors.red,
                  ),
                  Container(
                    height: mediaQH * 0.5 + mediaQH * b,
                    width: mediaQW,
                    color: Colors.blue,
                  ),
                ],
              )),
          Container(
            height: mediaQH,
            width: mediaQW,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if(onPress == true){
                      redPress();
                    }
                  },
                  child: Container(
                    height: 55,
                    width: 140,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27.5),
                      ),
                      elevation: 10,
                      child: Center(
                          child: Text(
                              widget.isComp == false ?
                              "red" : "AI",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if(onPress == true){
                      bluePress();
                    }
                  },
                  child: Container(
                    height: 55,
                    width: 140,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27.5),
                      ),
                      elevation: 10,
                      child: Center(
                          child: Text(
                            widget.isComp == false ?
                        "blue" : "player",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: mediaQH*0.05,
                  ),
                  Container(
                    height: 1,
                    width: mediaQW,
                    color: Colors.yellow,
                  ),
                ],
              ),
              onPress == false ?
              GestureDetector(
                onTap: () {
                  restart();
                },
                child: Container(
                  height: 55,
                  width: 140,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.5),
                    ),
                    elevation: 10,
                    child: Center(
                        child: Text(
                          "Restart",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        )),
                  ),
                ),
              ) : Container(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: mediaQW,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: mediaQH*0.05,
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: countNum != 0 ? mediaQH : 0,
            width: countNum!= 0 ? mediaQW : 0,
            color: Colors.black.withOpacity(0.2),
            alignment: Alignment.center,
            child: Text(c[countNum],
              style: TextStyle(
                fontSize: mediaQW*0.3,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  restart(){
    setState(() {
      r = 0;
      b = 0;
      count();
      onPress = true;
    });
  }

  showWinDialog(String yo) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Center(child: Text(
                yo
            )),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("cancel",
                        style: TextStyle(
                          fontSize: 21,
                          color: Color(0xff151515),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.11,
                  ),
                  GestureDetector(
                    onTap: () {
                      restart();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 55,
                      width: 140,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.5),
                        ),
                        elevation: 10,
                        child: Center(
                            child: Text(
                              "Restart",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }

}

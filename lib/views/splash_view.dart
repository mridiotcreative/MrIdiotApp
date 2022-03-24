import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool op = true,op1 = false,op2 = false,op3 = false,op4 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secondTimer();
  }
  secondTimer(){
    Timer(Duration(seconds: 1),
            (){
          setState(() {
            op != true ?
            op=true
                : op1 != true ?
            op1 = true
                : op2 != true ?
            op2 = true
                : op4 != true ?
            op4 = true
                : op4 = true;
            if(op4 == true){
              op= true;
              op1 = true;
              op2 = true;
              op3 = true;
              op4 = true;
            }
            else{
              secondTimer();
            }
          });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xffE0E0E0),
        body: Stack(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Positioned(
              left: 0,
              top: 30,
              right: 0,
              bottom: 0,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: AnimatedOpacity(
                  opacity: 0.0,//op3 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/endd.png",
                    //height: 200,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left:0,
              right: 0,
              child: Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                color:Colors.transparent,
                child: AnimatedOpacity(
                  opacity: op ? 1.0: 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/person.png",
                    height: 400,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 350,
              left: 40,
              //right: 0,
              child: Container(

                width: MediaQuery.of(context).size.width,
                color:Colors.transparent,
                child: AnimatedOpacity(
                  opacity: op1 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/bulb.png",
                    height: 150,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 420,
              //left: ,
              right: 80,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  opacity: op2 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/bulb.png",
                    height: 200,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   //left: ,
            //   right: 10,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     color: Colors.transparent,
            //     child: AnimatedOpacity(
            //       opacity: 1.0 ,
            //       duration: Duration(milliseconds: 400),
            //       child: Image.asset(
            //         "assets/images/blast.png",
            //         height: 200,
            //       ),
            //     ),
            //   ),
            // ),
            ///blast
            Positioned(
              //bottom: 0,
              top: MediaQuery.of(context).size.width * 1.0,
              left: MediaQuery.of(context).size.width * 0.01,
              //right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                color: Colors.transparent,
                //color: Colors.red,
                child: AnimatedOpacity(
                  opacity: op4 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/blast.png",
                    height: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              //bottom: 0,
              top: MediaQuery.of(context).size.width * 0.05,
              left: MediaQuery.of(context).size.width * -0.08,
              //right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                color: Colors.transparent,
                //color: Colors.yellow,
                child: AnimatedOpacity(
                  opacity: op4 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/blast.png",
                    //"assets/images/star.png",
                    height: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              //bottom: 0,
              top: MediaQuery.of(context).size.width * 0.23,
              left: MediaQuery.of(context).size.width * 0.15,
              //right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                //color: Colors.blue,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  opacity:op4 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/blast.png",
                    //"assets/images/star.png",
                    height: 70,
                  ),
                ),
              ),
            ),

            Positioned(
              //bottom: 0,
              top: MediaQuery.of(context).size.width * 0.6,
              right: MediaQuery.of(context).size.width *0.25,
              //right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                //color: Colors.black,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  opacity: op4 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/blast.png",
                    //"assets/images/star.png",
                    height: 60,
                  ),
                ),
              ),
            ),
            Positioned(
              //bottom: 0,
              bottom: MediaQuery.of(context).size.width * 1.05,
              right: MediaQuery.of(context).size.width *0.05,
              //right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                //color: Colors.orange,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  opacity: op4 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/blast.png",
                    //"assets/images/star.png",
                    height: 50,
                  ),
                ),
              ),
            ),

            Positioned(
              //bottom: 0,
              bottom: MediaQuery.of(context).size.width * 0.52,
              left: MediaQuery.of(context).size.width *0.15,
              //right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                //color: Colors.green,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  opacity: op4 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/blast.png",
                    //"assets/images/star.png",
                    height: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              //bottom: 0,
              bottom: MediaQuery.of(context).size.width * 0.30,
              left: MediaQuery.of(context).size.width *-0.020,
              //right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                //color: Colors.greenAccent,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  opacity: op4 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/images/blast.png",
                    //"assets/images/star.png",
                    height: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              //bottom: 0,
              top: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0,
              //right: 0,
              child: AnimatedOpacity(
                  opacity: op2 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.blue,
                    padding: const EdgeInsets.only(left:10),
                    child: const Text( "Think" ,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                  )
              ),
            ),
            Positioned(
              //bottom: 0,
              top: MediaQuery.of(context).size.width * 0.32,
              right: MediaQuery.of(context).size.width * -0.05,
              //right: 0,
              child: AnimatedOpacity(
                  opacity: op1 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.red,
                    padding: EdgeInsets.only(left:10),
                    child: Text( "Create" ,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                  )
              ),
            ),
            Positioned(
              //bottom: 0,
              top: MediaQuery.of(context).size.width * 0.44,
              right: MediaQuery.of(context).size.width * -0.12,
              //right: 0,
              child: AnimatedOpacity(
                  opacity: op ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.green,
                    padding: const EdgeInsets.only(left:10),
                    child: const Text( "Innovate" ,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                  )
              ),
            ),
          ],
        )
    );
  }
}
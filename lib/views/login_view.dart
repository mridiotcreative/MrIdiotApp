import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(left:10,right:10),
                child: Column(
                  children: [
                    /// mr idiot Logo image
                    Padding(
                      padding: const EdgeInsets.only(left:60),
                      child: Image.asset(
                        "assets/images/idiot.png",
                        height:MediaQuery.of(context).size.height*0.35,
                        //height:MediaQuery.of(context).size.height*0.29,
                      ),
                    ),
                    /// Mr Idiot Text
                    Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child:  Text(
                            "Mr Idiot",
                            style: TextStyle(
                                fontFamily:"YesevaOne",// "YesevaOne",//TimesNewRoman
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                    ),
                    /// Separator
                    Padding(
                      padding: EdgeInsets.only(
                        top:0,
                        left: MediaQuery.of(context).size.width*0.2,
                        right: MediaQuery.of(context).size.width*0.2,
                      ),
                      child: Image.asset("assets/images/seperator.png",),
                    ),
                    /// indian number textfield
                    Container(
                      height:50,
                      margin: const EdgeInsets.only(left:10, right:10,top:20,bottom: 10),
                      padding: const EdgeInsets.only(top:10,bottom:10),
                      decoration: BoxDecoration(
                          color: const Color(0xffE6E8EE),
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Image.asset("assets/images/flag.png",height: MediaQuery.of(context).size.height*0.046,),
                          ),
                          const SizedBox(width:10,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:10,right:15),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Lato",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                ),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                                  prefixIcon: Text(
                                    "+91  ",
                                    style: TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  counterText: "",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    /// "OR" separator image
                    Padding(
                      padding: EdgeInsets.only(
                          top:10,
                          left: MediaQuery.of(context).size.width*0.2,
                          right: MediaQuery.of(context).size.width*0.2,
                          bottom: 10
                      ),
                      child: Image.asset("assets/images/or.png"),
                    ),
                    /// Google button
                    Container(
                      height:50,
                      margin: const EdgeInsets.only(left:10, right:10,top:20),
                      padding: const EdgeInsets.only(top:10,bottom:10),
                      decoration: BoxDecoration(
                          color: const Color(0xffFF0C0C),
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(left: 15.0),
                            child: Image.asset("assets/images/googlelogo.png",width:MediaQuery.of(context).size.width*0.1,),
                          ),
                          const SizedBox(width:20,),
                          const Expanded(
                            child: Text(
                              "Continue with Google",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /// Facebook button
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(left:10, right:10,top:10),
                      padding: const EdgeInsets.only(top:10,bottom:10),
                      decoration: BoxDecoration(
                          color: const Color(0xff1878F3),
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(left: 15.0),
                            child: Image.asset("assets/images/fblogo.png",width:MediaQuery.of(context).size.width*0.07,),
                          ),
                          const SizedBox(width:20,),
                          const Expanded(
                            child: Text(
                              "Continue with Facebook",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /// Continue button
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ScreenOtp()),
                        );
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(left:10, right:10,top:20),
                        // padding: const EdgeInsets.only(top:10,bottom:10),
                        width: MediaQuery.of(context).size.width*0.40,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFC909),
//                            color: const Color(0xff0A0808),
                            borderRadius: BorderRadius.circular(17)
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left:15,right:15),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Expanded(
                                          child: Text(
                                            "Continue",
                                            style: TextStyle(
                                                fontFamily: "Roboto",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xff000000)
//                                              color: Colors.white
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image:AssetImage("assets/images/Arrowicon_black.png",),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        width: MediaQuery.of(context).size.width*0.085,
                                        //width: 40,
                                        height: 25,
                                        // child: Image.asset(
                                        //   "assets/images/arrowicon.png",
                                        //   height: 20,
                                        //   width: 50,
                                        // ),
                                      )
                                      // FittedBox(
                                      //   child: FaIcon(
                                      //     FontAwesomeIcons.arrowRight,
                                      //     color: Colors.white,
                                      //     size: 40,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /// End of page statement
                    Container(
                        color:Colors.transparent,
                        margin: const EdgeInsets.only(top:50,bottom:5),
                        child: const Text(
                            "By continuing, you agree to inventer Term of service and acknowledge you have read our Privacy Policy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //fontSize: 15,
                              fontFamily: "Roboto",
                            )
                        )),
                  ],
                ),
              ),
              /// Made in india logo
              Positioned(
                top: 20,
                left: 20,
                child: Image.asset(
                    "assets/images/madeinindia.png",
                    width:100
                ),
              ),
            ],
          )
      ),
    );
  }
}

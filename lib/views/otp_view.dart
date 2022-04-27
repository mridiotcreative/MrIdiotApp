import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/profile_view.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'home_view.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({Key? key}) : super(key: key);

  @override
  _ScreenOtpState createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Align(alignment: Alignment.center,child:Text("Verification",style: TextStyle(
                  fontFamily: "YesevaOne",
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff0E204F)
              ),)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0,left: 10,right: 10),
              child: Align(
                  alignment: Alignment.center,
                  child:Text(
                    "Please Enter OTP Sent to 9664722696",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 17
                    ),
                    textAlign: TextAlign.center,
                  )
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 10.0),
            //   child: Align(alignment: Alignment.center,child:Text("+919664722696",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),)),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: OTPTextField(
                controller: otpController,
                otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: Colors.black,
                  focusBorderColor:Colors.black,
                ),
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.center,
                margin: EdgeInsets.all(10),
                fieldWidth: 55,
                fieldStyle: FieldStyle.underline,
                outlineBorderRadius: 15,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900
                ),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Didn't Receive The OTP?",style: TextStyle(color: Colors.black,fontSize: 17),),
                  Text(" RESEND OTP",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amber,fontSize: 17),),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()),);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(top: 8,bottom: 8,right: 22,left: 22),
                decoration: BoxDecoration(
                  color: const Color(0xffFFC909),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                      fontFamily: "YesevaOne",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      fontSize: 25
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
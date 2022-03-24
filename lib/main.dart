import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/login_view.dart';
import 'package:mr_idiot_app/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mr. Idiot',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MySplash(),
    );
  }
}
class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);
  @override
  _MySplashState createState() => _MySplashState();
}
class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: "Chat App",))));
  }

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
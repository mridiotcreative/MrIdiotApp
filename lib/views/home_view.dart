import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/profile_view.dart';
import 'package:mr_idiot_app/views/stories_view.dart';

import 'global_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool searchBarView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.red,
        backgroundColor:const Color(0xffFCC609),
//        backgroundColor: Color(0xffD2D4DA),
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.menu,size: 35,),
        centerTitle: true,
        title: searchBarView ? Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                //color: Colors.red,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    //suffixIcon: Icon(Icons.camera_alt)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.black,
              )
            ],
          ),
        ) :  const Text(
          "Mr Idiot",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontFamily: "YesevaOne",
              fontWeight: FontWeight.w900
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                searchBarView ? searchBarView = false : searchBarView = true;
              });
            },
            icon: Icon(
              searchBarView ? Icons.cancel : Icons.search,
            ),
            iconSize: 35,
          ),
          const SizedBox(width: 10,),
          InkWell(
            onTap: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileView()),);
              });
            },
            child: ClipOval(
              child: Image.asset(
                "assets/images/home/profile.png",
                height: 40,
                width: 40,
              ),
            ),
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: const StoryView(),
      bottomNavigationBar: bottomBar(true,context)
    );
  }
}
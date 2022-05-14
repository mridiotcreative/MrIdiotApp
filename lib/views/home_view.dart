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
      backgroundColor: Colors.black,
      appBar: AppBar(
        //backgroundColor: Colors.red,
        backgroundColor: Color(0xffD2D4DA),
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
              fontSize: 20  ,
              fontFamily: "YesevaOne",
              fontWeight: FontWeight.w900
          ),
        ),
        actions: [
          // Expanded(
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Search...',
          //       prefixIcon: Icon(Icons.search),
          //       //suffixIcon: Icon(Icons.camera_alt)
          //     ),
          //   ),
          // ),
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
      // bottomNavigationBar:Container(
      //   color: Colors.transparent,
      //   child: Stack(
      //     children: [
      //       CustomPaint(
      //         size: Size(MediaQuery.of(context).size.width,100),
      //         painter: PaintTriangle(backgroundColor: Colors.blue),
      //       ),
      //       Positioned(
      //         bottom: 0,
      //         child: Container(
      //           height: MediaQuery.of(context).size.height*0.1,
      //           width: MediaQuery.of(context).size.width,
      //           //color: Colors.blue,
      //         ),
      //       )
      //     ],
      //   ),
      // )
      /// with image
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage(
      //               "assets/images/home/bottomyellow.png"
      //           ),
      //           fit: BoxFit.fill
      //       ),
      //       //color: Color(0xff28365A),
      //       color:Colors.transparent
      //   ),
      //   padding: const EdgeInsets.only(top:10,bottom:10),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: const [
      //       Icon(
      //         Icons.home,
      //         color: Colors.white,
      //         size: 35,
      //       ),
      //       Icon(
      //         Icons.add,
      //         color: Colors.white,
      //         size: 40,
      //         //           size: 50,
      //       ),
      //       Icon(
      //         Icons.shopping_cart,
      //         color: Colors.white,
      //         size: 35,
      //       ),
      //     ],
      //   ),
      // ),
      /// older one
      bottomNavigationBar: bottomBar(true,context)
      // Container(
      //   padding: const EdgeInsets.only(top:10,bottom:10),
      //   color: Color(0xff28365A),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: const [
      //       Icon(
      //         Icons.home,
      //         color: Colors.white,
      //         size: 35,
      //       ),
      //       Icon(
      //         Icons.add,
      //         color: Colors.white,
      //         size: 50,
      //       ),
      //       Icon(
      //         Icons.shopping_cart,
      //         color: Colors.white,
      //         size: 35,
      //       ),
      //     ],
      //   ),
      // ),
      /// older one
      // bottomNavigationBar: FancyBottomNavigation(
      //   barBackgroundColor: Colors.blue,
      //   circleColor: Colors.white,
      //   activeIconColor: Colors.blue,
      //   inactiveIconColor: Colors.white,
      //   tabs: [
      //     TabData(iconData: Icons.home, title: "Home"),
      //     TabData(iconData: Icons.add, title: "Add"),
      //     TabData(iconData: Icons.shopping_cart, title: "Shopping")
      //   ],
      //   onTabChangedListener: (position) {
      //     setState(() {
      //       //currentPage = position;
      //     });
      //   },
      // ),
      /// ///////
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color(0xff28365A),
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             Icons.home
      //         ),
      //       label: ""
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             Icons.add,
      //           size: 30,
      //         ),
      //         label: ""
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             Icons.shopping_cart
      //         ),
      //         label: ""
      //     )
      //   ],
      // ),
    );
  }
}
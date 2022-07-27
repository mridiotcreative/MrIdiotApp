import 'package:flutter/material.dart';

import '../global_widget.dart';
import '../profile_view.dart';
import 'address_view.dart';

class SubTotal extends StatefulWidget {
  const SubTotal({Key? key}) : super(key: key);

  @override
  _SubTotalState createState() => _SubTotalState();
}

class _SubTotalState extends State<SubTotal> {
  bool searchBarView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color:const Color(0xff2D2D37),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.yellow
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      child: Row(
                        children: [
                          const Icon(Icons.menu),
                          searchBarView ? Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
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
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 0),
                                    width: MediaQuery.of(context).size.width,
                                    height: 1,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          )
                              :  const Expanded(
                            child: SizedBox(),
                          ),
                          IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: (){
                                setState(() {
                                  searchBarView ? searchBarView = false : searchBarView = true;

                                });
                              },
                              icon: Icon(searchBarView ? Icons.cancel :Icons.search))
                        ],
                      ),
                    ),
                  ),
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
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: Row(
                      children: const [
                        Text("Subtotal  ", style: TextStyle(fontSize: 20)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Text("₹", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ),
                        Text(
                          "13,342.00",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: Row(
                      children: const[
                        Text("EMI Available  ",style: TextStyle(fontSize: 15,color: Colors.grey),),
                        Text("Details",style: TextStyle(fontSize: 15,color: Colors.blueAccent),)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Address(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        decoration: BoxDecoration(
                          color: Color(0xffFCC609),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Text("Proceed to Busy(2 items)",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto",
                                fontSize: 15,
                                color:Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(0.8),
                padding: const EdgeInsets.only(top: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left:20,top: 10,bottom: 10,right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/cycle.png",width: MediaQuery.of(context).size.width*0.4,),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "geeky hashtag 26t single speed steel in frame 18 inched height and width description ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        const Text(
                                          "₹7,399.00",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "In Stock",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Sold by ",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "Rajesh Enterprises",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff056d84)
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Color Name:",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "orange",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.12,
                                  height: 35,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.grey.withOpacity(0.2)
                                        ],
                                      ),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                                  ),
                                  child: const Icon(Icons.delete_outline_outlined),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.15,
                                  height: 35,
                                  padding: const EdgeInsets.only(top: 5),
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey),
                                  ),
                                  child: const Text(
                                    "1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff056d84)
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.12,
                                  height: 35,
                                  //padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.grey.withOpacity(0.2)
                                        ],
                                      ),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  margin: const EdgeInsets.only(left:10),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width*0.15,
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children:  [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text("Save for later",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Roboto",
                                          fontSize: 15,
                                          color:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text("See more like this",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Roboto",
                                          fontSize: 15,
                                          color:Colors.black
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: const EdgeInsets.only(left:20,top: 10,bottom: 10,right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/cycle.png",width: MediaQuery.of(context).size.width*0.4,),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "geeky hashtag 26t single speed steel in frame 18 inched height and width description ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        const Text(
                                          "₹7,399.00",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "In Stock",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Sold by ",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "Rajesh Enterprises",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff056d84)
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Color Name:",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "orange",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.12,
                                  height: 35,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.grey.withOpacity(0.2)
                                        ],
                                      ),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                                  ),
                                  child: const Icon(Icons.delete_outline_outlined),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.15,
                                  height: 35,
                                  padding: const EdgeInsets.only(top: 5),
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey),
                                  ),
                                  child: const Text(
                                    "1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff056d84)
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.12,
                                  height: 35,
                                  //padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.grey.withOpacity(0.2)
                                        ],
                                      ),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  margin: const EdgeInsets.only(left:10),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width*0.15,
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children:  [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text("Save for later",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Roboto",
                                          fontSize: 15,
                                          color:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text("See more like this",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Roboto",
                                          fontSize: 15,
                                          color:Colors.black
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: globalECommerceBottomBar(true,context)
    );

  }
}

import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/EcommerceView/add_addess_view.dart';

import '../global_widget.dart';
import '../profile_view.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool searchBarView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2D2D37),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color:  Color(0xff2D2D37),
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
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          height: 45,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.menu_rounded,size: 40,),
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
                                  : Expanded(
                                child: Text(
                                  "",
                                ),
                              ),
                              IconButton(
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
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("Select a delivery address  ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.5,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400)
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        margin: EdgeInsets.only(top: 60,left:20),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: Colors.black12.withOpacity(0.1))
                                        ),
                                        child:Container(
                                          height: 20,
                                          width: 20,
                                          margin: const EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(50),
                                              border: Border.all(color: Colors.blue)
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.60,
                                        margin: EdgeInsets.only(left: 20,top: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Maurrya Shivam Ramjeet'.toUpperCase(), style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
                                            const Padding(
                                              padding:  EdgeInsets.only(top: 2.0),
                                              child: Text("522 rameshwar nagar"),
                                            ),
                                            const Padding(
                                              padding:  EdgeInsets.only(top: 2.0),
                                              child:  Text("Bamroli road pandesara"),
                                            ),
                                            const Padding(
                                              padding:  EdgeInsets.only(top: 2.0),
                                              child:  Text("SURAT, GUJARAT, 394220" ),
                                            ),
                                            const Padding(
                                              padding:  EdgeInsets.only(top: 2.0),
                                              child:  Text("India"),
                                            ),
                                            const Padding(
                                              padding:  EdgeInsets.only(top: 2.0),
                                              child: Text("Phone Number : 9664722697")
                                            ),




                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 15,left: 20,right: 20),
                                    padding: const EdgeInsets.all(10),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFCC609),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Text("Deliver to this address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "Roboto",
                                            fontSize: 17,
                                            color:Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 15,left: 20,right: 20),
                                    padding: const EdgeInsets.all(5),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey.shade300)
                                    ),
                                    child: const Center(
                                      child: Text("Edit Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            color:Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 12,left: 20,right: 20),
                                    padding: const EdgeInsets.all(5),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey.shade300)
                                    ),
                                    child: const Center(
                                      child: Text("Add delivery instructions",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            color:Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.zero,
                            decoration:   BoxDecoration(
                              color: Colors.white10,
                              border:  Border(
                                top: BorderSide(width: 1.5, color: Colors.grey.shade400),
                                bottom: BorderSide(width: 1.4, color: Colors.grey.shade300),
                              ),
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>AddAddressView()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const[
                                  Text("Add a New Address",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color:Colors.black
                                  ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_sharp)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomBar(false,context),// globalECommerceBottomBar(true,context)
    );

  }
}

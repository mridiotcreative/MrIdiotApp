import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mr_idiot_app/views/photopost_view.dart';

import 'global_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  List<String> filterImage = [
    "assets/images/home/f1.png",
    "assets/images/home/f2.png",
    "assets/images/home/f1.png",
    "assets/images/home/f2.png",
    "assets/images/home/f1.png",
    "assets/images/home/f2.png",
    "assets/images/home/f1.png",
    "assets/images/home/f2.png",
    "assets/images/home/f1.png",
    "assets/images/home/f2.png",
  ];
  List<String> postImage = [
    "assets/images/home/p1.png",
    "assets/images/home/p2.png",
    "assets/images/home/p1.png",
    "assets/images/home/p2.png",
    "assets/images/home/p1.png",
    "assets/images/home/p2.png",
    "assets/images/home/p1.png",
    "assets/images/home/p2.png",
    "assets/images/home/p3.png",
    "assets/images/home/p2.png",
    "assets/images/home/p4.png",
    "assets/images/home/p1.png",
    "assets/images/home/p2.png",
    "assets/images/home/p3.png",
    "assets/images/home/p4.png",
    "assets/images/home/p4.png",
  ];

  int? tabs=0;

  @override void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,//Colors.white.withOpacity(0.1),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12.0,left: 2),
                  child:  Image(image: AssetImage("assets/images/setting.png"),
                  height: 22,width: 22,),
                ) ,
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.37,
                  child: const Text("creativescienceteam",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16  ,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700
                    ),),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.more_vert_outlined,color: Color(0xffFFC909),),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// follow , following and photo
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:const[
                        Text("46.4k",style: TextStyle(
                            color: Colors.black,
                            fontSize: 16  ,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold

                        ),),
                        Text("Followers",style: TextStyle(
                            color: Colors.black,
                            fontSize: 13  ,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w100

                        ),),
                      ],
                    ),
                    ///Center profile Image
                    // Container(
                    //   width: 56,
                    //   height: 56,
                    //   alignment: Alignment.center,
                    //   decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //       gradient: LinearGradient(
                    //           begin: Alignment.topRight,
                    //           end: Alignment.bottomRight,
                    //           colors: [
                    //             Color(0xffFFC908),
                    //             Color(0xffC8C69B),
                    //           ])),
                    //   child: Container(
                    //     width: 51,
                    //     height: 51,
                    //     decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //       color: Colors.white,
                    //     ),
                    //     alignment: Alignment.center,
                    //     child: Image.asset("asset/images/profile.png"),
                    //   ),
                    // ),
                    Container(
                      height: 65,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only( left: 15.0,right: 15),
                            child: Container(
                              width: 51,
                              height: 51,
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/profile1.png"),
                            ),
                          ),
                          Positioned(
                              top:37,
                              left: 30,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xffD43F51),
                                      Color(0xffFFBB37),
                                    ]
                                  )
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child:Icon(Icons.add,color: Colors.black,size: 23,),

                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:const[
                        Text("142",style: TextStyle(
                            color: Colors.black,
                            fontSize: 16  ,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold

                        ),),
                        Text("Following",style: TextStyle(
                            color: Colors.black,
                            fontSize: 13  ,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w100

                        ),),
                      ],
                    ),
                  ],
                ),
              ),

              /// name
              Container(
                margin: const EdgeInsets.only(top: 20,right: 20),
                child:  IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const[
                      Text("Mishra Sangam",
                          style: TextStyle(
                              color: Color(0xffFFC909),
                              fontSize: 18  ,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0,right: 8),
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Text("Engineering",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18  ,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700
                          )
                      ),
                    ],
                  ),
                ),
              ),

              /// black description
              const Padding(
                padding: EdgeInsets.only(top: 15.0,left: 12,right: 12),
                child: Text("Hello! This is Sangam here from team Creative Science.we always try to make something new and creative Thanks for your support.From mishra sangam",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
              ),

              ///blue name
              const Padding(
                padding: EdgeInsets.only(top:5.0),
                child: Text("@CREATIVESCIENCE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff087AFF),
                      fontSize: 14
                  ),
                ),
              ),

              ///edit button
              Padding(
                padding:const EdgeInsets.only(left: 0,right: 0,top: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    color: const Color(0xffFCC609),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Center(
                    child: Text("Edit Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto",
                        fontSize: 18,
                        color:Colors.black
                      ),
                    ),
                  ),
                ),
              ),

              ///filter
              Container(
                margin: const EdgeInsets.only(top: 0),
                height: MediaQuery.of(context).size.height*0.10,
                child: ListView.builder(
                  itemCount: filterImage.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Row(
                      children: [
                        index ==0 ? Container(
                          margin: const EdgeInsets.only(left:7,top:0,right:7,bottom: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,//Color(0xffBBBDC2),
                            border: Border.all(
                                color: const Color(0xffFCC609),
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/backgroundcircleprofile.png",),
                              fit: BoxFit.contain
                            )
                          ),
                          height: 51,//MediaQuery.of(context).size.height*0.085,
                          width: 51,//MediaQuery.of(context).size.width*0.16,
                          child: const Icon(Icons.add,color: Colors.black,size: 40,),
                        ): const SizedBox(),
                        Container(
                            margin: const EdgeInsets.only(left:7,top:0,right:7,bottom: 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffFCC609),
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 51,//MediaQuery.of(context).size.height*0.085,
                            width: 51,//MediaQuery.of(context).size.width*0.16,
                            child: ClipRRect(
                              child: Image.asset(
                                filterImage[index],
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            )
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 0),
              //   child: Center(
              //     child: Divider(
              //       color: Colors.black.withOpacity(0.6),
              //       thickness: 1,
              //     ),
              //   ),
              // ),
              // const TabBar(
              //   unselectedLabelColor: Colors.white,
              //   labelColor: Colors.amber,
              //   tabs: [
              //     Text("Post"),
              //     Text("Post"),
              //     Text("Post"),
              //   ],
              //   controller: tabController,
              //   indicatorColor: Colors.white,
              //   indicatorSize: TabBarIndicatorSize.tab,
              // )

              Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                color: const Color(0xff131618),
                child:  Center(
                  child: DefaultTabController(
                    length: 4,
                    child:TabBar(
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: 3.0, color: Colors.white.withOpacity(0.5)),
                      ),
                      tabs: [
                        const Tab(
                          child: Text("Post",style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                          ),
                        ),
                        const Tab(
                          child: Text("Images",style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                          ),
                        ),
                        const Tab(
                          child: Text("Videos",style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            //height: 40,
                            width: 70,
                            //margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage("assets/images/followbackground.png"),
                                fit: BoxFit.contain
                              )
                            ),
                            //padding: EdgeInsets.all(12),
                            // child: Text("follow",style: TextStyle(
                            //     color: Color(0xffFFFFFF),
                            //     fontFamily: "Roboto",
                            //     fontWeight: FontWeight.w500,
                            //     fontSize: 18
                            // ),
                            // ),
                          ),
                        ),
                      ],
                      onTap: (int index){
                        setState(() {
                          tabs= index;
                        });
                      },
                    ),
                  )
                ),
              ),

              SizedBox(
               height: postImage.length*100,
               child: MasonryGridView.count(
                 physics: const NeverScrollableScrollPhysics(),
                 padding: const EdgeInsets.all(10),
                 crossAxisCount: 2,
                 mainAxisSpacing: 5,
                 crossAxisSpacing: 5,
                 itemCount: postImage.length,
                 itemBuilder: (context, index) {
                   return InkWell(
                     onTap: (){
                       setState(() {
                        // Navigator.push(context, MaterialPageRoute(builder: (builder)=> const PhotoPodtView()));
                       });
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       decoration: const BoxDecoration(
                         color: Colors.transparent,
                         borderRadius: BorderRadius.all(
                             Radius.circular(15)),
                       ),
                       child: ClipRRect(
                         borderRadius: const BorderRadius.all(
                             Radius.circular(2)),
                         child: Image.asset(postImage[index], fit: BoxFit.cover,),
                       ),
                     ),
                   );
                 },
               ),
             )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(true,context)
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StoryView extends StatefulWidget {
  const StoryView({Key? key}) : super(key: key);

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {

  final ScrollController _controllerAxis = ScrollController();
  List<String> storyImage = [
    "assets/images/home/s1.png",
    "assets/images/home/s1.png",
    "assets/images/home/s2.png",
    "assets/images/home/s1.png",
    "assets/images/home/s2.png",
    "assets/images/home/s1.png",
    "assets/images/home/s2.png",
    "assets/images/home/s1.png",
    "assets/images/home/s2.png",
  ];

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
  List<String> filterText = [
    "Drone",
    "Solar Energy",
    "Robot",
    "Future Vehicle",
    "Machine",
    "Drone",
    "Solar Energy",
    "Robot",
    "Future Vehicle",
    "Machine",
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
  bool filterHide = true;
  String? pos;
  futureBuilderChages() async {
    print("future");
    // setState(() {
    //   pos = _controllerAxis.position.toString();
    //   if(_controllerAxis.offset >= 155.0){
    //     filterHide = false;
    //   }else{
    //     filterHide = true;
    //   }
    //   // if(_controllerAxis.offset >= 231.0){
    //   //   filterHide= false;
    //   // }else{
    //   //   filterHide= true;
    //   // }
    // });
  }
  bool _scrollListener(ScrollNotification scrollInfo) {
    setState(() {
      pos = _controllerAxis.position.toString();
      if(_controllerAxis.offset >= 155.0){
        filterHide = false;
      }else{
        filterHide = true;
      }
      // if(_controllerAxis.offset >= 231.0){
      //   filterHide= false;
      // }else{
      //   filterHide= true;
      // }
    });
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,contraints){
      return FutureBuilder(
          future: futureBuilderChages(),
          builder: (context,snapshot) {
            return NotificationListener<ScrollNotification>(
              onNotification: _scrollListener,
              child: Scaffold(
                backgroundColor: Colors.white,
                //               backgroundColor: Colors.red,
                body: SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: _controllerAxis,
                        physics: ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            /// Story View
                            Container(
                              height: MediaQuery.of(context).size.height*0.20,
                              child:
                              ListView.builder(
                                itemCount: storyImage.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return index == 0?
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff322F2F),
                                    ),
                                    height: MediaQuery.of(context).size.height*0.2,
                                    width: MediaQuery.of(context).size.width*0.2,
                                    child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        )
                                    ),
                                  )
                                      :Container(
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0xff322F2F),
                                          image: DecorationImage(
                                            image: AssetImage(storyImage[index]),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                      height: MediaQuery.of(context).size.height*0.2,
                                      width: MediaQuery.of(context).size.width*0.2,
                                      child: const Center(
                                          child: Icon(
                                            Icons.play_circle_outline_sharp,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                      )
                                  );
                                },
                              ),
                            ),
                            /// FilterView
                            filterHide ? /// FilterView
                            Container(
                              color: Colors.transparent,
                              //color: Colors.brown,
                              height: MediaQuery.of(context).size.height*0.12,
                              width: MediaQuery.of(context).size.width,
                              child:
                              ListView.builder(
                                itemCount: filterImage.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return Column(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(left:7,top:10,right:7,bottom: 2),
                                          decoration: BoxDecoration(
                                            //color: Colors.green,
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          height: MediaQuery.of(context).size.height*0.08,
                                          width: MediaQuery.of(context).size.width*0.18,
                                          child: Image.asset(
                                            filterImage[index],
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                      Text(
                                        filterText[index],
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontFamily: "YesevaOne",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: MediaQuery.of(context).size.height*0.12,
                            ),
                            /// Story View
                            Container(
                              height: postImage.length*100,
                              child: MasonryGridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(10),
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                itemCount: postImage.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
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
                                      // Positioned(
                                      //   left: MediaQuery.of(context).size.width * 0.02,
                                      //   bottom: MediaQuery.of(context).size.height * 0.009,
                                      //   child: globalTextTitle(name[index], 15, Global().colorWhite)
                                      //   )
                                    ],
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   height: MediaQuery.of(context).size.height,
                            //   child: MasonryGridView.count(
                            //     physics: NeverScrollableScrollPhysics(),
                            //     padding: const EdgeInsets.all(10),
                            //     crossAxisCount: 2,
                            //     mainAxisSpacing: 5,
                            //     crossAxisSpacing: 5,
                            //     itemCount: postImage.length,
                            //     itemBuilder: (context, index) {
                            //       return Stack(
                            //         children: [
                            //           Container(
                            //             width: MediaQuery
                            //                 .of(context)
                            //                 .size
                            //                 .width,
                            //             decoration: const BoxDecoration(
                            //               color: Colors.transparent,
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(15)),
                            //             ),
                            //             child: ClipRRect(
                            //               borderRadius: const BorderRadius.all(
                            //                   Radius.circular(2)),
                            //               child: Image.asset(postImage[index], fit: BoxFit.cover,),
                            //             ),
                            //           ),
                            //           // Positioned(
                            //           //   left: MediaQuery.of(context).size.width * 0.02,
                            //           //   bottom: MediaQuery.of(context).size.height * 0.009,
                            //           //   child: globalTextTitle(name[index], 15, Global().colorWhite)
                            //           //   )
                            //         ],
                            //       );
                            //     },
                            //   ),
//                            )
                          ],
                        ),
                      ),
                      ///FilterView
                      filterHide ?
                      Container()
                          :Container(
                        color: Colors.white,
                        //color: Colors.brown,
                        height: MediaQuery.of(context).size.height*0.12,
                        child:
                        ListView.builder(
                          itemCount: filterImage.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left:7,top:10,right:7,bottom: 2),
                                    decoration: BoxDecoration(
                                      //color: Colors.green,
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: MediaQuery.of(context).size.height*0.08,
                                    width: MediaQuery.of(context).size.width*0.18,
                                    child: Image.asset(
                                      filterImage[index],
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Text(
                                  filterText[index],
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontFamily: "YesevaOne",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
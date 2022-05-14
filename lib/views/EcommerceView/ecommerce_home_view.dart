import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../global_widget.dart';
import '../photopost_view.dart';
import '../profile_view.dart';

class EcommerceHomeView extends StatefulWidget {
  const EcommerceHomeView({Key? key}) : super(key: key);

  @override
  State<EcommerceHomeView> createState() => _EcommerceHomeViewState();
}

class _EcommerceHomeViewState extends State<EcommerceHomeView> {
  bool searchBarView=false;
  bool filterHide = true;
  String? pos;
  final ScrollController _controllerAxis = ScrollController();

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

  List<String> postImageText = [
    "ROCKBROS Bicycle Hanging Wall Mount Bike Repair Stand MTB Road Bike Rack Indoor Fixed Multi-Angle Quick Release Repair Station",
    "SameBIKE JG20 Electric Bike 10 ah 350 bike electric bike road bike",
    "ROCKBROS Bicycle Hanging Wall Mount Bike Repair Stand MTB Road Bike Rack Indoor Fixed Multi-Angle Quick Release Repair Station",
    "ROCKBROS Bicycle Hanging Wall Mount Bike Repair Stand MTB Road Bike Rack Indoor Fixed Multi-Angle Quick Release Repair Station",
    "DC 36v/48v 350w Brusless dc Motor Road Bike Repair Wires DC power.",
    "ROCKBROS Bicycle Hanging Wall Mount Bike Repair Stand MTB Road Bike Rack Indoor Fixed Multi-Angle Quick Release Repair Station",
    "SameBIKE JG20 Electric Bike 10 ah 350 bike electric bike road bike",
    "DC 36v/48v 350w Brusless dc Motor Road Bike Repair Wires DC power.",
    "ROCKBROS Bicycle Hanging Wall Mount Bike Repair Stand MTB Road Bike Rack Indoor Fixed Multi-Angle Quick Release Repair Station",
    "DC 36v/48v 350w Brusless dc Motor Road Bike Repair Wires DC power.",
    "SameBIKE JG20 Electric Bike 10 ah 350 bike electric bike road bike",
    "DC 36v/48v 350w Brusless dc Motor Road Bike Repair Wires DC power.",
    "ROCKBROS Bicycle Hanging Wall Mount Bike Repair Stand MTB Road Bike Rack Indoor Fixed Multi-Angle Quick Release Repair Station",
    "SameBIKE JG20 Electric Bike 10 ah 350 bike electric bike road bike",
    "DC 36v/48v 350w Brusless dc Motor Road Bike Repair Wires DC power.",
    "ROCKBROS Bicycle Hanging Wall Mount Bike Repair Stand MTB Road Bike Rack Indoor Fixed Multi-Angle Quick Release Repair Station",
  ];

    bool _scrollListener(ScrollNotification scrollInfo) {
    setState(() {
      pos = _controllerAxis.position.toString();
      if(_controllerAxis.offset >= 155.0){
        filterHide = false;
      }else{
        filterHide = true;
      }
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2D2D37),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: _scrollListener,
          child: Column(
            children: [
              Row(
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
                                child: Text(
                                  "Mr Idiot",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20  ,
                                      fontFamily: "YesevaOne",
                                      fontWeight: FontWeight.w900
                                  ),
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
              Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          controller: _controllerAxis,
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              ///slider
                              CarouselSlider.builder(
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      child: Image.asset("assets/images/postimages/banner.png" ,fit:BoxFit.fill),
                                    ),
                                options: CarouselOptions(
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                ),
                              ),

                              filterHide ? /// FilterView
                              Container(
                                color: const Color(0xffEFF0E1),
                                height: MediaQuery.of(context).size.height*0.12,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(bottom: 2),
                                child:
                                Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: filterImage.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context,index){
                                          return Column(
                                            children: [
                                              Container(
                                                  margin: const EdgeInsets.only(left:7,top:10,right:7,bottom: 2),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(0xffA1A7AC),
                                                        width: 2
                                                    ),
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                  height: MediaQuery.of(context).size.height*0.07,
                                                  width: MediaQuery.of(context).size.width*0.17,
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                      filterImage[index],
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius: BorderRadius.circular(100),
                                                  )
                                              ),

                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: 'Special Deals',
                                              style: TextStyle(
                                                color: Color(0xffFF0C0C),
                                              )
                                          ),
                                          TextSpan(text: ' 1 day left only/-'),
                                        ],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  : Container(
                                height: MediaQuery.of(context).size.height*0.12,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left:10,top:10),
                                child: Text("Products For You - ",
                                 style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                   fontSize: 17
                                  ),
                                ),
                              ),

                              /// Story View
                              Container(
                                color: const Color(0xfff2f2f2),
                                height: postImage.length * 140,
                                child: MasonryGridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.all(10),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  itemCount: postImage.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        setState(() {
                                          //Navigator.push(context, MaterialPageRoute(builder: (builder)=> PhotoPodtView()));
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(1),
                                        color: Colors.white,
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: const BoxDecoration(
                                                    //color: Colors.yellow,
                                                    color: Colors.transparent,
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(0)),
                                                  ),
                                                  child: ClipRRect(
                                                    child: Image.asset(postImage[index], fit: BoxFit.cover,),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10,left:10,right:10,bottom: 5),
                                                  child: Text(
                                                      postImageText[index],
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "Lato"
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 5,left:10,right:10,bottom: 10),
                                                  child: Text(
                                                    "Rs 67158.40",
                                                    style: TextStyle(
                                                      color: Color(0xffe40d43),
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Positioned(
                                              top: 10,right: 0,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xffe40d43),
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(10),
                                                      topLeft: Radius.circular(10)
                                                    )
                                                  ),
                                                  padding: const EdgeInsets.all(5),
                                                  child: const Text(
                                                    "15%off",
                                                    style: TextStyle(
                                                      color: Colors.white
                                                    ),
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]
                          ),
                        ),
                        ///FilterView
                        filterHide ?
                        Container()
                        : Container(
                          color: const Color(0xffEFF0E1),
                          height: MediaQuery.of(context).size.height*0.12,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(bottom: 2),
                          child:
                          Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: filterImage.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index){
                                    return Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:7,top:10,right:7,bottom: 2),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: const Color(0xffA1A7AC),
                                                  width: 2
                                              ),
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            height: MediaQuery.of(context).size.height*0.07,
                                            width: MediaQuery.of(context).size.width*0.17,
                                            child: ClipRRect(
                                              child: Image.asset(
                                                filterImage[index],
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.circular(100),
                                            )
                                        ),

                                      ],
                                    );
                                  },
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: 'Special Deals',
                                          style: TextStyle(
                                            color: Color(0xffFF0C0C),
                                          )
                                      ),
                                      TextSpan(text: ' 1 day left only/-'),
                                    ],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar:globalECommerceBottomBar(true,context),// bottomBar(true,context)
    );
  }
}

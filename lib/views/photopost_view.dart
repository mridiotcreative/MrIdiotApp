import 'package:better_video_player/better_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mr_idiot_app/Models/view_post_models.dart';
import 'global_widget.dart';
import 'others/better_video_player_custom_control.dart';
class PhotoPodtView extends StatefulWidget {
  Result result;
  PhotoPodtView(this.result,);

  @override
  State<PhotoPodtView> createState() => _PhotoPodtViewState();
}

class _PhotoPodtViewState extends State<PhotoPodtView> {
  late final BetterVideoPlayerController controller;
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = BetterVideoPlayerController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                    height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        widget.result.videoCategoryType == "1" ?
                      Center(
                        child: AspectRatio(
                          aspectRatio: 16.0 / 9.0,
                          child: BetterVideoPlayer(
                            controller: controller,
                            configuration: BetterVideoPlayerConfiguration(
                              placeholder: Image.network(
                                widget.result.thumbnailImage ?? "https://static.thenounproject.com/png/504708-200.png",
                                fit: BoxFit.contain,
                              ),
                              controls: CustomControls(isFullScreen: false),
                              fullScreenControls: CustomControls(isFullScreen: true),
                            ),
                            dataSource: BetterVideoPlayerDataSource(
                              BetterVideoPlayerDataSourceType.network,
                              widget.result.uploadUrl!,
                            ),
                          ),
                        ),
                      )
                        :SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.4,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                            child:
                            Image.network(
                              widget.result.thumbnailImage ?? "https://static.thenounproject.com/png/504708-200.png",
                              fit: BoxFit.contain,
                              errorBuilder: (ctx, o, n) {
                                return Icon(Icons.error,color: Colors.white,);
                              },
                            ),
                          ),
                        ),
                        widget.result.videoCategoryType == "1" ?
                        Container()
                        :Container(),
                        Positioned(
                            bottom: 5,
                            right: 5,
                            child: IconButton(
                              onPressed: (){
                              setState(() {
                                debugPrint("View Image");
                              });
                            },
                            icon: const ImageIcon(
                              AssetImage(
                                  "assets/images/postimages/reviewposticon.png",
                              ),
                              //color: Colors.white,
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10,left: 10),
                        height:60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.white,
                            width: 2
                          )
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/images/person.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Ridhwan Nordin",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFC909),
                                      decoration: TextDecoration.underline,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  color: const Color(0xff184AFB),
                                  child: const Text(
                                      "Learn More",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Analytics Consultant at Fractal || Book your car.in now free at your home",
                              style: TextStyle(
                                fontSize:14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Color(0xffFFC909),
                            size: 40,
                          )
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5,bottom: 5),
                    color: Colors.white,
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(
                          Icons.thumb_up_alt_outlined,
                        color: Colors.white,)),
                        const Text("Like",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),)
                      ],
                    ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.comment,
                                color: Colors.white,
                              )
                          ),
                          const Text("Comment",style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.forward,
                              color: Colors.white,
                            )
                          ),
                          const Text("Share",style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              )
                          ),
                          const Text("Send",style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),)
                        ],
                      ),
                      Stack(
                        children: [
                          Image.asset(
                              'assets/images/postimages/follow_Rectangle_shape.png',
                            height: 50,
                            width: 70,
                          ),
                          const Positioned(
                            left: 10,
                            right: 0,
                            top: 15,
                            bottom: 0,
                            child: Text(
                              "follow",
                              style: TextStyle(
                                color: Color(0xffFFC909),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5,bottom: 5),
                    color: Colors.white,
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                  ),
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
                        return InkWell(
                          onTap: (){
                            setState(() {
                              //Navigator.push(context, MaterialPageRoute(builder: (builder)=> PhotoPodtView(Result result,)));
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
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  shadowColor: Colors.black,
                  backgroundColor: Colors.black54,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon:const Icon(
                        Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    IconButton(onPressed: (){},
                        icon:Icon(Icons.more_vert,color: Colors.white,))
                  ],
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(true,context)
    );
  }
}

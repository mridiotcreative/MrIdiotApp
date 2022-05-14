import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/global_widget.dart';
import 'package:video_player/video_player.dart';
import '../Models/yt_data.dart';

class ReelView extends StatefulWidget {
  const ReelView({Key? key}) : super(key: key);

  @override
  State<ReelView> createState() => _ReelViewState();
}

class _ReelViewState extends State<ReelView> {
  PageController _pagecontroller =PageController(initialPage: 0);
  VideoPlayerController? _controller;

  // VideoPlayerController? videoPlayerController = VideoPlayerController.network(
  //     'https://player.vimeo.com/external/552421426.hd.mp4?s=a4e3b5d1768bd29f37298743162e1b15c93856e4&profile_id=172&oauth2_token_id=57447761');
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pagecontroller,
        scrollDirection: Axis.vertical,
        onPageChanged: (value){
          print(value.toString());
          if(value ==2){
            setState(() {
              _controller!.play();
              _controller!.setLooping(true);
            });
          }else if(value != 2){
            setState(() {
              _controller!.pause();
              _controller!.setLooping(false);
            });

          }
        },
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  color: Colors.redAccent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      child: Image.asset("assets/images/idiot.png",
                        fit: BoxFit.fill,)
                  ),
                ),
                AppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  actions: const [
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,right: 0,
                    child:Container(
                      padding: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.thumb_up,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "2 M",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.thumb_down,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "Dislike",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.message,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "12k",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const ImageIcon(
                            AssetImage(
                              "assets/images/forward_icon.png",
                            ),
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "Share",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "The Glow up is real #seld care",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top:10),
                                decoration: BoxDecoration(
                                    color:Colors.black,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: ClipRRect(
                                  child: Image.asset("assets/images/idiot.png",
                                    height: 40,width: 50,),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  " Samantha Day ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Subscribe".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                height: 30,
                                  width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white
                                  )
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                      "assets/images/music_bar.gif",
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  color: Colors.redAccent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      child: Image.asset("assets/images/music_bar.gif",
                        fit: BoxFit.fill,)
                  ),
                ),
                AppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  actions: const [
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,right: 0,
                    child:Container(
                      padding: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.thumb_up,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "2 M",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.thumb_down,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "Dislike",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.message,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "12k",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const ImageIcon(
                            AssetImage(
                              "assets/images/forward_icon.png",
                            ),
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "Share",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "The Glow up is real #seld care",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:Colors.black,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: ClipRRect(
                                  child: Image.asset("assets/images/idiot.png",
                                    height: 50,width: 50,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  " Samantha Day ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Subscribe".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.white
                                      )
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/images/music_bar.gif",
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  color: Colors.redAccent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:  Center(
                    child: _controller!.value.isInitialized
                        ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(
                        _controller!,
                      ),
                    )
                        : Container(),
                  ),
                ),
                AppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  actions: const [
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,right: 0,
                    child:Container(
                      padding: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.thumb_up,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "2 M",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.thumb_down,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "Dislike",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.message,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "12k",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const ImageIcon(
                            AssetImage(
                              "assets/images/forward_icon.png",
                            ),
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              "Share",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "The Glow up is real #seld care",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:Colors.black,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: ClipRRect(
                                  child: Image.asset("assets/images/idiot.png",
                                    height: 50,width: 50,),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  " Samantha Day ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Subscribe".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.white
                                      )
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/images/music_bar.gif",
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(false,context),
    );
  }
}

// class ShortsScreen extends StatefulWidget {
//   static const String id = 'ShortsScreen';
//   @override
//   _ShortsScreenState createState() => _ShortsScreenState();
// }
//
// YTData ytData = YTData();
//
// class _ShortsScreenState extends State<ShortsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView.builder(
//             itemCount: ytData.shortsList.length,
//             itemBuilder: (context, index) {
//               return ShortsList(
//                 name: ytData.shortsList.values.elementAt(index).elementAt(0),
//                 profilePic:
//                 ytData.shortsList.values.elementAt(index).elementAt(1),
//                 vid: ytData.shortsList.values.elementAt(index).elementAt(2),
//                 caption: ytData.shortsList.values.elementAt(index).elementAt(3),
//                 likes: ytData.shortsList.values.elementAt(index).elementAt(4),
//                 comments:
//                 ytData.shortsList.values.elementAt(index).elementAt(5),
//               );
//             }),
//       ),
//     );
//   }
// }
//
// class ShortsList extends StatefulWidget {
//   final String name;
//   final String profilePic;
//   final String vid;
//   final String caption;
//   final String likes;
//   final String comments;
//   ShortsList(
//       {required this.name,
//         required this.caption,
//         required this.comments,
//         required this.likes,
//         required this.vid,
//         required this.profilePic});
//
//   @override
//   _ShortsListState createState() => _ShortsListState();
// }
//
// class _ShortsListState extends State<ShortsList> {
//   bool isLike = false;
//   bool isDislike = false;
//
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//
//     return Stack(
//       children: [
//         Container(
//           width: w,
//           height: h,
//           child: Image.asset(
//             widget.vid,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15, bottom: 8),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.arrow_back_rounded,
//                       color: Colors.white,
//                       size: 32,
//                     ),
//                   ),
//                   const Icon(
//                     CupertinoIcons.ellipsis_vertical,
//                     color: Colors.white,
//                     size: 32,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: h * 0.275,
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isLike = !isLike;
//                       });
//                     },
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.thumb_up,
//                             color: isLike ? Colors.blue : Colors.white,
//                             size: 30,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             widget.likes,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 28,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isDislike = !isDislike;
//                       });
//                     },
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 15.0),
//                             child: Icon(
//                               Icons.thumb_down,
//                               color: isDislike ? Colors.blue : Colors.white,
//                               size: 30,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Text(
//                             'Dislike',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 28,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       child: Column(
//                         children: [
//                           const Icon(
//                             Icons.message_rounded,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             widget.comments,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 28,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       child: Column(
//                         children: const [
//                           Icon(
//                             CupertinoIcons.arrowshape_turn_up_right_fill,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Share',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: w * 0.6,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.caption,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 15,
//                               backgroundColor: Colors.white,
//                               child: CircleAvatar(
//                                 radius: 12.5,
//                                 backgroundImage: AssetImage(widget.profilePic),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             Text(
//                               widget.name,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 36,
//                     width: 36,
//                     color: Colors.white,
//                     child: Stack(
//                       children: [
//                         Center(
//                           child: Container(
//                             height: 32,
//                             width: 32,
//                             child: Image.asset(
//                               'assets/images/music_bar.gif',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
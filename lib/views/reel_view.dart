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
      bottomNavigationBar: bottomBar(true,context),
    );
  }
}
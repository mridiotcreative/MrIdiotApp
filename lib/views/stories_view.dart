import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_idiot_app/viewModels/ReviewImageViewModel.dart';
import 'package:mr_idiot_app/views/photopost_view.dart';
import 'package:mr_idiot_app/views/reel_view.dart';
import 'package:mr_idiot_app/views/review_image_view.dart';
import 'package:path_provider/path_provider.dart';
import '../Models/view_post_models.dart';

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
  bool filterHide = true,isLoading = false;
  String? pos;
  XFile? imageFile,videoFile;
  ImagePicker picker = ImagePicker();
  ViewPostsModel? viewPostsModel;
  String? _tempDir;
  String? temp2,temp13;
  futureBuilderChages() async {}
  PostData() async {
    setState(() {
      getTemporaryDirectory().then((d) => _tempDir = d.path);
      isLoading = true;
    });
    print("future");
    viewPostsModel = await ReviewImageViewModel().fetchPost();
    // temp2 = await thumnail(viewPostsModel!.result![3].uploadUrl!);
    setState(() {
      isLoading = false;
    });
  }
  bool _scrollListener(ScrollNotification scrollInfo) {
    setState(() {
      pos = _controllerAxis.position.toString();
      if(_controllerAxis.offset >= 155.0){
        filterHide = false;
      }
      else{
        filterHide = true;
      }
    });
    return true;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostData();
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
                backgroundColor: Colors.white ,
                body: SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: _controllerAxis,
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            ///grey border
                            Container(
                              margin: const EdgeInsets.only(top:5),
                              height: 5,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey,
                            ),
                            /// Story View
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.20,
                              child:
                              ListView.builder(
                                itemCount: storyImage.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return index == 0?
                                  InkWell(
                                    onTap: (){
                                      popUP(context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2.5
                                        ),
                                        color: Colors.grey
                                      ),
                                      height: MediaQuery.of(context).size.height*0.2,
                                      width: MediaQuery.of(context).size.width*0.22,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          //Container(),
                                          Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 40,
                                          ),
                                          Text(
                                            "CREATE STORY",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  )
                                  :InkWell(
                                      onTap: (){
                                        setState(() {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReelView())).then((value) {
                                            setState(() {
                                              PostData();
                                            });
                                          });
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 10,bottom: 10,left: 3,right: 3),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 2
                                          ),
                                          color: const Color(0xff322F2F),
                                          image: DecorationImage(
                                            image: AssetImage(storyImage[index]),
                                            fit: BoxFit.fill,
                                          )
                                        ),
                                        height: MediaQuery.of(context).size.height*0.2,
                                        width: MediaQuery.of(context).size.width*0.22,
                                        child: const Center(
                                          child: Icon(
                                            Icons.play_circle_outline_sharp,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        )
                                    ),
                                  );
                                },
                              ),
                            ),
                            ///grey border
                            Container(
                              height: 5,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey,
                            ),
                            /// FilterView
                            filterHide ? /// FilterView
                            Container(
                              color: Colors.transparent,
                              height: MediaQuery.of(context).size.height*0.12,
                              width: MediaQuery.of(context).size.width,
                              child:
                              ListView.builder(
                                itemCount: filterImage.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          // margin: const EdgeInsets.only(left:7,top:10,right:7,bottom: 2),
                                          margin: const EdgeInsets.only(left: 5,right:5,top:10,bottom: 5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 2
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          // height: MediaQuery.of(context).size.height*0.08,
                                          // width: MediaQuery.of(context).size.width*0.17,
                                          height:50,
                                          width:50,
                                          child: ClipRRect(
                                            child: Image.asset(
                                              filterImage[index],
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          )
                                      ),
                                      Text(
                                        filterText[index],
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: GoogleFonts.suezOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black
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
                            ///grey border
                            Container(
                              height: 5,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey,
                            ),
                            /// Story View
                            SizedBox(
                              height: (postImage.length * 250),// + (MediaQuery.of(context).size.height*0.12) + (MediaQuery.of(context).size.height*0.20),
                              child: isLoading == true ?
                              const Center(
                                  child: CircularProgressIndicator(color: Colors.white,),
                              )
                              : (viewPostsModel != null && viewPostsModel!.result!.length >0)
                              ?MasonryGridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(10),
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                itemCount: viewPostsModel!.result!.length,
                                itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        setState(() {
                                          Navigator.push(context, MaterialPageRoute(builder: (builder)=> PhotoPodtView(viewPostsModel!.result![index]))).then((value) {
                                            setState(() {
                                              PostData();
                                            });
                                          });
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Image.network(
                                                viewPostsModel!.result![index].thumbnailImage ?? viewPostsModel!.result![index].uploadUrl ?? "https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg",
                                                fit: BoxFit.cover,
                                                errorBuilder: (ctx, o, n) {
                                                  return Icon(Icons.error,color: Colors.white,);
                                                },
                                              )
                                                    // : Container()
                                            ),
                                          ),
                                      viewPostsModel!.result![index].videoCategoryType=="1" && viewPostsModel!.result![index].thumbnailImage != null?
                                        const Positioned(
                                            left:0,
                                              right:0,
                                              top:0,
                                              bottom:0,
                                              child: Icon(Icons.play_circle_filled_outlined,size: 50,color: Colors.white,)
                                          )
                                          :Container()
                                        ],
                                      ),
                                    );
                                },
                              )
                              : const Text("No Data Found",
                              style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                      ///FilterView
                      filterHide ?
                      Container()
                        :Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height*0.12,
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
                                          color: Colors.grey,
                                          width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      height:50,
                                      width:50,
                                      // height: MediaQuery.of(context).size.height*0.08,
                                      // width: MediaQuery.of(context).size.width*0.17,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          filterImage[index],
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(100),
                                      )
                                  ),
                                  Text(
                                    filterText[index],
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: GoogleFonts.suezOne(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      color: Colors.black
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

  void popUP(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return SizedBox(
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(
          //           left: 25,
          //           right: 5,
          //           top: 10,
          //           bottom: 15),
          //       child: IconButton(
          //         iconSize: 32,
          //         onPressed: () {
          //           ///upload image video from camera
          //         },
          //         icon: const Icon(Icons.camera_alt_outlined),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(
          //           right: 5, top: 10, bottom: 15),
          //       child: IconButton(
          //         iconSize: 32,
          //         onPressed: () {
          //           ///upload image video from gellary
          //           selectedVideoImage();
          //         },
          //         icon: const Icon(Icons.image),
          //       ),
          //     ),
          //   ],
          // ),
          child: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  onTap: (){
                    selectedImage(ImageSource.camera);
                  },
                  title: const Text(
                    "Upload Photo from Camera",style: TextStyle(
                    fontWeight: FontWeight.bold
                    ),
                    maxLines: 1,
                  ),
                  leading: const Icon(Icons.camera,color: Colors.black,),
                ),
                ListTile(
                  onTap: (){
                    selectedImage(ImageSource.gallery);
                  },
                  title: const Text(
                    "Upload Photo From Gallery",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    maxLines: 1,
                  ),
                  leading: const Icon(Icons.photo_library,color: Colors.black,),
                ),
                ListTile(
                  onTap: (){
                    selectedVideo(ImageSource.camera);
                  },
                  title: const Text(
                    "Upload Video From Camera",style: TextStyle(
                    fontWeight: FontWeight.bold
                    ),
                    maxLines: 1,
                  ),
                  leading: const Icon(Icons.videocam_sharp,color: Colors.black,),
                ),
                ListTile(
                  onTap: (){
                    selectedVideo(ImageSource.gallery);
                  },
                  title: const Text("Upload Video From Gallery",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  leading: const Icon(Icons.video_collection_outlined,color: Colors.black,),
                ),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  title: const Text("Cancel",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  leading: const Icon(Icons.cancel_outlined,color: Colors.black,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  ///Upload Image
  selectedImage(ImageSource imageSource) async {
    try{
      imageFile=null;
      var pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
          imageFile = pickedFile;
          Navigator.push(context, MaterialPageRoute(builder: (builder) => ReviewImageView(pickedFile,true))).then((v) {
                if(v == true){
                  debugPrint("success uploaded");
                }else{
                  debugPrint("facing issue with uploading");
                }
                Navigator.pop(context);
                PostData();
              });
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  ///Upload Video
  selectedVideo(ImageSource imageSource) async {
    try{
      videoFile=null;
      var pickedFile = await picker.pickVideo(source: imageSource);
      if (pickedFile != null) {
        videoFile = pickedFile;
        Navigator.push(context, MaterialPageRoute(builder: (builder) => ReviewImageView(pickedFile,false))).then((v) {
          if(v == true){
            debugPrint("success uploaded");
          }else{
            debugPrint("facing issue with uploading");
          }
          Navigator.pop(context);
          PostData();
        });
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  // Future<String?> thumnail(String url) async {
  //   try{
  //     final fileName = await VideoThumbnail.thumbnailFile(
  //       video: "https://mridiot.in/upload/user/video/10001/user_video_cy7yawewn0_ForBiggerBlazes.mp4",
  //       thumbnailPath: (await getTemporaryDirectory()).path,
  //       imageFormat: ImageFormat.JPEG,
  //       maxWidth: 500,
  //       quality: 100,
  //     );
  //     return fileName.toString();
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  //
  // }
}
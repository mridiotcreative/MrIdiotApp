import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../viewModels/ReviewImageViewModel.dart';
import 'home_view.dart';

class PreUploadReviewView extends StatefulWidget {
  XFile? image;
  bool? imageFile;
  String? videopath;
  PreUploadReviewView(this.image,this.imageFile,this.videopath,{Key? key}) : super(key: key);

  @override
  State<PreUploadReviewView> createState() => _PreUploadReviewViewState();
}

class _PreUploadReviewViewState extends State<PreUploadReviewView> {
  final TextEditingController _titleController = TextEditingController();
  bool isLoading= true,isUploading= false;
  ImagePicker picker = ImagePicker();
  XFile? thumNailViewFile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.imageFile == false){
      thumbnailProcess();
    }
  }
  thumbnailProcess() async {
    setState(() {
      isLoading = true;
    });
    try {
      String? temp = await thumnail(widget.videopath!);
      setState(() {
        thumNailViewFile = XFile(temp!);
      });
      if(thumNailViewFile!=null) {
        setState(() {
          isLoading = false;
        });
      }
    }catch(e){
      print(e.toString());
    }

  }

  Future<String?> thumnail(String url) async {
    try{
      File tempVideo;
      tempVideo = File(url);
      final fileName = await VideoThumbnail.thumbnailFile(
        video: tempVideo.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );

      return fileName;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  void popUP(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return SizedBox(
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
  ///select thmbnail image Image
  selectedImage(ImageSource imageSource) async {
    try{
      var pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        setState(() {
          thumNailViewFile = null;
          thumNailViewFile = pickedFile;
          isLoading = false;
        });
        Navigator.pop(context);
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,color: Colors.black,)),
            backgroundColor: Colors.white,
            title: const Text(
              "Add Details",
              style: TextStyle(
                color: Colors.black,//Colors.white
              ),),
            centerTitle: false,
          ),
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      widget.imageFile == true ?
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Image.file(
                          File(widget.image!.path),
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, o, n) {
                            return const Icon(Icons.error);
                          },
                        ),
                      )
                      :Center(
                          child: isLoading ? const Text("loading...") :Container(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: Image.file(
                                  File(thumNailViewFile!.path),
                                  fit: BoxFit.cover,)
                            ),
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                       child: Wrap(
                         children: [
                           const Text(
                             "Title",
                             style: TextStyle(
                               color: Colors.blue,
                             ),
                             maxLines: 1,
                           ),
                           TextFormField(
                             controller: _titleController,
                             minLines: 1,
                             maxLines: 5,
                             keyboardType: TextInputType.multiline,
                             maxLength: 100,
                             decoration: const InputDecoration(
                               hintText: 'Enter Title',
                               hintStyle: TextStyle(
                                   color: Colors.grey
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top:5,bottom: 10),
                             child: Row(
                               children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 13),
                                  child: Image.asset("assets/images/icons/1st.png",height: 20,width: 20,),
                                ),
                                const Expanded(
                                    child: Text(
                                      "Add Description",
                                      style: TextStyle(
                                        fontSize: 17
                                      ),
                                      maxLines: 1,
                                    )
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded,size: 20,)
                               ],
                             ),
                           ),
                           widget.imageFile == true ?
                           Container()
                           :Padding(
                             padding: const EdgeInsets.only(top:10,bottom: 10),
                             child: InkWell(
                               onTap: (){
                                 /// edit thumbnail image for video.
                                 popUP(context);
                               },
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(right: 13),
                                     child: Image.asset("assets/images/icons/2nd.png",height: 20,width: 20,),
                                   ),
                                   const Expanded(
                                       child: Text(
                                         "Edit Thumbnail",
                                         style: TextStyle(
                                             fontSize: 17
                                         ),
                                         maxLines: 1,
                                       )
                                   ),
                                   const Icon(Icons.arrow_forward_ios_rounded,size: 20,)
                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top:10,bottom: 10),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 13),
                                   child: Image.asset("assets/images/icons/3rd.png",height: 20,width: 20,),
                                 ),
                                 const Expanded(
                                     child: Text(
                                       "Monetization",
                                       style: TextStyle(
                                           fontSize: 17
                                       ),
                                       maxLines: 1,
                                     )
                                 ),
                                 const Icon(Icons.arrow_forward_ios_rounded,size: 20,)
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top:10,bottom: 10),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 13),
                                   child: Image.asset("assets/images/icons/4th.png",height: 20,width: 20,),
                                 ),
                                 const Expanded(
                                     child: Text(
                                       "Public",
                                       style: TextStyle(
                                           fontSize: 17
                                       ),
                                       maxLines: 1,
                                     )
                                 ),
                                 const Icon(Icons.arrow_forward_ios_rounded,size: 20,)
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top:10,bottom: 10),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 13),
                                   child: Image.asset("assets/images/icons/5th.png",height: 20,width: 20,),
                                 ),
                                 const Expanded(
                                     child: Text(
                                       "Add Tags",
                                       style: TextStyle(
                                           fontSize: 17
                                       ),
                                       maxLines: 1,
                                     )
                                 ),
                                 const Icon(Icons.arrow_forward_ios_rounded,size: 20,)
                               ],
                             ),
                           ),
                           const SizedBox(height: 100,)
                         ],
                       ),
                     )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                  right: 10,
                  child: InkWell(
                    onTap: (){
                        setState(() {
                          isUploading = true;
                        });
                        if(widget.imageFile == true){
                          ///image upload
                          uploadingImage().then((value){
                            Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context)=>HomeView()), (route) => false);
                            setState(() {
                              isUploading = false;
                            });
                          });
                        }else{
                          ///video upload
                          uploadingVideo().then((value){
                            Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context)=>HomeView()), (route) => false);
                            setState(() {
                              isUploading = false;
                            });
                          });
                        }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffFFC909),
                      ),
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
                      child: const Text(
                        "Upload",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                  ),
                )
              )
            ],
          )
        ),
        isUploading ?
        Positioned(
            child: Container(
                color: Colors.black54,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator())
            )
        )
        :Container()
      ],
    );
  }

  ///image upload logic
  Future<bool> uploadingImage() async {
    bool valueTemp = await ReviewImageViewModel().uploadImage(widget.image!,widget.image!,true);
    return valueTemp;
  }

  Future<bool> uploadingVideo() async {
    bool valueTemp = await ReviewImageViewModel().uploadImage(XFile(widget.videopath!),thumNailViewFile,false);
    return valueTemp;
  }

}

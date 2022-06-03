import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../viewModels/ReviewImageViewModel.dart';
import 'home_view.dart';

class ThumbNailView extends StatefulWidget {
  String? filePath;
  ThumbNailView(this.filePath);

  @override
  State<ThumbNailView> createState() => _ThumbNailViewState();
}

class _ThumbNailViewState extends State<ThumbNailView> {
  XFile? thumNailViewFile;
  bool isLoading= true;
  ImagePicker picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thumbnailProcess();
  }
  thumbnailProcess() async {
    setState(() {
      isLoading = true;
    });
    try {
      String? temp = await thumnail(widget.filePath!);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: const Color(0xff2D2D37),
        title: const Text("Thumbnail Image View...",
          style: TextStyle(
              color: Colors.white
          ),),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              ///Uploading
              setState(() {
                // isLoading
              });
              uploading().then((value) {
                //Navigator.pop(context,value);
                Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context)=>HomeView()), (route) => false);
             });
             // Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context)=>HomeView()), (route) => false);
            },
            child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Center(
                    child: Text(
                      "Upload",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    )
                )
            ),
          )
        ],
      ),
      body: Center(
        child: isLoading ? Text("loading...") :Container(
          child:  Image.file(File(thumNailViewFile!.path),fit: BoxFit.cover,),
        ),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: (){
          popUP(context);
        },
        child: Container(
        child: Icon(Icons.edit),
        )
    ),
    );
  }

  Future<String?> thumnail(String url) async {
    try{
      File tempVideo;
      // if(Platform.isAndroid){
      //   tempVideo = File(url);
      // }else{
      //   final byteData = await rootBundle.load(url);
      //   Directory tempDir = await getTemporaryDirectory();
      //   tempVideo = File("${tempDir}/tempimage.mp4")..createSync(recursive: true)..writeAsBytesSync(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      // }
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
  Future<bool> uploading() async {
    bool valueTemp = await ReviewImageViewModel().uploadImage(XFile(widget.filePath!),thumNailViewFile,false);
    return valueTemp;
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

  ///Upload Image
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
        // Navigator.push(context, MaterialPageRoute(builder: (builder) => ReviewImageView(pickedFile,true))).then((v) {
        //   if(v == true){
        //     debugPrint("success uploaded");
        //   }else{
        //     debugPrint("facing issue with uploading");
        //   }
        //
        // });
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

}

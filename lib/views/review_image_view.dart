import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_idiot_app/viewModels/ReviewImageViewModel.dart';
import 'package:mr_idiot_app/views/thumnail_view.dart';
import 'package:video_player/video_player.dart';

class ReviewImageView extends StatefulWidget {
  XFile? image;
  bool? imageFile;
  ReviewImageView(this.image,this.imageFile,{Key? key}) : super(key: key);

  @override
  State<ReviewImageView> createState() => _ReviewImageViewState();
}

class _ReviewImageViewState extends State<ReviewImageView> {
  VideoPlayerController? _controller;
  bool isPlaying = false,isUploading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.imageFile == false){
      _controller = VideoPlayerController.file(File(widget.image!.path))..initialize().then((value){
        _controller!.addListener(checkVideo);
        setState(() {});
      });
    }
  }
  checkVideo(){
    if(_controller!.value.position == _controller!.value.duration) {
      debugPrint('video Ended');
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    if(widget.imageFile == false){
      _controller!.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,)),
            backgroundColor: const Color(0xff2D2D37),
            title: Text(widget.imageFile == true ? "Uploading Image..." : "Uploading Video...",
            style: const TextStyle(
              color: Colors.white
            ),),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: (){
                  ///Uploading
                  setState(() {
                    // isLoading
                    isUploading = true;
                  });
                  widget.imageFile == true ?
                  uploading().then((value) {
                    Navigator.pop(context,value);
                    isUploading = false;
                  })
                  :Navigator.push(context, MaterialPageRoute(builder: (builder) => ThumbNailView(widget.image!.path))).then((value){
                    setState(() {
                      // isLoading
                      isUploading = false;
                    });
                  });
                },
                child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                        child: Text(
                          widget.imageFile == true ? "Upload" : "Next",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        )
                    )
                ),
              )
            ],
          ),
          body: widget.imageFile == true ?
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.file(
              File(widget.image!.path),
              fit: BoxFit.cover,
              errorBuilder: (ctx, o, n) {
                return const Icon(Icons.error);
              },
            ),
          )
          :Center(
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(
                _controller!,
              ),
            ),
          ),
          floatingActionButton:
          widget.imageFile == false ?
          FloatingActionButton(
            onPressed: (){
              if(isPlaying == true){
                setState(() {
                  _controller!.pause();
                  isPlaying = false;
                });
              }else{
                setState(() {
                  _controller!.play();
                  isPlaying = true;
                });
              }
            },
            backgroundColor: Colors.white,
            child: Icon(isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.black,),
          ):Container(),
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
  Future<bool> uploading() async {
    bool valueTemp = await ReviewImageViewModel().uploadImage(widget.image!,widget.image!,true);
    return valueTemp;
  }
}

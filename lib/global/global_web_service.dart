import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_idiot_app/Models/view_post_models.dart';

const String baseUrl = "https://mridiot.in/";
const String uploadVideoImages = "${baseUrl}upload_video_api";
const String allVideosImages = "${baseUrl}all_video";
const String likeCommentPostService = "${baseUrl}like_comment_video";

class WebService{

  ///uploading image and video files.

  Future<bool> uploadImageViewApi(bool uploadingImage,{XFile? imageFile,XFile? thumbNailView}) async {

    File tempFile = File(imageFile!.path);
    File thumbNailFile = File(thumbNailView!.path);
    var request =  http.MultipartRequest('POST', Uri.parse(uploadVideoImages));
    request.fields['user_id'] = "10001";
    request.fields['video_category_type'] = uploadingImage ? '2' : '1';
    request.fields['description'] = "test123";
    request.files.add(await http.MultipartFile.fromPath('upload_video', tempFile.path));
    request.files.add(await http.MultipartFile.fromPath('thumbnail_image', thumbNailFile.path));
    debugPrint("calling api :$uploadVideoImages");
    var response = await request.send();
    if(response.statusCode == 200){
      final res = await http.Response.fromStream(response);
      print(res.body);
      Response resData = res;
      var data = jsonDecode(utf8.decode(resData.bodyBytes)) as Map;
      print(data.toString());
      if(data['ResponseMessage'] == "Video Uploaded Successfully."){
        ToastCustomMessage("Uploaded Successfully",true);
        return true;
      }else {
        ToastCustomMessage("Something Wrong Please try again",false);
        return false;
      }
    }else{
      ToastCustomMessage("Something Wrong Please try again",false);
      return false;
    }
  }

  Future<ViewPostsModel?> fetchImageViewApi() async {
    var client = http.Client();
    Response response = await client.get(
        Uri.parse(allVideosImages),
    );
    if(response.statusCode == 200){
      // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      //
      // ViewPostsModel viewPostsModel = ViewPostsModel.fromJson(response.body);
      // debugPrint("Done2");
      return ViewPostsModel.fromJson(jsonDecode(response.body));
    }else{
      return null;
    }
  }

  Future likeCommentPost(String videoID,bool isLike,{String? commentDecription}) async {
    try{
      var client = http.Client();
      Response response = await client.post(
        Uri.parse(likeCommentPostService),
        body: {
          "user_id":"10001",
          "video_id":videoID,
          "type": isLike ? "2" :"1",
          "description":isLike ? "" : commentDecription
        }
      );
      if(response.statusCode == 200){
        return true;//ViewPostsModel.fromJson(jsonDecode(response.body));
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }


}
Future<bool?> ToastCustomMessage(String message,bool isSucess){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isSucess ? Colors.green :Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
import '../global/global_web_service.dart';

class PostViewViewModel{
  Future<bool> likePost(String videoID) async{
    bool temp = await WebService().likeCommentPost(videoID,true);
    return temp;
  }

  Future<bool> commentPost(String videoID,String commentMessage) async{
    bool temp = await WebService().likeCommentPost(videoID,false,commentDecription: commentMessage);
    return temp;
  }
}
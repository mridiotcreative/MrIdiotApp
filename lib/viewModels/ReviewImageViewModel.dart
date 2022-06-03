import 'package:image_picker/image_picker.dart';
import 'package:mr_idiot_app/Models/view_post_models.dart';
import 'package:mr_idiot_app/global/global_web_service.dart';

class ReviewImageViewModel{

  Future<bool> uploadImage(XFile? ImageFile,XFile? thumNailView,bool isImage) async{
    bool temp = await WebService().uploadImageViewApi(isImage,imageFile: ImageFile,thumbNailView: thumNailView!);
    return temp;
  }
  Future<ViewPostsModel> fetchPost() async {
    ViewPostsModel? viewPostsModel = await WebService().fetchImageViewApi();
    return viewPostsModel!;
  }

}
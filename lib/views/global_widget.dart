import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_idiot_app/views/EcommerceView/ecommerce_home_view.dart';
import 'package:mr_idiot_app/views/home_view.dart';
import 'package:mr_idiot_app/views/review_image_view.dart';
XFile? imageFile,videoFile;
ImagePicker picker = ImagePicker();
Widget bottomBar(bool cart,BuildContext context){
  return Container(
    height: 55,
    padding: const EdgeInsets.only(top:10,bottom:13),
    color: const Color(0xffFCC609),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: (){
            if(!cart){
              Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context)=>HomeView()), (route) => false);
            }
          },
          child: Column(
            children: const [
              ImageIcon(
                AssetImage("assets/images/home.png"),
                size: 20,
              ),
              Text(
                "Home",
                style: TextStyle(
                  fontSize: 10
                ),
              )
            ],
          ),
        ),
        Column(
          children: const [
            ImageIcon(
              AssetImage("assets/images/shorts.png"),
              size: 20,
            ),
            Text(
                "Shorts",
              style: TextStyle(
                  fontSize: 10
              ),
            )
          ],
        ),
        cart?
        InkWell(
          onTap: (){
            popUP(context);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.black
              ),
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffFCC609),
            ),
            padding: const EdgeInsets.all(3),
            child: const ImageIcon(
              AssetImage("assets/images/add_icon.png",),
              color: Colors.black,
              size: 20,
            ),
          ),
        )
        :const ImageIcon(
          AssetImage("assets/images/ecommerce/mid_icon.png",),
          color: Colors.black,
          size: 50,
        ),
        Column(
          children: const [
            ImageIcon(
              AssetImage("assets/images/ideas.png"),
              size: 20,
            ),
            Text(
                "Ideas",
              style: TextStyle(
                  fontSize: 10
              ),
            )
          ],
        ),
        //cart ?
        InkWell(
          onTap: (){
            if(cart){
              Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context) => EcommerceHomeView()), (route) => false);
            }
          },
          child: Column(
            children: const [
              ImageIcon(
                AssetImage("assets/images/cart1.png"),
                size: 20,
              ),
              Text(
                  "Shop",
                style: TextStyle(
                    fontSize: 10
                ),
              )
            ],
          ),
        )
        // : const ImageIcon(
        //   AssetImage("assets/images/forward_icon.png"),
        //   size: 40,
        // ),
      ],
    ),
  );
}

void popUP(BuildContext context) {
  showModalBottomSheet(
    // isScrollControlled:false,
    isDismissible: true,
    context: context,
    builder: (context) {
      return SizedBox(
        child: SingleChildScrollView(
          child: ListBody(
            children: [
              ListTile(
                onTap: (){
                  selectedImage(context,ImageSource.camera);
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
                  selectedImage(context,ImageSource.gallery);
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
                  selectedVideo(context,ImageSource.camera);
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
                  selectedVideo(context,ImageSource.gallery);
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

///ecommerce bottom bar

Widget globalECommerceBottomBar(bool cart,BuildContext context){
  return Container(
    padding: const EdgeInsets.only(top:10,bottom:10),
    color: Color(0xffFFC909),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: (){
              Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context)=>HomeView()), (route) => false);
          },
          icon: const Icon(
            Icons.home,
            color: Colors.black,
            size: 40,
          ),
        ),
        const ImageIcon(
          AssetImage("assets/images/ecommerce/menuecommerce.png",),
          color: Colors.black,
          size: 35,
        ),
        cart ?
        IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil<dynamic>(context, MaterialPageRoute(builder: (BuildContext context) => EcommerceHomeView()), (route) => false);
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 40,
          ),
        ) :
        const ImageIcon(
          AssetImage("assets/images/forward_icon.png"),
          size: 40,
        )
        ,
      ],
    ),
  );
}
///Upload Image
selectedImage(BuildContext context,ImageSource imageSource) async {
  try{
    imageFile = null;
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
      });
    }
  }catch(e){
    debugPrint(e.toString());
  }
}

///Upload Video
selectedVideo(BuildContext context,ImageSource imageSource) async {
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
      });
    }
  }catch(e){
    debugPrint(e.toString());
  }
}

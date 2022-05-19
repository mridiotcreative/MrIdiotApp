import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/EcommerceView/ecommerce_home_view.dart';
import 'package:mr_idiot_app/views/home_view.dart';

Widget bottomBar(bool cart,BuildContext context){
  return Container(
    padding: const EdgeInsets.only(top:10,bottom:10),
    color: const Color(0xffC4C4C4),
    ///color: Color(0xffFFC700),
//    color: Color(0xff28365A),
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
        InkWell(
          onTap: (){
            popUP(context);
          },
          child: const ImageIcon(
            AssetImage("assets/images/add_icon.png",),
            color: Colors.black,
            size: 35,
          ),
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
        )
            :
        const ImageIcon(
          AssetImage("assets/images/forward_icon.png"),
          size: 40,
        )
        ,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25,
                  right: 5,
                  top: 10,
                  bottom: 15),
              child: IconButton(
                iconSize: 32,
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 5, top: 10, bottom: 15),
              child: IconButton(
                iconSize: 32,
                onPressed: () {},
                icon: const Icon(Icons.image),
              ),
            ),
          ],
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/EcommerceView/ecommerce_home_view.dart';

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
       const Icon(
          Icons.home,
          color: Colors.black,
          size: 40,
        ),
        const ImageIcon(
          AssetImage("assets/images/add_icon.png",),
          color: Colors.black,
          size: 35, 
        ),
        cart ?
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> EcommerceHomeView()));
          },
          icon: Icon(
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

///ecommerce bottom bar

Widget globalECommerceBottomBar(bool cart,BuildContext context){
  return Container(
    padding: const EdgeInsets.only(top:10,bottom:10),
    color: Color(0xffFFC909),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.home,
          color: Colors.black,
          size: 40,
        ),
        const ImageIcon(
          AssetImage("assets/images/ecommerce/menuecommerce.png",),
          color: Colors.black,
          size: 35,
        ),
        cart ?
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> EcommerceHomeView()));
          },
          icon: Icon(
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

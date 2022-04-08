import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomBar(bool cart){
  return Container(
    padding: const EdgeInsets.only(top:10,bottom:10),
    color: Color(0xffC4C4C4),
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
        const Icon(
          Icons.shopping_cart,
          color: Colors.black,
          size: 40,
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
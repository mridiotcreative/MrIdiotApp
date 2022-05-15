import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  CarouselController buttonCarouselController = CarouselController();

  final ScrollController _controllerAxis = ScrollController();
  List<String> bicycleImage = [
    "assets/images/ecommerce/b1.png",
    "assets/images/ecommerce/b2.png",
    "assets/images/ecommerce/b3.png",
  ];
  int tempIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      title: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: const [
              Icon(Icons.arrow_back,size: 22,color: Colors.white,),
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: Icon(Icons.shopping_cart,size: 22,color: Colors.white,),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: Icon(Icons.logout,size: 22,color: Colors.white,),
              ),
              Icon(Icons.more_horiz_rounded,size: 22,color: Colors.white,),
            ],
          ),
        ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _controllerAxis,
                      physics: const ClampingScrollPhysics(),
                      child:  CarouselSlider.builder(
                        carouselController: buttonCarouselController,
                        itemCount: bicycleImage.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 10,right: 10),
                            decoration:  BoxDecoration(
                              // color: Colors.grey,
                                image: DecorationImage(
                                    image:  AssetImage(bicycleImage[itemIndex]),
                                    fit: BoxFit.contain
                                )
                            ),
                          );
                        },
                        options: CarouselOptions(
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlay: false,
                          viewportFraction: 1.0,
                          onPageChanged: (val,re){
                            debugPrint(val.toString());
                            setState(() {
                              tempIndex= val+1;
                            });
                          },
                          height: MediaQuery.of(context).size.height/2.0,
                        ),
                      ),
                    ),
                    Positioned(top: 290,left:10,child: Container(
                        width: 35,
                        height: 18,
                        decoration:BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                              (tempIndex).toString()+"/"+bicycleImage.length.toString(),
                              style: const TextStyle(color: Colors.white,fontSize: 13),
                            )
                        )
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:5.0,left: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        "₹7,342.99",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "₹8,811.74",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const[
                              Icon(Icons.favorite_border_rounded),
                              Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: Text("72"),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8,left: 10.0,right: 10),
                  child:  Text("Urban Terrain UT3000 Series, Alloy MTB 27.5 Mountain Cycle with 21 Shimano Gear , PAN India Installation and OneFitPlus App Tracking.",
                  style: TextStyle(color: Colors.black),maxLines: 3,overflow: TextOverflow.ellipsis,),
                ),
                const Padding(
                  padding:  EdgeInsets.only(top: 20.0),
                  child:  Divider(
                    color: Color(0xfffc4c4c4),
                    thickness: 8,
                    height: 1,
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const[
                        Expanded(child: Text("Delivery Details",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
                        Text("Check deliver date",style: TextStyle(color: Color(0xff268cb8),),),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(top: 20.0),
                  child:  Divider(
                    color: Color(0xfffc4c4c4),
                    thickness: 8,
                    height: 1,
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 20,top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Expanded(child: Text("Product Details",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
                        Text("+ More",style: TextStyle(color: Color(0xff268cb8),),),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar:  Container(
        child: Row(
          children: [
            Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.10,
            color: Colors.white,
            child:Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (builder)=> EcommerceHomeView()));
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
            Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.10,
                color: Colors.amber,
                child:const Center(
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

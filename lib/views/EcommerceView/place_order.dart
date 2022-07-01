import 'package:flutter/material.dart';
enum SingingCharacter { wallet, netBank,card,cod }
class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}
class _PlaceOrderState extends State<PlaceOrder> {
  Color gColor = Color(0xfff0f4f7);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,//Color(0xfff0f4f7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 22,
              color: Colors.white,
            )
        ),
        backgroundColor: const Color(0xff2D2D37),
        title: const Text(
          "Order Summary",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: gColor,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     Container(
                       padding: const EdgeInsets.only(left:20,top:10,bottom: 10,right: 20),
                       color: Colors.white,
                       child: Column(
                         children: [
                           Container(
                             padding: const EdgeInsets.only(top:10,left: 20,right: 20),
                             child: Row(
                               children: [
                                 Container(
                                   padding: const EdgeInsets.all(3),
                                   margin: const EdgeInsets.only(bottom: 5),
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(100),
                                       border: Border.all(
                                           width: 1,
                                           color: Colors.blue
                                       )
                                   ),
                                   child: const Icon(Icons.check,color: Colors.blue,size: 20,),
                                 ),
                                 Expanded(child: Container(
                                   margin: const EdgeInsets.only(bottom: 7,left: 10,right: 10),
                                   decoration: BoxDecoration(
                                       border: Border.all(
                                           width: 1,
                                           color: Colors.blue
                                       )
                                   ),
                                 )),
                                 Stack(
                                   children: [
                                     Container(
                                       padding: const EdgeInsets.all(13),
                                       margin: const EdgeInsets.only(bottom: 5),
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           color: Colors.blue,
                                           border: Border.all(
                                               width: 1,
                                               color: Colors.blue
                                           )
                                       ),
                                     ),
                                     const Padding(
                                       padding: EdgeInsets.only(left: 10,top: 6,),
                                       child: Text(
                                         "2",
                                         style: TextStyle(
                                             color: Colors.white
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                                 Expanded(child: Container(
                                   margin: const EdgeInsets.only(bottom: 7,left: 10,right: 10),
                                   decoration: BoxDecoration(
                                       border: Border.all(
                                           width: 1,
                                           color: Colors.grey
                                       )
                                   ),
                                 )),
                                 Stack(
                                   children: [
                                     Container(
                                       padding: const EdgeInsets.all(13),
                                       margin: const EdgeInsets.only(bottom: 5),
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           color: Colors.white,
                                           border: Border.all(
                                               width: 1,
                                               color: Colors.blue
                                           )
                                       ),
                                     ),
                                     const Padding(
                                       padding: EdgeInsets.only(left: 10,top: 6,),
                                       child: Text(
                                         "3",
                                         style: TextStyle(
                                             color: Colors.blue
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           Container(
                             padding: const EdgeInsets.only(top:0,left: 5,right: 5),
                             child: Row(
                               children: [
                                 Container(
                                     padding: const EdgeInsets.all(3),
                                     margin: const EdgeInsets.only(bottom: 5),
                                     child: const Text("Address")
                                 ),
                                 Expanded(child: Container(
                                   margin: const EdgeInsets.only(bottom: 7,left: 10,right: 10),
                                   decoration: BoxDecoration(
                                       border: Border.all(
                                           width: 1,
                                           color: Colors.transparent
                                       )
                                   ),
                                 )),
                                 Container(
                                     padding: const EdgeInsets.all(3),
                                     margin: const EdgeInsets.only(bottom: 5),
                                     child: const Text(
                                       "Order Summary",
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold
                                       ),
                                     )
                                 ),
                                 Expanded(
                                     child: Container(
                                       margin: const EdgeInsets.only(bottom: 7,left: 10,right: 10),
                                       decoration: BoxDecoration(
                                           border: Border.all(
                                               width: 1,
                                               color: Colors.transparent
                                           )
                                       ),
                                     )
                                 ),
                                 Container(
                                     padding: const EdgeInsets.all(3),
                                     margin: const EdgeInsets.only(bottom: 5),
                                     child: const Text("Payment")
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:20,top:10,bottom: 10,right: 20),
                        color:Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                    child: Text(
                                        "Deliver to:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                      ),
                                    )
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey
                                    )
                                  ),
                                  child: const Text(
                                    "Change",
                                    style: TextStyle(
                                      color: Colors.blue
                                    ),
                                  ),
                                )
                              ],
                            ),

                            Row(
                              children: [
                                const Text(
                                    "Sivam Maurya",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Home",
                                    style: TextStyle(
                                      fontSize: 12,
                                      backgroundColor: Colors.grey.withOpacity(0.4)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "552, rameshwar nagar, new borivali road, pandesara, udhna surat 20202020",
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "+911234567890",
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:20,top:10,bottom: 10,right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/cycle.png",width: MediaQuery.of(context).size.width*0.4,),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            "geeky hashtag 26t single speed steel in frame 18 inched height and width description ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "₹7,399.00",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "In Stock",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.green,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Sold by ",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "Rajesh Enterprises",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Color(0xff056d84)
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Color Name:",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "orange",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                  )
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.12,
                                  height: 35,
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.grey.withOpacity(0.2)
                                        ],
                                      ),
                                      border: Border.all(
                                          width: 1,
                                        color: Colors.grey
                                      ),
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                                  ),
                                  child: const Icon(Icons.delete_outline_outlined),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.15,
                                  height: 35,
                                  padding: const EdgeInsets.only(top: 5),
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey),
                                  ),
                                  child: const Text(
                                    "1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff056d84)
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.12,
                                  height: 35,
                                  //padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.grey.withOpacity(0.2)
                                        ],
                                      ),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  margin: const EdgeInsets.only(left:10),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width*0.15,
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: const [
                                Icon(Icons.local_offer_outlined),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Apply Coupon"
                                    ),
                                  ),
                                ),
                                Text(
                                    "Select",
                                  style: TextStyle(
                                      color: Color(0xff056d84)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [

                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            margin: const EdgeInsets.only(top:7),
                            padding: const EdgeInsets.only(left:20,top:15,bottom: 20,right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Order Details",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Bag total",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "₹6,450.00",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Big Saving",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "-₹5,160.00",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Coupon Savings",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "Apply Coupon",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Color(0xff056d84)
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Delivery",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "Free",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Amount Payable",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "₹1,290.00",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top:0,
                              child:Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: gColor,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    width: 15,
                                    height: 15,
                                  ),
                                ],
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              Container(
                color:Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "₹1,290.00",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "view details",
                            style: TextStyle(
                                color: Color(0xff056d84),
                                fontSize: 13
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:const Color(0xff2D2D37),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                          "Proceed To Payment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mr_idiot_app/views/EcommerceView/place_order.dart';

import 'ecommerce_home_view.dart';

class PlaceOrderView extends StatefulWidget {
  const PlaceOrderView({Key? key}) : super(key: key);

  @override
  State<PlaceOrderView> createState() => _PlaceOrderViewState();
}

class _PlaceOrderViewState extends State<PlaceOrderView> {

  SingingCharacter? _character = SingingCharacter.wallet;

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
          "Place Order",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height/10,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: Colors.black12.withOpacity(0.1))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.check_circle_outlined, color: Colors.green),//:Colors.green,),
                                SizedBox(width: 3,),
                                Text('Address',
                                  style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17),),
                                SizedBox(width: 15,),
                                Icon(Icons.check_circle_outlined,color:  Colors.orange),//:Colors.amber,),
                                SizedBox(width: 3,),
                                Text('Payment',
                                  style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17),),
                              ],
                            ),
                          ),
                        const SizedBox(height: 5,),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child:  Text(
                            "Payment Method",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,

                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/13,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black12.withOpacity(0.1))
                          ),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Wallet/UPI')),
                              Radio<SingingCharacter>(
                                activeColor: Colors.deepOrange,
                                value: SingingCharacter.wallet,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() { _character = value; });},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/13,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black12.withOpacity(0.1))
                          ),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Net Banking')),
                              Radio<SingingCharacter>(
                                activeColor: Colors.deepOrange,
                                value: SingingCharacter.netBank,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() { _character = value; });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/13,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black12.withOpacity(0.1))
                          ),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Credit/Debit/ATM Card')),
                              Radio<SingingCharacter>(
                                activeColor: Colors.deepOrange,
                                value: SingingCharacter.cod,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() { _character = value; });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/13,
                          padding: const EdgeInsets.only(left: 15),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black12.withOpacity(0.1))
                          ),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Cash on Delivery')),
                              Radio<SingingCharacter>(
                                activeColor: Colors.deepOrange,
                                value: SingingCharacter.card,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() { _character = value; });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15),
                          child: Row(
                            children:  const [
                              Expanded(child: Text('Total Amount',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                              Padding(
                                padding: EdgeInsets.only(right: 18),
                                child: Text('₹ 16,497',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  color:Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset('assets/images/ecommerce/success5.png',fit: BoxFit.cover,),
                                    const SizedBox(height: 20,),
                                    const Text('Payment Successfull',style: TextStyle(color: Colors.green,fontSize: 22),),
                                    const SizedBox(height: 30,),
                                    const Text('Thank you for your payment. An automated payment receipt will be sent to your registered email',textAlign: TextAlign.center,),
                                    const SizedBox(height: 30,),
                                    InkWell(
                                      onTap: ()
                                      {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EcommerceHomeView(),),);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 30),
                                        width: MediaQuery.of(context).size.width,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius: BorderRadius.circular(30),
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [Colors.deepOrange.shade300,Colors.amber]
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.deepOrangeAccent.withOpacity(0.8),
                                              spreadRadius: 0.5,
                                              blurRadius: 3,
                                              offset: const Offset(0, 0),
                                              // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: const Center(child:  Text('Done',style: TextStyle(fontSize: 21,color: Colors.white),)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:const Color(0xff2D2D37),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        "Proceed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
          )
      ),
    );
  }
}

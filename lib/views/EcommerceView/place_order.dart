import 'package:flutter/material.dart';

import 'ecommerce_home_view.dart';

enum SingingCharacter { wallet, netBank,card,cod }
class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}
class _PlaceOrderState extends State<PlaceOrder> {
  bool isChecked = false;
  bool isVisible = false;
  bool isPlaceOrder= false;
  final _formKey = GlobalKey<FormState>();
  SingingCharacter? _character = SingingCharacter.wallet;
  String? deliveryAddress='D-189,Deer Haven Drive, Fountain Inn,SC,South Carolina ,29644';
  final TextEditingController _deliveryAddressController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title:  const Text('Place Order', style:TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
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
              children: [
                Icon(Icons.check_circle_outlined, color: isPlaceOrder==false?Colors.black:Colors.green,),
                const SizedBox(width: 3,),
                const Text('Address',
                  style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17),),
                const SizedBox(width: 15,),
                Icon(Icons.check_circle_outlined,color:  isPlaceOrder==false?Colors.grey:Colors.amber,),
                const SizedBox(width: 3,),
                Text('Payment',
                  style:TextStyle(fontWeight: FontWeight.bold,color: isPlaceOrder==false?Colors.grey:Colors.black,fontSize: 17),),
              ],
            ),
          ),
          isPlaceOrder==false
              ? Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children:  [
                        const SizedBox(width: 10,),
                        const Expanded(child: Text('Delivery Address',style:  TextStyle(fontSize: 19,fontWeight: FontWeight.bold))),
                        InkWell(
                          onTap: ()
                          {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      children: <Widget>[
                                        Form(
                                          key: _formKey,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children:  <Widget>[
                                                const Text('Address',style: TextStyle(fontSize: 22),),
                                                 Padding(
                                                  padding: const EdgeInsets.only(top: 20),
                                                  child: TextField(
                                                    controller: _deliveryAddressController,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(borderSide: BorderSide(width: 1.0)),
                                                      hintText: 'Enter Address',
                                                      hintStyle: TextStyle(fontSize: 20,color: Colors.grey),
                                                      contentPadding:EdgeInsets.fromLTRB(10,10,10,0),
                                                      // labelText: 'Email',
                                                    ),
                                                    minLines: 10,
                                                    keyboardType: TextInputType.multiline,
                                                    maxLines: null,
                                                    style: const TextStyle(
                                                        color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: ()
                                                  {
                                                    if(_deliveryAddressController.text.isEmpty)
                                                    {
                                                      setState(() {
                                                        /// Add API's Address here
                                                        deliveryAddress='Address is not Added';
                                                      });
                                                    }else{
                                                      setState(() {
                                                        deliveryAddress=_deliveryAddressController.text;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    margin: const EdgeInsets.only(top: 30),
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 48,
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
                                                    child: const Center(
                                                        child: Text('Ok',style: TextStyle(fontSize: 21,color: Colors.white),)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height/19,
                            width:75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient:  LinearGradient(
                                  colors: [Colors.deepOrange.shade300,Colors.amber],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const[
                                Center(child: Icon(Icons.add,color: Colors.white,)),
                                Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Center(child: Text('Add',style: TextStyle(color: Colors.white),)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.black12.withOpacity(0.1))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:  [
                            const Expanded(child:  SizedBox(height: 1,)),
                            PopupMenuButton(itemBuilder: (context) => [
                              const PopupMenuItem(child: Text('Edit'),value: 1,),
                              const PopupMenuItem(child: Text('Delete'),value: 2,),
                            ],),
                          ],
                        ),
                        const Text('Sagar Mishra',style:  TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                        Text(deliveryAddress!=null?deliveryAddress!:'Address is not Added Yet1',maxLines: 2,overflow: TextOverflow.ellipsis,style:  TextStyle(fontSize: 18,)),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Align(alignment: Alignment.bottomRight,child: Text('Delivery Address',style: TextStyle(fontSize: 20,color: Colors.grey.shade400))),
                              Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value)
                                  {
                                    setState(() {
                                      isChecked=value!;
                                    });
                                  })
                            ],),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.black12.withOpacity(0.1))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(child: Text('Add Voucher Code',style:  TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
                        InkWell(
                            onTap: ()
                            {
                              setState(() {
                                isVisible==true?isVisible=false:isVisible=true;
                              });

                            },
                            child: const Icon(Icons.keyboard_arrow_down,size: 30,))
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15,top: 10),
                    child: Text('Order Summery',style:  TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                  ),
                  isVisible==true?Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    margin: const EdgeInsets.fromLTRB(10,20,10,10),
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.black12.withOpacity(0.1))
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Code',
                        hintStyle: TextStyle(fontSize:20),
                      ),
                    ),
                  ):const SizedBox(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height/2.1,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(left: 15,top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.black12.withOpacity(0.1))
                    ),
                    child: Column(
                      children: [
                        Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1.7),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children:const [
                            TableRow(
                                children: [
                                  TableCell(
                                    child: Text('Product Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  ),
                                  TableCell(
                                    child: Text('Qty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  ),
                                  TableCell(
                                    child: Text('Amount',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  ),
                                ]
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1.7),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.top,
                          children:const [
                            TableRow(
                                children: [
                                  TableCell(
                                    child:Padding(
                                      padding: EdgeInsets.only(right: 17),
                                      child: Text('Fossil Gen 5 Carlyle Touch Screen Smartwatch with Speaker',textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9),
                                      child: Text('1',style: TextStyle(fontSize: 18)),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text('₹ 5,499',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                  ),
                                ]
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: Divider(
                            color: Colors.black12,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1.7),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.top,
                          children:const [
                            TableRow(
                                children: [
                                  TableCell(
                                    child:Padding(
                                      padding: EdgeInsets.only(right: 17),
                                      child: Text('Fossil Gen 5 Carlyle Touch Screen Smartwatch with Speaker',textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9),
                                      child: Text('1',style: TextStyle(fontSize: 18)),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text('₹ 5,499',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                  ),
                                ]
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: Divider(
                            color: Colors.black12,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1.7),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment: TableCellVerticalAlignment.top,
                          children:const [
                            TableRow(
                                children: [
                                  TableCell(
                                    child:Padding(
                                      padding: EdgeInsets.only(right: 17),
                                      child: Text('Fossil Gen 5 Carlyle Touch Screen Smartwatch with Speaker',textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9),
                                      child: Text('1',style: TextStyle(fontSize: 18)),
                                    ),
                                  ),
                                  TableCell(
                                    child: Text('₹ 5,499',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                  ),
                                ]
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: Divider(
                            color: Colors.black12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
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
                  )
                ],
              ),
            ),
          )
              : Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children: const [
                        SizedBox(width: 10,),
                        Expanded(child: Text('Payment Method',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),)),
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
          InkWell(
            onTap: ()
            {
              if(isPlaceOrder==false)
              {
                setState(() {
                  isPlaceOrder=true;
                });
              }
              else
              {
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
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const EcommerceHomeView(),),
                                  );
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
              }
            },
            child: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(50, 10, 50, 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/14,
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
                child: Center(child: Text(isPlaceOrder==false?"Confirm":"Proceed",style: const TextStyle(fontSize: 21,color: Colors.white),)),
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}

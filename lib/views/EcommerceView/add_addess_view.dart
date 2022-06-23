import 'package:flutter/material.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _alternateNumberController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  bool isHome = true,isOffice = false,isOther = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
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
          "Add Address",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:15, bottom: 15),
                  child: customText("Delivery Info",true),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText("FULL NAME",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_fullNameController,false),
                      ),
                      customText("PHONE NUMBER",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_phoneNumberController,true),
                      ),
                      customText("Alternative Number(Optional)",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_alternateNumberController,true),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:15, bottom: 15),
                  child: customText("Address",true),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText("PINCODE",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_pinCodeController,true),
                      ),
                      customText("Address",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_addressController,false),
                      ),
                      customText("Locality",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_localityController,false),
                      ),
                      customText("Landmark (Optional)",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_landmarkController,false),
                      ),
                      customText("City",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_cityController,false),
                      ),
                      customText("State",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_stateController,false),
                      ),
                      customText("Country",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_countryController,false),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:15, bottom: 15),
                  child: customText("Delivery Info",true),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText("FULL NAME",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_fullNameController,false),
                      ),
                      customText("PHONE NUMBER",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_phoneNumberController,true),
                      ),
                      customText("Alternative Number(Optional)",false),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,top: 5),
                        child: customTextFormField(_fullNameController,true),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:15, bottom: 15),
                  child: customText("This is my",true),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isOther = false;
                          isHome = true;
                          isOffice = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color:isHome ? Color(0xfffdd734): Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 1
                          ),
                        ),
                        child: customText("HOME",true,colorVal: isHome ? Colors.white :Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isOther = false;
                          isHome = false;
                          isOffice = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: isOffice ? Color(0xfffdd734): Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 1
                          ),
                        ),
                        child: customText("OFFICE",true,colorVal: isOffice ? Colors.white :Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isOther = true;
                          isHome = false;
                          isOffice = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: isOther ? Color(0xfffdd734): Colors.white,
                          border: Border.all(
                              color: Colors.black,
                              width: 1
                          ),
                        ),
                        child: customText("OTHER",true,colorVal: isOther ? Colors.white :Colors.black),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      ///save click
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff2D2D37),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    margin: const EdgeInsets.only(top: 20,bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    child: const Text("SAVE",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget customText(String textVal,bool isBold,{Color colorVal = Colors.black}){
    return Text(
      textVal,
      style: TextStyle(
          color: colorVal,//Colors.black,
          fontWeight: isBold ? FontWeight.bold : FontWeight.w500
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
  Widget customTextFormField(TextEditingController textController,bool isNumber){
    return TextFormField(
      controller: textController,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      ),
    );
  }
}

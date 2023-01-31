import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/res/colors.dart';
import '../Models/Responses/consult_filter_model.dart';
import '../View/Consult/Controller/consult_controller.dart';
import '../utils/const.dart';
import '../utils/size_config.dart';

class ModalFilter extends StatefulWidget {
 final ConsultFilterModel consultFilterModel;
  const ModalFilter({Key? key,required this.consultFilterModel}) : super(key: key);


  @override
  _ModalFilterState createState() => _ModalFilterState();

}

class _ModalFilterState extends State<ModalFilter> {

 var consultController =Get.put(ConsultController());
  @override
  Widget build(BuildContext context) {
    return GetX<ConsultController>(
        init: Get.put(ConsultController()),
        builder: (consultController) {
          return Material(
              color: ColorsApp.white,
              child: SafeArea(
                top: false,
                child: Container(
                  margin: const EdgeInsets.only(top: 40,right: 30,left: 30),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight/2.7,
                  child: Column(
                    children: [
                      Directionality(textDirection: TextDirection.rtl,
                        child: Container(

                          height: 50,
                          width: SizeConfig.screenWidth,
                          decoration:  BoxDecoration(
                              borderRadius:const BorderRadius.all( Radius.circular(10)),
                              color: ColorsApp.backTextField,
                              border: Border.all(color: ColorsApp.backTextField,width: 2)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: DropdownButtonFormField2(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color:  ColorsApp.backTextField,
                                  width: 0.7,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color:  ColorsApp.backTextField,
                                  width: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color:  ColorsApp.backTextField,
                                  width: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(10),

                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,

                            ),
                            isExpanded: true,
                            hint: const Text(
                              'همه',
                              style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                                color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                              ),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color:  ColorsApp.colorTextNormal,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                            dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorsApp.white
                            ),
                            items: widget.consultFilterModel.siteLinks
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item.name,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(color: ColorsApp.colorTextNormal,fontWeight: FontWeight.normal,
                                          fontSize: 14,fontFamily: "IranSANS"
                                      ),textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                              consultController.getLinkId( value.toString());
                            },
                            onSaved: (value) {
                              //consultController. getInsta( value.toString());
                            },
                          ),
                        ),),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(width: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              GestureDetector(
                                onTap: (){
                                  consultController.getShowFilter(0);

                                },
                                child: Row(
                                  children: [
                                    const Text("خیر",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      padding:const EdgeInsets.all(0),
                                      child:consultController.showFilter.value==0?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary, ) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )
                                    
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getShowFilter(1);
                                },
                                child:Row(
                                  children: [
                                    const Text("بله",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.showFilter.value==1?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getShowFilter(2);
                                },
                                child:Row(
                                  children: [
                                    const Text("همه",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.showFilter.value==2?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Container(
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.only(right: 5),
                                width: 90,
                                child:const Text(": مشاهده",
                                  style: TextStyle(color: ColorsApp.black,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(width: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              GestureDetector(
                                onTap: (){
                                  consultController.getChatFilter(0);

                                },
                                child: Row(
                                  children: [
                                    const Text("خیر",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.chatFilter.value==0?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getChatFilter(1);
                                },
                                child:Row(
                                  children: [
                                    const Text("بله",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.chatFilter.value==1?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getChatFilter(2);
                                },
                                child:Row(
                                  children: [
                                    const Text("همه",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.chatFilter.value==2?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Container(
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.only(right: 5),
                                width: 90,
                                child:const Text(": پیام",
                                  style: TextStyle(color: ColorsApp.black,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(width: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              GestureDetector(
                                onTap: (){
                                  consultController.getCallFilter(0);

                                },
                                child: Row(
                                  children: [
                                    const Text("خیر",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.callFilter.value==0?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getCallFilter(1);
                                },
                                child:Row(
                                  children: [
                                    const Text("بله",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.callFilter.value==1?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getCallFilter(2);
                                },
                                child:Row(
                                  children: [
                                    const Text("همه",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.callFilter.value==2?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Container(
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.only(right: 5),
                                width: 90,
                                child: const Text(": تماس",
                                  style: TextStyle(color: ColorsApp.black,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(width: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              GestureDetector(
                                onTap: (){
                                  consultController.getBuyFilter(0);

                                },
                                child: Row(
                                  children: [
                                    const Text("خیر",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.buyFilter.value==0?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getBuyFilter(1);
                                },
                                child:Row(
                                  children: [
                                    const Text("بله",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.buyFilter.value==1?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              GestureDetector(
                                onTap: (){
                                  consultController.getBuyFilter(2);
                                },
                                child:Row(
                                  children: [
                                    const Text("همه",
                                      style: TextStyle(color: ColorsApp.black,fontSize:13,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                                    Container(
                                      height: 40,width: 40,
                                      child:consultController.buyFilter.value==2?Image.asset(ConstAddress.image +"chF.png",color: ColorsApp.primary,) :
                                      Image.asset(ConstAddress.image +"ch.png",color: ColorsApp.iconTextField,),
                                    )

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Container(
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.only(right: 5),
                                width: 90,
                                child:const Text(": خرید",
                                  style: TextStyle(color: ColorsApp.black,fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w400),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          consultController.requestList.clear();
                          consultController.pager.value=1;
                          consultController. consultList(consultController.pager.value,10,consultController.showFilter.value,
                              consultController.callFilter.value,consultController.chatFilter.value,consultController.buyFilter.value,consultController.linkId,"");
                          Get.back();
                          setState(() {
                            consultController.linkId=-1;
                          });
                        },
                        child: Container(
                          width: SizeConfig.screenWidth,
                          margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                          padding:const EdgeInsets.only(top: 10,bottom: 10),
                          decoration:const BoxDecoration(
                            color: ColorsApp.primaryLight2,
                            borderRadius:  BorderRadius.all(Radius.circular(15),
                            ),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("اعمال فیلتر" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });

  }

}
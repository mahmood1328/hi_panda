import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Widget/modal_filter.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../Chat/Components/loading_chat_list.dart';
import '../Components/item_consult.dart';
import '../Components/item_factory.dart';
import '../Controller/consult_controller.dart';

class ConsultPage extends StatelessWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ConsultController>(
        init: Get.put(ConsultController()),
        builder: (consultController) {
          return consultController.isLoading.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            body: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height:40,
                            width:SizeConfig.screenWidth,
                            decoration: const BoxDecoration(
                              color: ColorsApp.primary,
                              borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                              //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))

                            ),
                          ),
                        const  SizedBox(height: 30,),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              width: SizeConfig.screenWidth,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      consultController.getIndexPage(1);
                                      consultController.scrollToBottom();
                                    },
                                    child: Column(
                                      children: [
                                        Text("لیست درخواست",
                                          style: TextStyle(color: consultController.indexValuePage.value==1?ColorsApp.primary:ColorsApp.black.withOpacity(0.3),fontSize:14,fontFamily: "IranSANS",fontWeight: FontWeight.w600),),
                                        const SizedBox(height: 8,),
                                        Container(
                                          height: 2,
                                          width: SizeConfig.screenWidth/3.4,
                                          color: consultController.indexValuePage.value==1? ColorsApp.primary:ColorsApp.black.withOpacity(0.3),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      consultController.getIndexPage(2);
                                      consultController.scrollToBottom();
                                    },
                                    child: Column(
                                      children: [
                                        Text("لیست فاکتور",
                                          style: TextStyle(color:consultController.indexValuePage.value==2? ColorsApp.primary:ColorsApp.black.withOpacity(0.3),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.w600),),
                                        const SizedBox(height: 8,),
                                        Container(
                                          height: 2,
                                          width: SizeConfig.screenWidth/3.4,
                                          color:consultController.indexValuePage.value==2? ColorsApp.primary:ColorsApp.black.withOpacity(0.3),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      consultController.getIndexPage(3);
                                      consultController.scrollToBottom();
                                    },
                                    child: Column(
                                      children: [
                                        Text("ثبت درخواست جدید",
                                          style: TextStyle(color:consultController.indexValuePage.value==3? ColorsApp.primary:ColorsApp.black.withOpacity(0.3),fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.w600),),
                                        const SizedBox(height: 8,),
                                        Container(
                                          height: 2,
                                          width: SizeConfig.screenWidth/3.4,
                                          color:consultController.indexValuePage.value==3? ColorsApp.primary:ColorsApp.black.withOpacity(0.3),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const  SizedBox(height: 10,),
                          consultController.indexValuePage.value<=2? Row(
                            children: [
                              consultController.indexValuePage.value==1?
                              GestureDetector(
                                onTap: (){
                                  showCupertinoModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      useRootNavigator: true,
                                      backgroundColor: ColorsApp.white,
                                      builder: (BuildContext context) =>

                                          ModalFilter(consultFilterModel: consultController.consultFilterModel!,));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 0,left: 25),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: ColorsApp.white,
                                      borderRadius:const BorderRadius.all(Radius.circular(25)),
                                      border: Border.all(width: 1,color: ColorsApp.black.withOpacity(0.3))

                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset("${ConstAddress.image}filter1.png",color: ColorsApp.primaryLight2,height: 25,width: 25,),
                                  ),
                                ),
                              ):const SizedBox(width: 25,),
                              Container(
                                height: 60,
                                width:consultController.indexValuePage.value==1? SizeConfig.screenWidth/1.25:SizeConfig.screenWidth/1.13,
                                padding: EdgeInsets.symmetric(horizontal:consultController.indexValuePage.value==1? 10:0,vertical: 5),
                                child: TextField(
                                  controller: consultController.controllerSearch,

                                  cursorColor: Colors.grey,
                                  onChanged: (value) {
                                  },
                                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                  //controller: controllerPhone,
                                  textAlign: TextAlign.right,
                                  style:const TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: ColorsApp.backTextField,
                                    filled: true,
                                    prefixIcon:  GestureDetector(
                                      onTap: (){

                                        if(consultController.indexValuePage.value==1)
                                          {
                                            consultController.requestList.clear();
                                            consultController.pager.value=1;
                                            consultController. consultList(consultController.pager.value,10,consultController.showFilter.value,
                                                consultController.callFilter.value,consultController.chatFilter.value,
                                                consultController.buyFilter.value,consultController.linkId,consultController.controllerSearch.text);
                                          }else if(consultController.indexValuePage.value==2){

                                          consultController.requestFactoryList.clear();
                                          consultController. factoryList(1,10,consultController.controllerSearch.text);
                                        }

                                      },
                                      child: Container(
                                        padding:const EdgeInsets.all(7),
                                        margin:const EdgeInsets.only(left: 10),
                                        child: SvgPicture.asset(
                                          "${ConstAddress.icon}Search.svg",color: ColorsApp.iconTextField,
                                        ),
                                      ),
                                    ),
                                    counterText: "",
                                    contentPadding:
                                    const EdgeInsets.only(left: 16, right: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide:const BorderSide(
                                        color: ColorsApp.backTextField,
                                        width: 0.7,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:const BorderSide(
                                        color: ColorsApp.backTextField,
                                        width: 0.7,
                                      ),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:const BorderSide(
                                        color:ColorsApp.backTextField,
                                        width: 0.7,
                                      ),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    hintText: "جستجو ",
                                    hintStyle:const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsApp.iconTextField,
                                        fontFamily: 'IranSANS'),
                                  ),
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  // maxLength: 11,
                                ),
                              ),
                            ],
                          ):const SizedBox(),
                         SizedBox(
                           height:consultController.indexValuePage.value==3? SizeConfig.screenHeight:SizeConfig.screenHeight/1.4,
                           width: SizeConfig.screenWidth,
                           child: RefreshIndicator(
                             color: ColorsApp.white,
                             backgroundColor: ColorsApp.primary,
                             onRefresh: () =>consultController.fetchFruit(),
                             child: ListView(
                               physics: const BouncingScrollPhysics(),
                               controller: consultController.scrollController,
                               children: [
                                 consultController.indexValuePage.value==1?
                                 Column(
                                   children: consultController.requestList.map((element) => SizedBox(
                                     child: ItemConsultComponent(request: element,),
                                   )).toList(),
                                 ):consultController.indexValuePage.value==2?
                                 Column(
                                   children: consultController.requestFactoryList.map((e) =>
                                       ItemFactoryComponent(factor: e,)).toList(),
                                 ):
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 35,vertical: 0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: const [
                                            Text(" لینک",
                                              style: TextStyle(color: ColorsApp.black,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                          ],
                                        ),
                                      ),
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
                                          margin: const EdgeInsets.only(top: 10,right: 0,left: 0),
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
                                            hint:const  Text(
                                              'سایت',
                                              style: TextStyle(fontSize: 15,fontFamily: "IranSANS",
                                                color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color:  ColorsApp.primary,
                                            ),
                                            iconSize: 40,
                                            buttonHeight: 60,
                                            buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                                            dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: ColorsApp.white
                                            ),
                                            items: consultController.consultFilterModelAdd!.siteLinks
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
                                              consultController. getInsta( value.toString());
                                            },
                                            onSaved: (value) {
                                              consultController. getInsta( value.toString());
                                            },
                                          ),
                                        ),),
                                      const SizedBox(height: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: const [
                                            Text(" نام",
                                              style: TextStyle(color: ColorsApp.black,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width: SizeConfig.screenWidth/1.2,
                                        child: TextField(
                                          controller: consultController.controllerNameReg,
                                          cursorColor: Colors.grey,
                                          onChanged: (value) {
                                          },
                                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                          //controller: controllerPhone,
                                          textAlign: TextAlign.right,
                                          style:const TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          decoration: InputDecoration(
                                            fillColor: ColorsApp.white,
                                            filled: true,
                                            counterText: "",
                                            contentPadding:
                                            const EdgeInsets.only(left: 16, right: 5),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color:ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            hintText: " ",
                                            hintStyle:const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                color: ColorsApp.iconTextField,
                                                fontFamily: 'IranSANS'),
                                          ),
                                          maxLines: 1,
                                          keyboardType: TextInputType.emailAddress,
                                          // maxLength: 11,
                                        ),
                                      ),
                                      const SizedBox(height: 8,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: const [
                                            Text(" اکانت اینستاگرام",
                                              style: TextStyle(color: ColorsApp.black,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width: SizeConfig.screenWidth/1.2,
                                        child: TextField(
                                          controller: consultController.controllerInstaReg,
                                          cursorColor: Colors.grey,
                                          onChanged: (value) {
                                          },
                                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                          //controller: controllerPhone,
                                          textAlign: TextAlign.right,
                                          style:const TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          decoration: InputDecoration(
                                            fillColor: ColorsApp.white,
                                            filled: true,
                                            counterText: "",
                                            contentPadding:
                                            const EdgeInsets.only(left: 16, right: 5),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color:ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            hintText: " ",
                                            hintStyle:const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                color: ColorsApp.iconTextField,
                                                fontFamily: 'IranSANS'),
                                          ),
                                          maxLines: 1,
                                          keyboardType: TextInputType.emailAddress,
                                          // maxLength: 11,
                                        ),
                                      ),
                                      const SizedBox(height: 8,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: const [
                                            Text(" شماره موبایل",
                                              style: TextStyle(color: ColorsApp.black,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width: SizeConfig.screenWidth/1.2,
                                        child: TextField(
                                          controller: consultController.controllerMobileReg,
                                          cursorColor: Colors.grey,
                                          onChanged: (value) {
                                          },
                                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                          //controller: controllerPhone,
                                          textAlign: TextAlign.right,
                                          style:const TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          decoration: InputDecoration(
                                            fillColor: ColorsApp.white,
                                            filled: true,
                                            counterText: "",
                                            contentPadding:
                                            const EdgeInsets.only(left: 16, right: 5),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color:ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            hintText: " ",
                                            hintStyle:const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                color: ColorsApp.iconTextField,
                                                fontFamily: 'IranSANS'),
                                          ),
                                          maxLines: 1,
                                          keyboardType: TextInputType.phone,
                                           maxLength: 11,
                                        ),
                                      ),
                                      const SizedBox(height: 8,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: const [
                                            Text(" توضیحات",
                                              style: TextStyle(color: ColorsApp.black,fontSize:15,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width: SizeConfig.screenWidth/1.2,
                                        child: TextField(
                                          controller: consultController.controllerInfoReg,
                                          cursorColor: Colors.grey,
                                          onChanged: (value) {
                                          },
                                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                          //controller: controllerPhone,
                                          textAlign: TextAlign.right,
                                          style:const TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          decoration: InputDecoration(
                                            fillColor: ColorsApp.white,
                                            filled: true,
                                            counterText: "",
                                            contentPadding:
                                            const EdgeInsets.only(left: 16, right: 5),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color: ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:const BorderSide(
                                                color:ColorsApp.backTextField,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            hintText: " ",
                                            hintStyle:const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                color: ColorsApp.iconTextField,
                                                fontFamily: 'IranSANS'),
                                          ),
                                          maxLines: 1,
                                          keyboardType: TextInputType.emailAddress,
                                          // maxLength: 11,
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){


                                          consultController.registerNewConsult(0,context);

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
                                              Text(" ثبت اطلاعات" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.white,fontFamily: "IranSANS"),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                               ],
                             ),
                           ),
                         )
                        ],
                      ),
                    ),
                  ),
                consultController.isLoadingImage.value?  const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator(color: ColorsApp.primary,),
                    ),
                ):const SizedBox(),
                  consultController.indexValuePage.value<3&&  consultController.requestList.isEmpty&&consultController.requestFactoryList.isEmpty&&consultController.isLoadingImage.value==false?
                  const Center(
                    child: Align(
                      alignment: Alignment.center,
                      child:  Text(" اطلاعاتی یافت نشد " , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal , color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                    ),
                  ):const SizedBox()
                ],
              ),
            ),
          )
              : const LoadingChatList();
        });

  }
}

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../Network/service_url.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/dictionary_controller.dart';
import '../Models/dictioary_list_model.dart';
import '../Widgets/item_online_widget.dart';

class OnlineComponent extends StatefulWidget {
  final List<LineDictionary> lineDictionary;
  const OnlineComponent({Key? key,required this.lineDictionary}) : super(key: key);

  @override
  State<OnlineComponent> createState() => _OnlineComponentState();
}

class _OnlineComponentState extends State<OnlineComponent> {
  bool play = false;
  TextToSpeech tts = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    var dictionaryController =Get.put(DictionaryController());
    String text = "Hello, Good Morning!";
    return Obx(() => Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: ColorsApp.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Directionality(textDirection: TextDirection.rtl,
                child: Container(
                  height: 50,
                  width: SizeConfig.screenWidth,
                  decoration: const BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(10)),
                    color: ColorsApp.backTextField,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  margin: const EdgeInsets.only(top: 10,right: 30,left: 30),
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
                    hint:  const Text(
                      'انتخاب دیکشنری',
                      style: TextStyle(fontSize: 13,fontFamily: "IranSANS",
                        color: ColorsApp.colorTextNormal,fontWeight: FontWeight.w500,
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color:  ColorsApp.colorTextNormal,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 30),
                    dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorsApp.white
                    ),
                    items: widget.lineDictionary
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item.title,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              item.title,
                              style: const TextStyle(color: ColorsApp.colorTextNormal,fontWeight: FontWeight.normal,
                                  fontSize: 14,fontFamily: "IranSANS"
                              ),textDirection: TextDirection.rtl,
                            ),
                          ),
                        ))
                        .toList(),
                    validator: (value) {
                      print(value);
                      if (value == null) {
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                      dictionaryController.getIdList(value.toString());
                      print(value);
                    },
                    onSaved: (value) {
                      //consultController. selectedValue.value = value.toString();
                      print(value);
                    },
                  ),
                ),),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [

                    Padding(
                      padding:  const EdgeInsets.only(top: 0,left: 0,right: 20),
                      child: Center(
                        child: ElevatedButton(

                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all( Size(50, 45)),
                              foregroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                              backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color:ColorsApp.white)
                                  )
                              )
                          ),

                          onPressed: () {

                            if(dictionaryController.controllerTranslate.text!=""){
                              dictionaryController.dictionary(dictionaryController.controllerTranslate.text, context);
                            }else{
                              ShowSnackBar().showSnackBar(
                                context,
                                "متنی تایپ نکرده اید",duration: const Duration(seconds: 5),
                              );
                            }

                          },
                          child: Icon(Icons.search,color: ColorsApp.white,),),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                        },
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                        controller:dictionaryController.controllerTranslate,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                        ),
                        decoration: InputDecoration(
                          fillColor: const Color(0xffF9F9F9),
                          filled: true,
                          counterText: "",
                          contentPadding:
                          const EdgeInsets.only(left: 16, right: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color(0xffF9F9F9),
                              width: 0.7,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffF9F9F9),
                              width: 0.7,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffF9F9F9),
                              width: 0.7,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: "... متن",
                          hintStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                              color: ColorsApp.colorTextNormal,
                              fontFamily: 'IRANSans'),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),

              dictionaryController.isLoadingTranslat.value?  Padding(
                padding: const EdgeInsets.only(right: 40,left: 30,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding:  const EdgeInsets.only(top: 0,left: 0,right: 20),
                      child: Center(
                        child: ElevatedButton(

                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all( Size(50, 45)),
                              foregroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                              backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color:ColorsApp.white)
                                  )
                              )
                          ),

                          onPressed: () {

                           setState(() {
                             tts.speak(text);
                           });
                            ShowSnackBar().showSnackBar(
                              context,
                              "به فلش کارت اضافه شد",duration: const Duration(seconds: 5),
                            );

                          },
                          child:  Text(
                            "اضافه کردن به فلش کارت",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: "IranSANS",
                              color: ColorsApp.white ),
                          ),),
                      ),
                    ),
                    Text(
                      dictionaryController.controllerTranslate.text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "IranSANS",
                        color: ColorsApp.black.withOpacity(0.8)),
                    ),
                  ],

                ),
              ):const SizedBox(),

             const SizedBox(height: 10,),
              dictionaryController.isLoadingTranslat.value?   Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    children: [
                      TextButton(onPressed: (){
                        dictionaryController.changeTabIndex(false);
                      }, child:  Text(
                        "لانگمن",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "IranSANS",
                            color:dictionaryController.tabIndex.value? ColorsApp.black.withOpacity(0.5) :ColorsApp.primary,),
                      ),),
                      Container(
                        color:dictionaryController.tabIndex.value? ColorsApp.black.withOpacity(0.5) :ColorsApp.primary,
                        height: 1,
                        width: 100,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(onPressed: (){
                        dictionaryController.changeTabIndex(true);
                      }, child:  Text(
                        "ترجمه",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "IranSANS",
                          color:dictionaryController.tabIndex.value?  ColorsApp.primary:ColorsApp.black.withOpacity(0.5),),
                      ),),
                      Container(
                        color:dictionaryController.tabIndex.value?  ColorsApp.primary:ColorsApp.black.withOpacity(0.5),
                        height: 1,
                        width: 100,
                      )
                    ],
                  ),
                ],
              ) :const SizedBox(),


              dictionaryController.tabIndex.value?
              dictionaryController.isLoadingTranslat.value? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                 child:   dictionaryController.isLoadingTranslat.value? Column(
                  children: dictionaryController.dictionaryModel!.translates.map((e) => Container(
                     child:ItemOnlineWidget(translate: e,) ,
                 )).toList(),
                 ):const SizedBox(),
              ):const SizedBox():
              dictionaryController.isLoadingTranslat.value? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  height: SizeConfig.screenHeight/1.7,
                  width: SizeConfig.screenWidth/1.1,
                  child:  WebView(
                    initialUrl: '${ServiceURL.baseUrl}${dictionaryController.dictionaryModel!.htmlResult}',
                    javascriptMode: JavascriptMode.unrestricted,

                  ),
                ),
              ):const SizedBox()
              ,
              // Container(
              //   height: 1, width: SizeConfig.screenWidth,
              //   margin: const EdgeInsets.symmetric(horizontal: 30),color: ColorsApp.black.withOpacity(0.5),
              // ),
              //
              // const SizedBox(height: 20,),

              // dictionaryController.isLoadingTranslat.value? Column(
              //   children: dictionaryController.dictionaryModel!.translates.map((e) => Container(
              //     child:ItemOnlineWidget(translate: e,) ,
              //   )).toList(),
              // ):const SizedBox(),

            ],
          ),
        )
    ));
  }
}

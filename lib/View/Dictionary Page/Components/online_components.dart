import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    var dictionaryController =Get.put(DictionaryController());
    return Obx(() => Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: ColorsApp.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
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
              Padding(
                padding:  const EdgeInsets.only(top: 20,left: 0,right: 0),
                child: Center(
                  child: ElevatedButton(

                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/4, 30)),
                        foregroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                        backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color:ColorsApp.primary)
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
                    child: const Text(
                      "جستجو",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                          color: ColorsApp.white),
                      textAlign: TextAlign.center,
                    ),),
                ),
              ),
              dictionaryController.isLoadingTranslat.value? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    dictionaryController.dictionaryModel!.pronounceVoiceUrl!=""? AudioWidget.network(
                      play: play,
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            play = !play;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            "${ConstAddress.image}audio.png",
                            color:play ? ColorsApp.primary: ColorsApp.iconTextField.withOpacity(0.4),
                          ),
                        ),
                      ),
                      onReadyToPlay: (duration) {
                        //onReadyToPlay
                      },
                      onFinished: (){
                        setState(() {
                          play = !play;
                        });
                      },
                      onPositionChanged: (current, duration) {
                        //onPositionChanged
                      },
                      url: dictionaryController.dictionaryModel!.pronounceVoiceUrl,
                    ):const SizedBox(),
                    Text(
                      dictionaryController.dictionaryModel!.pronounceVoiceUrl==""?dictionaryController.texrget.value:"کلمه ای تایپ نشده ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                          color: ColorsApp.black.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              ):const SizedBox(),
              Container(
                height: 1, width: SizeConfig.screenWidth,
                margin: const EdgeInsets.symmetric(horizontal: 30),color: ColorsApp.black.withOpacity(0.5),
              ),

              const SizedBox(height: 20,),

              dictionaryController.isLoadingTranslat.value? Column(
                children: dictionaryController.dictionaryModel!.translates.map((e) => Container(
                  child:ItemOnlineWidget(translate: e,) ,
                )).toList(),
              ):const SizedBox(),

            ],
          ),
        )
    ));
  }
}

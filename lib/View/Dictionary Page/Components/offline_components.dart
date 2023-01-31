import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hi_panda/utils/const.dart';

import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Models/dictioary_list_model.dart';
import '../Widgets/item_offline_widget.dart';

class OfflineComponent extends StatelessWidget {
  final List<LineDictionary> lineDictionary;
  const OfflineComponent({Key? key,required this.lineDictionary}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: ColorsApp.white,
      child: Column(
        children: [

          const SizedBox(height:40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding:const EdgeInsets.all(7),
                  height: 45,width: 45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: ColorsApp.primary
                  ),

                  child: Image.asset("${ConstAddress.image}download2.png",color: ColorsApp.white,),),
              Directionality(textDirection: TextDirection.rtl,
                child: Container(
                  height: 50,
                  width: SizeConfig.screenWidth/1.45,
                  decoration: const BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(10)),
                    color: ColorsApp.backTextField,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  margin: const EdgeInsets.only(top: 0,right: 0,left: 20),
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
                    items: lineDictionary
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
                      // consultController. getIdList(value.toString());
                      print(value);
                    },
                    onSaved: (value) {
                      //consultController. selectedValue.value = value.toString();
                      print(value);
                    },
                  ),
                ),),
            ],
          ),
          
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              onChanged: (value) {
                // if(value.length==11){
                //   setState(() {
                //     phone=true;
                //   });
                // }else{
                //   setState(() {
                //     phone=false;
                //   });
                // }
              },
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
              //controller: controllerPhone,
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
              maxLines: 1,
              keyboardType: TextInputType.phone,maxLength: 11,
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 10,left: 0,right: 0),
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

                },
                child: const Text(
                  "جستجو",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,fontFamily: "robot",
                      color: ColorsApp.white),
                  textAlign: TextAlign.center,
                ),),
            ),
          ),

          ItemOfflineWidget()

        ],
      ),
    );
  }

}


import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Network/service_helper.dart';
import '../../../Repository/flash_card.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/const.dart';
import '../../../utils/dialog.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/res/dimensions.dart';
import '../../../utils/size_config.dart';
import '../Models/get_box_model.dart';
import '../Models/get_flash_card_category_model.dart';
import '../Models/get_flash_card_list_model.dart';
import '../Models/get_keyword_model.dart';
import '../View/detail_box_flash_card_page.dart';
import '../View/details_flash_card_page.dart';

class FlashCardController extends GetxController{
  late final FlashCardRepository _repository;
  var isLoading = true.obs;
  var isCheck = false.obs;
  var isKeyWord = false.obs;
  var isRotate = false.obs;
  var isFinish = false.obs;
  GetFlashCardListModel? getFlashCardListModel;
  GetFlashCardCategoryModel? getFlashCardCategoryModel;
  GetBoxModel? getBoxModel;
  GetKeywordModel? getKeywordModel;
  late final ServiceHelper _helper = ServiceHelper();
  var idUpload=false.obs;
  var empty=false.obs;
  var loadingFile=false.obs;
  var fileId=0.obs;
  var levelNumber=2.obs;
  var box=GetStorage();
  var listPhone = <String>[].obs;
  var listColors = <String>[].obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController title2Controller = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController senseController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var indexId=0.obs;
  var idFlash=0.obs;
  var titleFlash="".obs;
  var loadingBox=false.obs;
  getIdList(String index){
    for(int i=0;i<getFlashCardCategoryModel!.myCategories.length;i++){
      if(getFlashCardCategoryModel!.myCategories[i].title==index){
        indexId.value=getFlashCardCategoryModel!.myCategories[i].id;
        print(indexId.value);
      }
    }
  }
  getChecking(){
    if(isCheck.value)
    {
      isCheck.value=false;}
    else{
      listPhone.clear();
      isCheck.value=true;}}
  File? file;
  File? file2;
  @override
  void onInit() {
    _repository = FlashCardRepository();
    super.onInit();
    getFlashCardList();
    listColors.addAll(["0xffFF4500","0xff3CB371","0xff6F21A6","0xff4ED8A5","0xff014F04","0xff106757","0xffd10686"]);
  }

  getLoadingFile(bool loading){
    loadingFile.value=loading;

  }


  addPhoneNumber(){
    listPhone.add(phoneController.text);
    phoneController.text="";

  }
  getEmpty(bool loading){
    empty.value=loading;

  }

  levelIndex(int level){
    levelNumber.value=level;

  }
  late OverlayEntry overlayEntry;
  showProgress(BuildContext context){
    overlayEntry = OverlayEntry(builder: (c) {
      return const FunkyOverlay();
    });
    Overlay.of(context)!.insert(overlayEntry);
  }

  removeProgress(){
    overlayEntry.remove();
  }

  getFlashCardList() async {
    isLoading.value=false;
    await _repository.getFlashCardList().then((value) {
      try {
        isLoading.value=true;

          getFlashCardListModel=value;
      } catch (e) {

        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);

    });
  }

  getFlashCardCategory(BuildContext context,String title) async {
    showProgress(context);
    await _repository.getFlashCardCategory().then((value) {
      try {
        removeProgress();
          getFlashCardCategoryModel=value;
        title2Controller.text=title;
        showCupertinoModalBottomSheet(
            expand: false,
            context: context,
            useRootNavigator: true,
            backgroundColor: ColorsApp.white,
            builder: (BuildContext context) =>

                Obx(() => Material(
                    color: ColorsApp.white,
                    child: SafeArea(
                      top: false,
                      child: SizedBox(
                        height:SizeConfig.screenHeight,
                        width:SizeConfig.screenWidth,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 15,top: 10),
                              width: 80,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                            ),
                            Directionality(textDirection: TextDirection.rtl,
                              child: Container(
                                height: 50,
                                width: SizeConfig.screenWidth,
                                decoration: const BoxDecoration(
                                  borderRadius:BorderRadius.all(Radius.circular(10)),
                                  color: ColorsApp.backTextField,
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                margin: const EdgeInsets.only(top: 20,right: 40,left: 40,bottom: 5),
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
                                    'انتخاب فلش کارت',
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
                                  items: getFlashCardCategoryModel!.myCategories
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
                                    getIdList(value.toString());
                                    print(value);
                                  },
                                  onSaved: (value) {
                                    //consultController. selectedValue.value = value.toString();
                                    print(value);
                                  },
                                ),
                              ),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
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
                                controller: title2Controller,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                ),
                                decoration: InputDecoration(
                                  fillColor:  ColorsApp.textColorSub,
                                  filled: true,
                                  // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
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
                                  hintText: "عنوان کلمه",
                                  hintStyle: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      color: ColorsApp.colorTextNormal,
                                      fontFamily: 'IRANSans'),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),

                            SizedBox(
                              width:SizeConfig.screenWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:SizeConfig.screenWidth,
                                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
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
                                      controller: textController,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                      ),
                                      decoration: InputDecoration(
                                        fillColor:  ColorsApp.textColorSub,
                                        filled: true,
                                        // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
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
                                        hintText: "معنی کلمه",
                                        hintStyle: const TextStyle(
                                            fontSize: 14.0,
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

                            SizedBox(
                              width:SizeConfig.screenWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:SizeConfig.screenWidth,
                                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
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
                                      controller: senseController,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                      ),
                                      decoration: InputDecoration(
                                        fillColor:  ColorsApp.textColorSub,
                                        filled: true,
                                        // suffixIcon:const Icon(Icons.phone_android,color: ColorsApp.iconTextField,),
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
                                        hintText: "جمله",
                                        hintStyle: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            color: ColorsApp.colorTextNormal,
                                            fontFamily: 'IRANSans'),
                                      ),
                                      keyboardType: TextInputType.text,maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  GestureDetector(

                                    child: SvgPicture.asset(ConstAddress.icon+"image3.svg",height: 40,width: 40,color: ColorsApp.iconTextField,),
                                    onTap: ()async{
                                      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                                      if (result != null) {
                                        file =
                                            File(result.files.single.path!);
                                       getLoadingFile(
                                            true);
                                        if (file !=
                                            null) {
                                         uploadFile(box.read("userId").toString(), context,file,2);
                                          getLoadingFile(

                                              false);
                                        }

                                      }
                                    },
                                  ),
                                  const Text(
                                    "بارگزاری عکس",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                        color: ColorsApp.colorTextNormal),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            empty.value?  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "فیلدها را تکمیل کنید",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                      color: ColorsApp.red),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ):const SizedBox(),
                            Padding(
                              padding:  const EdgeInsets.only(top: 20,left: 40,right: 40),
                              child: Center(
                                child: ElevatedButton(

                                  style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
                                      foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                      backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                              side: const BorderSide(color:ColorsApp.primary)
                                          )
                                      )
                                  ),

                                  onPressed: () {
                                    if(indexId.value!=0){
                                      getEmpty(false);
                                      if(title2Controller.text!=""&&textController.text!=""){
                                        addItemToFlashCard(indexId.value, title2Controller.text,
                                            textController.text, fileId.value.toString(), senseController.text, context,false);
                                      }
                                      getEmpty(true);
                                    }else{
                                      ShowSnackBar().showSnackBar(
                                        context,
                                        "فلش کارت را انتخاب کنید",duration: const Duration(seconds: 5),
                                      );
                                    }

                                  },
                                  child: const Text(
                                    "ثبت کلمه جدید",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                        color: ColorsApp.white),
                                    textAlign: TextAlign.center,
                                  ),),
                              ),
                            ),
                            const Divider(height: 24.0,color: Colors.transparent,),

                          ],
                        ),
                      ),
                    ))));
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);
      removeProgress();
    });
  }


  addItemToFlashCardCategory(String title,String imageId,int level,BuildContext context) async {
    showProgress( context);
    isLoading.value=false;
    await _repository.addItemToFlashCardCategory(title,imageId,level).then((value) {
      try {
        isLoading.value=true;
        titleController.text="";
        Navigator.pop(context);
        removeProgress();
        getFlashCardList();

      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);
      removeProgress();

    });
  }

  uploadFile(String useId,BuildContext context,File? file,int type) async {
    showProgress(context);
    idUpload.value=false;
    await _helper.imageProfile("MainApp/FileUpload",
        file: file,keyName: "fileUpload",
        data: {"url":useId,}).then((value) {

      try {
        print(value!["fileId"]);
        fileId.value=value["fileId"];
        removeProgress();
        idUpload.value=true;
      } catch (e) {
        idUpload.value=false;
        removeProgress();
        // ShowSnackBar().showSnackBar(
        //   context,
        //   e.toString(),duration: const Duration(seconds: 5),
        // );
      }
    }).catchError((value) {
      idUpload.value=false;
      print(value);
      removeProgress();
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }

  getBox(int flashCardCategory,BuildContext context,String title) async {
    showProgress( context);
    idFlash.value=flashCardCategory;
    titleFlash.value=title;
    loadingBox.value=false;
    await _repository.getBox(flashCardCategory).then((value) {
      try {
        removeProgress();
        loadingBox.value=true;
        getBoxModel=value;
        //Get.to(()=>  DetailsFlashCardPage(title: title, id: flashCardCategory,));
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsFlashCardPage(title: title, id: flashCardCategory,)));
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
          loadingBox.value=false;
        }
      }
    }).catchError((value) {
      print(value);
      loadingBox.value=false;

    });
  }

  getBox2(int flashCardCategory,BuildContext context,String title) async {
    showProgress( context);
    loadingBox.value=false;
    idFlash.value=flashCardCategory;
    titleFlash.value=title;
    await _repository.getBox(flashCardCategory).then((value) {
      try {
        removeProgress();
        getBoxModel=value;
        //Get.to(()=>  DetailsFlashCardPage(title: title, id: flashCardCategory,));
        Navigator.pop(context);
        loadingBox.value=true;
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
          loadingBox.value=false;
        }
      }
    }).catchError((value) {
      print(value);
      loadingBox.value=false;

    });
  }

  addItemToFlashCard(int flashCardCategory,String keyword,String text,String photoId,String sentence,BuildContext context,bool isGetBox) async {
    showProgress( context);
    await _repository.addItemToFlashCard(flashCardCategory, keyword, text, photoId, sentence).then((value) {
      try {
        removeProgress();
        isGetBox? getBox2(idFlash.value, context,titleFlash.value):
        ShowSnackBar().showSnackBar(
          context,
          "کلمه جدید ایجاد شد.",duration: const Duration(seconds: 5),
        );
        textController.text="";
        title2Controller.text="";
        senseController.text="";
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);
      removeProgress();

    });
  }


  sendToMyFried(int flashCardCategory,bool general, List<String> phoneNumbers,BuildContext context) async {
    showProgress( context);
    await _repository.sendToMyFriend(flashCardCategory, general,phoneNumbers).then((value) {
      try {
        removeProgress();
        Navigator.pop(context);
        ShowSnackBar().showSnackBar(
          context,
          "ارسال با موفقیت انجام شد",duration: const Duration(seconds: 5),
        );
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);
      removeProgress();

    });
  }

  getKeyWord(int flashCardCategory,BuildContext context,int box,int lastId,String title,bool next,bool prev) async {
    showProgress( context);
    isKeyWord.value=false;
    await _repository.getKeyword(flashCardCategory,box,lastId).then((value) {
      try {
        isFinish.value=value.finish;
        isRotate.value=value.rotate;
        getKeywordModel=value;
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBoxFlashCardPage(title: title, box: box, flashCardCategory: flashCardCategory,next: next,prev: prev, )));
        //Get.to(()=>  DetailBoxFlashCardPage(title: title, box: box, flashCardCategory: flashCardCategory,next: next,prev: prev, ));
        // ShowSnackBar().showSnackBar(
        //     context,
        //     "به پایان رسید",duration: const Duration(seconds: 5),
        //   );
        isKeyWord.value=true;
        removeProgress();
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
        isKeyWord.value=false;
      }
    }).catchError((value) {
      print(value);
      isKeyWord.value=false;
      removeProgress();

    });
  }

  getKeyWord2(int flashCardCategory,BuildContext context,int box,int lastId,String title,bool next,bool prev) async {
    showProgress( context);
    isKeyWord.value=false;
    await _repository.getKeyword(flashCardCategory,box,lastId).then((value) {
      try {
        isFinish.value=value.finish;
        isRotate.value=value.rotate;
        getKeywordModel=value;
        //Get.to(()=>  DetailBoxFlashCardPage(title: title, box: box, flashCardCategory: flashCardCategory,next: next,prev: prev, ));
        if( isFinish.value){
          ShowSnackBar().showSnackBar(
            context,
            "به پایان رسید",duration: const Duration(seconds: 5),
          );
        }

        isKeyWord.value=true;
        removeProgress();
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
        isKeyWord.value=false;
      }
    }).catchError((value) {
      print(value);
      isKeyWord.value=false;
      removeProgress();

    });
  }

  keyWordSendToBox(int flashCardKeyword,int box,BuildContext context,int flashCardCategory,String title,int currentBox) async {
    showProgress( context);
    await _repository.keywordSendToOtherBox(flashCardKeyword, box).then((value) {
      try {
        removeProgress();
        ShowSnackBar().showSnackBar(
          context,
          "ارسال با موفقیت انجام شد",duration: const Duration(seconds: 5),
        );
       getKeyWord2(flashCardCategory, context, currentBox, flashCardKeyword,
            title,true,true);
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);
      removeProgress();

    });
  }

  addGeneralToMyFlashCard(int flashCardCategory,BuildContext context) async {
    showProgress( context);
    await _repository.addGeneralToMyFlashCard(flashCardCategory).then((value) {
      try {
        removeProgress();
        ShowSnackBar().showSnackBar(
          context,
          value.message,duration: const Duration(seconds: 5),
        );
        getFlashCardList();
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);
      removeProgress();

    });
  }

}
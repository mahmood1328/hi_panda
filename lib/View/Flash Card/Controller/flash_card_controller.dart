
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Network/service_helper.dart';
import '../../../Repository/flash_card.dart';
import '../../../Repository/login.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../Verify/Page/verify_screen.dart';
import '../Models/get_box_model.dart';
import '../Models/get_flash_card_list_model.dart';
import '../Models/get_keyword_model.dart';
import '../View/detail_box_flash_card_page.dart';
import '../View/details_flash_card_page.dart';

class FlashCardController extends GetxController{
  late final FlashCardRepository _repository;
  var isLoading = true.obs;
  var isCheck = false.obs;
  var isKeyWord = false.obs;
  var isFinish = false.obs;
  GetFlashCardListModel? getFlashCardListModel;
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
    listColors.addAll(["0xfff6f916","0xffBBDD56","0xff6F21A6","0xff4ED8A5","0xff014F04","0xff106757","0xffd10686"]);
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
    idUpload.value=true;
    await _helper.imageProfile("MainApp/FileUpload",
        file: file,keyName: "fileUpload",
        data: {"url":useId,}).then((value) {

      try {
        print(value!["fileId"]);
        fileId.value=value["fileId"];

        idUpload.value=false;
      } catch (e) {
        // ShowSnackBar().showSnackBar(
        //   context,
        //   e.toString(),duration: const Duration(seconds: 5),
        // );
      }
    }).catchError((value) {
      print(value);
      ShowSnackBar().showSnackBar(
        context,
        value.toString(),duration: const Duration(seconds: 5),
      );
    });
  }

  getBox(int flashCardCategory,BuildContext context,String title) async {
    showProgress( context);
    await _repository.getBox(flashCardCategory).then((value) {
      try {
        removeProgress();
        getBoxModel=value;
        Get.to(()=>  DetailsFlashCardPage(title: title, id: flashCardCategory,));
      } catch (e) {
        removeProgress();
        if (kDebugMode) {
          print(e);
        }
      }
    }).catchError((value) {
      print(value);

    });
  }

  addItemToFlashCard(int flashCardCategory,String keyword,String text,String photoId,String sentence,BuildContext context) async {
    showProgress( context);
    await _repository.addItemToFlashCard(flashCardCategory, keyword, text, photoId, sentence).then((value) {
      try {
        removeProgress();
        Navigator.pop(context);
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
        getKeywordModel=value;
        Get.to(()=>  DetailBoxFlashCardPage(title: title, box: box, flashCardCategory: flashCardCategory,next: next,prev: prev, ));
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

    });
  }

  keyWordSendToBox(int flashCardKeyword,int box,BuildContext context,int flashCardCategory,String title) async {
    showProgress( context);
    await _repository.keywordSendToOtherBox(flashCardKeyword, box).then((value) {
      try {
        removeProgress();
        ShowSnackBar().showSnackBar(
          context,
          "ارسال با موفقیت انجام شد",duration: const Duration(seconds: 5),
        );
       getKeyWord(flashCardCategory, context, box, flashCardKeyword,
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

}
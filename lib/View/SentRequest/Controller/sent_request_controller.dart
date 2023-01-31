
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Repository/cansult_app.dart';
import '../../../utils/dialog.dart';
import '../Model/consult_page_model.dart';
import '../Model/register_new_consult_model.dart';
import '../Page/respons_page.dart';

class SentRequestController extends GetxController{
  final box = GetStorage();
  late final ConsultRepository _repository;
  ConsultPageModel? consultPageModel;
  RegisterConsultModel? registerConsultModel;
  var isLoading=false.obs;
  var registerNew=false.obs;
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();

  @override
  void onInit() {
    _repository = ConsultRepository();
    super.onInit();
    consultPage();
    controllerName.text=box.read("name");
    controllerPhone.text=box.read("phone");
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


  consultPage() async {
    isLoading.value=false;
    await _repository.consultPage().then((value) {
      try {
        if(value!=""){
          consultPageModel=value;
          isLoading.value=true;
          controllerName.text=box.read("name");
          controllerPhone.text=box.read("phone");
        }

      } catch (e) {
        print(e.toString());
      }
    }).catchError((value) {
      //print(value);
      print(value.toString());
    });
  }


  registerNewConsult(String name,String phoneNumber,BuildContext context) async {
    registerNew.value=false;
    showProgress( context);
    await _repository.registerNewConsult(name, phoneNumber).then((value) {
      try {
        if(value!=""){
          registerConsultModel=value;
          removeProgress();
          registerNew.value=true;

        }

      } catch (e) {
        print(e.toString());
        removeProgress();
        registerNew.value=false;
      }
    }).catchError((value) {
      //print(value);
      print(value.toString());
      removeProgress();
      registerNew.value=false;
    });
  }
}
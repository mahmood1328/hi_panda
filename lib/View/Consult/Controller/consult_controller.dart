
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/Request/pay_factory_req_model.dart';
import '../../../Models/Responses/consult_filter_model.dart';
import '../../../Models/Responses/consult_info_model.dart';
import '../../../Models/Responses/consult_model.dart';
import '../../../Models/Responses/factory_info_model.dart';
import '../../../Models/Responses/factory_model.dart';
import '../../../Repository/cansult_app.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../Chat/Model/consult_operation_model.dart';
import '../Page/consult_detail_page.dart';
import '../Page/factory_detail_page.dart';

class ConsultController extends GetxController{
  late final ConsultRepository _repository;
  var isLoading = true.obs;
  var isLoadingImage = false.obs;
  var selectedValueConsult="".obs;
  var selectedValueLink=0.obs;
  var selectOperation=0.obs;
  var selectedValueInsta=0.obs;
  var linkId=-1.obs;
  var randomTrackingCode=Random().obs;
  var valueOperation="".obs;
  var valueResult="".obs;
  var indexValuePage=1.obs;
  var indexId=0.obs;
  var showFilter=2.obs;
  var chatFilter=2.obs;
  var buyFilter=2.obs;
  var callFilter=2.obs;
  File? file;
  var base64Image1="".obs;
  var base64Image2="".obs;
  var base64Image3="".obs;
  var pays=<Pay>[].obs;
  FactoryModel? factoryModel;
  var requestFactoryList=<Factor>[].obs;
  var listImage=<File>[].obs;
  var listImageUploadFactory=<File>[].obs;
  var rate = 0.0.obs;
  late ScrollController scrollController;

  getShowFilter(int index){
    showFilter.value=index;
  }

  getResult(String index){
    valueResult.value=index;
  }

  getChatFilter(int index){
    chatFilter.value=index;
  }

  getBuyFilter(int index){
    buyFilter.value=index;
  }

  getCallFilter(int index){
    callFilter.value=index;
  }

  getFileImage(bool index){
    isLoadingImage.value=index;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    removeProgress();
  }
  getRate(double rateIndex){
    rate.value=rateIndex;
  }
//{
//         View = 1,
//         Call = 2,
//         Chat = 3,
//         Comment = 4,
//         Percent = 5,
//         Result = 6
//     }
  List<ConsultOperationModel> operation=[
    ConsultOperationModel(id: 2, name: 'ثبت تماس'),
    ConsultOperationModel(id: 3, name: 'ثبت چت'),
    ConsultOperationModel(id: 4, name: 'ثبت کامنت'),
    ConsultOperationModel(id: 5, name: 'درصد خرید'),
    ConsultOperationModel(id: 6, name: 'نتیجه مذاکره'),
  ];
  final TextEditingController controllerPrice = TextEditingController();
  final TextEditingController controllerText = TextEditingController();
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerMobile = TextEditingController();
  final TextEditingController controllerInfo = TextEditingController();
  final TextEditingController controllerNameReg = TextEditingController();
  final TextEditingController controllerInstaReg = TextEditingController();
  final TextEditingController controllerMobileReg = TextEditingController();
  final TextEditingController controllerInfoReg = TextEditingController();
  final TextEditingController controllerSearch = TextEditingController();
  final TextEditingController controllerPricePay = TextEditingController();
  final TextEditingController controllerTrackingCodePay = TextEditingController();
  final TextEditingController controllerDatePay = TextEditingController();
  var indexValuePageDetail=1.obs;
  var requestList=<Request>[].obs;
  var listSplits=<String>[].obs;
  ConsultModel? consultModel;
  ConsultInfoModel? consultInfoModel;
  FactoryInfoModel? factoryInfoModel;
  ConsultFilterModel? consultFilterModelAdd;
  ConsultFilterModel? consultFilterModel;
  getIndexPage(int index){
    indexValuePage.value=index;
  }
  getIndexPageDetail(int index){
    indexValuePageDetail.value=index;
  }

  getIdList(String index){
    listSplits.clear();
    listSplits.add(consultInfoModel!.courseSplits[0].name);
    for(int i=0;i<consultInfoModel!.consultCourses.length;i++){
      if(consultInfoModel!.consultCourses[i].name==index){
        indexId.value=consultInfoModel!.consultCourses[i].id;
        controllerPrice.text=consultInfoModel!.consultCourses[i].price.toString();
        print(indexId.value);
      }
    }
    for(int i=0;i<consultInfoModel!.courseSplits.length;i++){
      if(consultInfoModel!.courseSplits[i].courseId==indexId.value){
        listSplits.add(consultInfoModel!.courseSplits[i].name);
        print(listSplits.length);
      }
    }

  }

  getInsta(String index){
    for(int i=0;i<consultInfoModel!.courseSplits.length;i++){
      if(consultInfoModel!.courseSplits[i].name==index){
        selectedValueInsta.value=consultInfoModel!.courseSplits[i].id;
        print(selectedValueInsta.value);
      }
    }
  }

  getLinkId(String index){
    for(int i=0;i<consultFilterModel!.siteLinks.length;i++){
      if(consultFilterModel!.siteLinks[i].name==index){
        linkId=consultFilterModel!.siteLinks[i].id;

      }
    }
  }
  getLink(String index){
    for(int i=0;i<consultInfoModel!.siteLinks.length;i++){
      if(consultInfoModel!.siteLinks[i].name==index){
        selectedValueLink.value=consultInfoModel!.siteLinks[i].id;
        print(selectedValueLink.value);
      }
    }
  }

  getNameOperation(String index){
    valueOperation.value=index;
    for(int i=0;i<operation.length;i++){
      if(operation[i].name==index){
        selectOperation.value=operation[i].id;
        print(selectOperation.value);
      }
    }
  }
  void scrollToBottom() {
    final bottomOffset = scrollController.position.minScrollExtent;
    scrollController.animateTo(
      bottomOffset,
      duration: Duration(milliseconds: 1000),
      curve: Curves.linearToEaseOut,
    );
  }

  @override
  void onInit() {
    _repository = ConsultRepository();
    super.onInit();
    consultList(pager.value,10,showFilter.value,callFilter.value,chatFilter.value,buyFilter.value,-1,"");
    factoryList(1,10,"");
    scrollController = ScrollController();
    consultAddLink();
    consultFilter();
  }
  var hasPage=false.obs;
  var hasPageFactory=false.obs;
  var pager=1.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {

        if(hasPage.value==false&&hasPageFactory.value==false){
          return;
        }else{
          isLoading.value=true;
          pager.value+=1;
          if(indexValuePage.value==1&&hasPage.value){
            consultList(pager.value,10,showFilter.value,callFilter.value,chatFilter.value,buyFilter.value,0,"");
          }else if(indexValuePage.value==2&&hasPageFactory.value){
            factoryList(pager.value,10,"");
          }

        }

      }
      // if (scrollController.offset <= scrollController.position.minScrollExtent &&
      //     !scrollController.position.allowImplicitScrolling) {
      //   isLoading.value=true;
      //   consultList(1,10,showFilter.value,
      //       callFilter.value,chatFilter.value,
      //       buyFilter.value,-1,controllerSearch.text);
      // }
    });
  }
  Future fetchFruit() async {
    requestList.clear();
    pager.value=1;
   await consultList(pager.value,10,showFilter.value,
        callFilter.value,chatFilter.value,
        buyFilter.value,-1,controllerSearch.text);
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

  consultList(int page,pageSize,view,call,chat,buy,linkId,String search) async {

    isLoadingImage.value=true;
    await _repository.consult(page,pageSize,search,view,call,chat,buy,linkId).then((value) {

      try {
        if(value!=null){
          consultModel=value;
          requestList.addAll(consultModel!.requests);
          hasPage.value=value.hasNextPage;
          isLoadingImage.value=false;
          requestList.refresh();
        }else{

        }

      } catch (e) {
        print(e);
        isLoadingImage.value=false;
      }
    }).catchError((value) {
      print(value);
      isLoadingImage.value=false;

    });
  }


  factoryList(int page,pageSize,String search) async {

    isLoadingImage.value=true;
    await _repository.factory(page,pageSize,search).then((value) {

      try {
        if(value!=null){
          factoryModel=value;
          requestFactoryList.addAll(factoryModel!.factors);
          isLoadingImage.value=false;
          hasPageFactory.value=value.hasNextPage;
        }else{

        }

      } catch (e) {
        print(e);
      }
    }).catchError((value) {
      print(value);

    });
  }


  registerNewConsult(int linkId,BuildContext context) async {
    if(controllerNameReg.text==""&&controllerInstaReg.text==""&&controllerMobileReg.text==""&&controllerInfoReg.text==""){
      ShowSnackBar().showSnackBar(
        context,
        "فیلد ها را تکمیل کنید",duration: const Duration(seconds: 5),
      );
    }else{
      requestList.clear();
      showProgress(context);
      await _repository.registerNewConsultWithSup(controllerNameReg.text, controllerInstaReg.text, controllerMobileReg.text,
          controllerInfoReg.text, linkId).then((value) {

        try {
          if(value.message!=""){
            removeProgress();
            ShowSnackBar().showSnackBar(
              context,
              "درخواست جدید ثبت شد",duration: const Duration(seconds: 5),
            );
            controllerNameReg.text="";
            controllerInstaReg.text="";
            controllerMobileReg.text="";
            controllerInfoReg.text="";
            consultList(1,10,showFilter.value,callFilter.value,chatFilter.value,buyFilter.value,0,"");

          }else{

          }

        } catch (e) {
          print(e);
          removeProgress();
        }
      }).catchError((value) {
        print(value);
        removeProgress();

      });
    }

  }


  addCourseConsult(int id,BuildContext context) async {
    showProgress(context);
    await _repository.addCourseConsult(id,  indexId.value, controllerText.text, base64Image1.value,
        base64Image2.value, base64Image3.value,
        controllerText.text, selectedValueInsta.value, selectedValueLink.value, int.parse(controllerPrice.text)).then((value) {

      try {
        if(value!=null){
          controllerText.text="";
          listImage.clear();
          removeProgress();
          base64Image1.value=="";
          base64Image2.value=="";
          base64Image3.value=="";
        }else{

        }

      } catch (e) {
        print(e);
        removeProgress();
      }
    }).catchError((value) {
      print(value);
      removeProgress();

    });
  }

  changeDetailConsult(int id,String phone,String name,BuildContext context) async {
    if(controllerMobile.text==""&& controllerUsername.text==""){
      ShowSnackBar().showSnackBar(
        context,
        "فیلد ها را تکمیل کنید",duration: const Duration(seconds: 5),
      );
    }else{
      showProgress( context);
      await _repository.changeDetailUserConsult(id,phone,name).then((value) {
        try {
          if(value.message!=null){
            controllerMobile.text="";
            controllerUsername.text="";
            removeProgress();
          }else{

          }

        } catch (e) {
          print(e);
          removeProgress();
        }
      }).catchError((value) {
        print(value);
        removeProgress();

      });
    }

  }


  consultOperation(int id,int type,int rate,String consultResult,text,BuildContext context) async {

    showProgress( context);
    await _repository.consultOperation(id,type,rate,consultResult,text).then((value) {
      try {
        if(value.message!=null){
          removeProgress();
          controllerInfo.text="";
        }else{
        }
      } catch (e) {
        print(e);
        removeProgress();
      }
    }).catchError((value) {
      print(value);
      removeProgress();

    });
  }


  consultInfo(int id,BuildContext context) async {
    listSplits.clear();
    showProgress( context);
    await _repository.consultInfo(id).then((value) {
      if (value != null) {
        consultInfoModel = value;
        listSplits.add(consultInfoModel!.courseSplits[0].name);
        Get.to(() => ConsultDetailPage(id: id,));
        removeProgress();
      } else {
        removeProgress();
      }
    });
  }


  factoryInfo(int id,BuildContext context) async {
    showProgress( context);
    await _repository.factoryInfo(id).then((value) {
      if (value != null) {
        factoryInfoModel = value;
        Get.to(() => FactoryDetailPage());
        removeProgress();
      } else {
        removeProgress();
      }
    });
  }


  consultAddLink() async {
    await _repository.consultAddLink().then((value) {
      if (value != null) {
        consultFilterModelAdd = value;
      } else {
      }
    });
  }


  consultFilter() async {
    await _repository.consultFilter().then((value) {
      if (value != null) {
        consultFilterModel = value;
      } else {
      }
    });
  }

  payFactory(BuildContext context,int id) async {
    showProgress(context);
    await _repository.payFactory(RequestPayFactoryModel(id: id, pays:pays)).then((value) {

      try {
        if(value!=null){
          controllerPricePay.text="";
          controllerDatePay.text="";
          controllerTrackingCodePay.text="";
          pays.clear();
          removeProgress();
          ShowSnackBar().showSnackBar(
            context,
            "ثبت فاکتور با موفقیت انجام شد",duration: const Duration(seconds: 5),
          );
          base64Image1.value=="";
          base64Image2.value=="";
          base64Image3.value=="";
          factoryInfo(id,context);
        }else{

        }

      } catch (e) {
        print(e);
        removeProgress();
        pays.clear();
      }
    }).catchError((value) {
      print(value);
      removeProgress();
      pays.clear();

    });
  }

}
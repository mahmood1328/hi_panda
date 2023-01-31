
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Models/banner.dart';
import '../../../Repository/blog.dart';
import '../../../Repository/notification.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../Model/notification_list_model.dart';
import '../View/notification_page.dart';


class NotificationController extends GetxController{
  final box = GetStorage();
  late final NotificationRepository _repository;
  late ScrollController scrollController;
  GetNotificationModel? getNotificationModel;

  var loading=false.obs;
  final TextEditingController controllerComment = TextEditingController();
  final TextEditingController controllerSearch = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    _repository = NotificationRepository();
    scrollController = ScrollController();
  }
  var hasPage=false.obs;
  var hasPageFactory=false.obs;
  var pager=1.obs;
  var isLoading = true.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // scrollController.addListener(() {
    //   if (scrollController.offset >= scrollController.position.maxScrollExtent &&
    //       !scrollController.position.outOfRange) {
    //
    //     if(hasPage.value==false&&hasPageFactory.value==false){
    //       return;
    //     }else{
    //       isLoading.value=true;
    //       pager.value+=1;
    //       if(hasPage.value){
    //         listPosts(pager.value,10,"");
    //       }else if(hasPageFactory.value){
    //
    //       }
    //
    //     }
    //
    //   }
    //   // if (scrollController.offset <= scrollController.position.minScrollExtent &&
    //   //     !scrollController.position.allowImplicitScrolling) {
    //   //   isLoading.value=true;
    //   //   consultList(1,10,showFilter.value,
    //   //       callFilter.value,chatFilter.value,
    //   //       buyFilter.value,-1,controllerSearch.text);
    //   // }
    // });
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


  notificationList(BuildContext context,int page,int pageSize,String search,int viewFilter) async {
    showProgress(context);
    await _repository.getMyNotification(page,pageSize,search,viewFilter).then((value) {
      try {
          removeProgress();
          getNotificationModel=value;
          Get.to(()=>NotificationPage());

      } catch (e) {
        removeProgress();
        ShowSnackBar().showSnackBar(
          context,
          "خطا در دریافت اطلاعات",
        );
      }
    }).catchError((value) {
      ShowSnackBar().showSnackBar(
        context,
        "خطا در دریافت اطلاعات",
      );
      removeProgress();
      //print(value);
    });



  }

  addViewNotifi(BuildContext context,int id,) async {
    // showProgress(context);
    await _repository.addViewNotifi(id).then((value) {
      try {
          // removeProgress();

      } catch (e) {
        // removeProgress();
        ShowSnackBar().showSnackBar(
          context,
          "خطا در دریافت اطلاعات",
        );
      }
    }).catchError((value) {
      ShowSnackBar().showSnackBar(
        context,
        "خطا در دریافت اطلاعات",
      );
      // removeProgress();
      //print(value);
    });



  }

}

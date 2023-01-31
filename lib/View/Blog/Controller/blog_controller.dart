
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Models/banner.dart';
import '../../../Repository/authorize.dart';
import '../../../Repository/blog.dart';
import '../../../Repository/login.dart';
import '../../../Widget/snackbar.dart';
import '../../../utils/dialog.dart';
import '../../Login/page/login_screen.dart';
import '../../Main_page/Page/main_page.dart';
import '../../Register/Page/register_screen.dart';
import '../../test_farahi/page/home_test.dart';
import '../Models/list_post_model.dart';

class BlogController extends GetxController{
  final box = GetStorage();
  List<BannerModel>? banners;
  List<BannerModel> test=[];
  late final BlogRepository _repository;
  late ScrollController scrollController;
  var loading=false.obs;
  ListPostsModel? listPostsModel;
  final TextEditingController controllerComment = TextEditingController();
  final TextEditingController controllerSearch = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    _repository = BlogRepository();
    scrollController = ScrollController();
    listPosts(1,10,"");
  }
  var hasPage=false.obs;
  var hasPageFactory=false.obs;
  var pager=1.obs;
  var isLoading = true.obs;
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
          if(hasPage.value){
            listPosts(pager.value,10,"");
          }else if(hasPageFactory.value){

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

  listPosts(int page,int pageSize,String search) async {
    loading.value=false;
    await _repository.listPost(page,pageSize,search).then((value) {
      try {
        if(value!=null){
          loading.value=true;
          print(value.hasNextPage);
          hasPage.value=value.hasNextPage;
          listPostsModel=value;
          controllerSearch.text="";
        }else{
          loading.value=false;
        }
      } catch (e) {
        loading.value=false;
      }
    }).catchError((value) {
      loading.value=false;
      //print(value);
    });



  }
  Future fetchFruit() async {
    pager.value=1;
    await listPosts(pager.value,10,"");
  }
  postOperation(BuildContext context,String id,String text,int type,String typeValue,bool isValue) async {
    showProgress(context);
    await _repository.postOperation(id,text,type).then((value) {
      try {
        if(value.message!=""){
          removeProgress();
          isValue?  ShowSnackBar().showSnackBar(
            context,
            "  $typeValue با موفقیت لغو شد ",
          ):ShowSnackBar().showSnackBar(
            context,
            "  $typeValue با موفقیت انجام شد ",
          );
          controllerComment.text="";
        }else{
          removeProgress();
          ShowSnackBar().showSnackBar(
            context,
            "$typeValue خطا در انجام  ",
          );
        }

      } catch (e) {
        removeProgress();
        ShowSnackBar().showSnackBar(
          context,
          "عدم ذخیره شد",
        );
      }
    }).catchError((value) {
      ShowSnackBar().showSnackBar(
        context,
        "عدم ذخیره شد",
      );
      removeProgress();
      //print(value);
    });



  }

}

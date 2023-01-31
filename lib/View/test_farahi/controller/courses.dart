
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Repository/home.dart';
import '../../../Widget/modal_error.dart';
import '../../../Widget/modal_logout.dart';
import '../../../utils/dialog.dart';
import '../../../utils/res/colors.dart';
import '../Model/courses_detail.dart';
import '../Model/my_courses_model.dart';
import '../page/detail_courses.dart';
import '../page/detail_music.dart';

class CoursesController extends GetxController{
  final box = GetStorage();
  var isLoading=false.obs;
  var isErrorLoading=false.obs;
  var isLoadingDetail=false.obs;
  var index=true.obs;
  var cat=false.obs;
  var title="".obs;
  var token="".obs;
  var idCat=1.obs;
  late final HomeRepository _repository;
  var listMyCourses=<Course>[].obs;
  var listMyCoursesCat=<Course>[].obs;
  var category=<Category>[].obs;
  var listMyCoursesDetail=<Term>[].obs;
  var titleIndex="".obs;
  MyCoursesModel? myCoursesModel;
  MyCoursesDetailModel? myCoursesDetailModel;

getId(int id){
  idCat.value=id;
}

  @override
  void onInit() {
    _repository = HomeRepository();
    super.onInit();
    title.value=box.read("name");
    token.value=box.read("tokenn");


  }

  @override
  void onReady() {
    super.onReady();
    title.value=box.read("name");
    token.value=box.read("tokenn");
  }

  getIndex(bool val){
   index.value=val;
  }

  getIndexVal(bool val){
    isLoadingDetail.value=val;
  }

  changeCategory(){
    listMyCoursesCat.clear();
  for(int i=0;i<listMyCourses.length;i++){
    if(listMyCourses[i].category==idCat.value){
      listMyCoursesCat.add(listMyCourses[i]);
    }
  }
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
  getMyCourses(BuildContext context) async {
    isLoading.value=false;
    isErrorLoading.value=false;
    cat.value=false;
    listMyCourses.clear();
    category.clear();
    await _repository.getMyCourses().then((value) {
      try {
        if(value!="") {
          isLoading.value=true;
          myCoursesModel=value;
          listMyCourses.addAll(value.courses);
          if(myCoursesModel!.categories.isNotEmpty){
            category.addAll(myCoursesModel!.categories);
            cat.value=true;
          }
          if(listMyCourses.isNotEmpty){
            changeCategory();
          }



        }
      } catch (e) {
        isErrorLoading.value=true;
        showCupertinoModalBottomSheet(
            expand: false,
            context: context,
            useRootNavigator: true,
            backgroundColor: ColorsApp.white,
            builder: (BuildContext context) =>

            const ModalError());
      }
    }).catchError((value) {
      isErrorLoading.value=true;
      showCupertinoModalBottomSheet(
          expand: false,
          context: context,
          useRootNavigator: true,
          backgroundColor: ColorsApp.white,
          builder: (BuildContext context) =>

          const ModalError());
      print(value);

    });
  }
  Future fetchFruit(BuildContext context) async {
    getMyCourses(context);
  }

  getMyCoursesDetailV(int id,int pId,int type,BuildContext context,bool isBuy) async {
    isLoadingDetail.value=false;
    listMyCoursesDetail.clear();
    showProgress(context);
    await _repository.getMyCoursesDetail(id,pId,type).then((value) {
      try {
        if(value!="") {
          isLoadingDetail.value=true;
          myCoursesDetailModel=value;
          listMyCoursesDetail.addAll(value.terms);
          titleIndex.value=listMyCoursesDetail[0].title;
          print("${listMyCoursesDetail[0].sessions[0].attachmentUrl}ggggggggggggggggggggggggg");
          Get.to(() => DetailCoursesPage(id: id, isBuy: isBuy,));
          removeProgress();
        }
      } catch (e) {
        removeProgress();

      }
    }).catchError((value) {
      removeProgress();
      //print(value);

    });
  }

  getMyCoursesDetailM(int id,int pId,int type,String image,BuildContext context,bool isBuy) async {
    isLoadingDetail.value=false;
    listMyCoursesDetail.clear();
    showProgress(context);
    await _repository.getMyCoursesDetail(id,pId,type).then((value) {
      try {
        if(value!="") {
          isLoadingDetail.value=true;

          Get.to(() => DetailCoursesMusicPage(id: id, image: image));

          myCoursesDetailModel=value;
          listMyCoursesDetail.addAll(value.terms);
          removeProgress();

        }
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      removeProgress();
      //print(value);

    });
  }
}
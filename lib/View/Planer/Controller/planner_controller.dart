
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Network/service_helper.dart';
import '../../../Repository/planer.dart';
import '../../../Widget/modal_course_audio.dart';
import '../../../Widget/modal_course_book.dart';
import '../../../Widget/modal_course_file.dart';
import '../../../Widget/modal_course_rest.dart';
import '../../../Widget/modal_course_testing.dart';
import '../../../Widget/modal_course_vedio.dart';
import '../../../Widget/snackbar.dart';
import '../../../main.dart';
import '../../../utils/dialog.dart';
import '../../../utils/res/colors.dart';
import '../Components/Specify_level_Components.dart';
import '../Components/courses_details_components.dart';
import '../Models/AnswerQuestionModel.dart';
import '../Models/getLevelQuestionsModel.dart';
import '../Models/getPlannerBasePage_model.dart';
import '../Models/planner_list_model.dart';
import '../Models/planner_session_item_details_model.dart';
import '../Models/planner_session_item_model.dart';
import '../View/planer_details.dart';

class PlannerController extends GetxController{
  final box = GetStorage();
  late final PlanerRepository _repository;
  late final File file;
  late final File file2;
  String token="";
  var isLoading = false.obs;
  var isLoadingCall = true.obs;
  final ServiceHelper _helper;
  PlannerController() : _helper = ServiceHelper();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerSex = TextEditingController();
  final TextEditingController controllerDesc = TextEditingController();
  GetPlannerBasePageModel? getPlannerBasePageModel;
  GetLevelQuestionsModel? getLevelQuestionsModel;
  GetLevelQuestionsModel? getSmartQuestionsModel;
  AnswerQuestionModel? answerQuestionModel;
  PlannerListModel? plannerListModel;
  PlannerSessionItemsModel? plannerSessionItemsModel;
  PlannerSessionItemDetailModel? plannerSessionItemDetailModel;
  var answerModel=<Answer>[].obs;
  var listPlanner=<Planner>[].obs;

  getAnswer(Answer answerQuestionModel){
   if( answerModel.isNotEmpty){
     for(int i=0;i>answerModel.length;i++){
       if(answerModel[i].questionId==answerQuestionModel.questionId){
         answerModel.remove(answerQuestionModel);
         answerModel.add(answerQuestionModel);
       }else{
         answerModel.add(answerQuestionModel);
       }
     }
   }else{
     answerModel.add(answerQuestionModel);
   }
    //print(answerModel.last.title);
  }
  var isUploadImage=false.obs;
  var getImage=true.obs;
  uploadImage(File file) async {
    isUploadImage.value=false;
    isLoadingCall.value=false;
    getImage.value=false;
    //showProgress( context);
    await _helper.imageProfile2("/MainApp/FileUpload",
      file: file,
    ).then((value) {

      try {
          getImage.value=true;
          isUploadImage.value=true;
          isLoadingCall.value=true;
          //removeProgress();

      } catch (e) {
        isUploadImage.value=false;
        getImage.value=false;
        isLoadingCall.value=true;

      }
    }).catchError((value) {
      isLoadingCall.value=true;
      if (kDebugMode) {
        print(value);
      }
      isUploadImage.value=false;
      getImage.value=false;
      isLoadingCall.value=true;
    });
  }

  getIsMyPlanners(bool isPlanner){
    for(int i=0;i<getPlannerBasePageModel!.planners!.length;i++){
      if(getPlannerBasePageModel!.planners![i]!.isMyPlanner!){
        listPlanner.add(getPlannerBasePageModel!.planners![i]!);
      }
    }

  }

  @override
  void onInit() {
    _repository = PlanerRepository();
    token=box.read("tokenn");
    super.onInit();
    getPlanner();
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

  getPlanner() async {
    isLoading.value=false;
    await _repository.getPlannerBasePage().then((value) {

      try {
          isLoading.value=true;
          getPlannerBasePageModel=value;
      } catch (e) {
        isLoading.value=false;
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      isLoading.value=false;
    });
  }



  getLevelQuestion(BuildContext context) async {
    showProgress(context);
    answerModel.clear();
    await _repository.getLevelQuestions().then((value) {
      try {
          getLevelQuestionsModel=value;
          showCupertinoModalBottomSheet(
              expand: false,
              context: context,
              useRootNavigator: true,
              backgroundColor: ColorsApp.white,
              builder: (BuildContext context) =>
                  SpecifyLevelComponents(title: 'تعیین سطح', questionGroup: getLevelQuestionsModel!.questionGroups!, desc: getLevelQuestionsModel!.text!));
          removeProgress();
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }

  getSmartQuestion(BuildContext context) async {
    showProgress(context);
    await _repository.getSmartQuestions().then((value) {
      try {
          getSmartQuestionsModel=value;
          removeProgress();
          showCupertinoModalBottomSheet(
              expand: false,
              context: context,
              useRootNavigator: true,
              backgroundColor: ColorsApp.white,
              builder: (BuildContext context) =>
               SpecifyLevelComponents(title: 'علاقمندی', questionGroup: getSmartQuestionsModel!.questionGroups!, desc: getSmartQuestionsModel!.text!,));
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }


  addLevelQuestion(BuildContext context,List<Answer>? answers,int id) async {
    showProgress(context);
    await _repository.addLevelResult(id,answers).then((value) {
      try {
          removeProgress();
          ShowSnackBar().showSnackBar(
            context,
            value.message,duration: const Duration(seconds: 5),
          );
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }


  plannerItemPartTestResult(BuildContext context,List<Answer>? answers,int id) async {
    showProgress(context);
    await _repository.plannerItemPartTestResult(id,answers).then((value) {
      try {
          removeProgress();
          ShowSnackBar().showSnackBar(
            context,
            value.message,duration: const Duration(seconds: 5),
          );
          Navigator.pop(context);
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }

  addSmartQuestion(BuildContext context,List<AnswerQuestionModel>? answers) async {
    showProgress(context);
    await _repository.addSmartResult(answers).then((value) {
      try {
          removeProgress();
          ShowSnackBar().showSnackBar(
            context,
            value.message,duration: const Duration(seconds: 5),
          );
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }


  plannerList(BuildContext context,int id) async {
    showProgress(context);
    await _repository.plannerList(id).then((value) {
      try {
          removeProgress();
          plannerListModel=value;
          Get.to(() => const PlanerDetailsPage(tabSelect: PlanerType.curses,));
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }


  plannerSessionItem(BuildContext context,int id) async {
    showProgress(context);
    await _repository.plannerSessionItems(id).then((value) {
      try {
          removeProgress();
          plannerSessionItemsModel=value;
          Get.to(() => const CourseDetailsComponents());
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }

  plannerSessionItemDetail(BuildContext context,int id,int type,) async {
    showProgress(context);
    await _repository.plannerSessionItemsDetail(id).then((value) {
      try {
          removeProgress();
          plannerSessionItemDetailModel=value;
          if (type == 4||type == 107) {
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: true,
                backgroundColor:
                ColorsApp.white,
                builder: (BuildContext
                context) =>
                 ModalCourseVideo(url: value.url,));
          }
          else if (type == 44) {
            audioHandler.stop();
            audioHandler.updateQueue([
              MediaItem(
                  id: "1",
                  album: "",
                  title: value.title,
                  artist: "",
                  duration:
                   Duration(seconds: value.duration),
                  artUri: Uri.parse(
                      "https://hipanda.ir${value.photoShow}"),
                  extras: {
                    "url":
                    "https://hipanda.ir${value.url}",
                    "token": "Bearer $token",
                    "lyric": ""
                  }),
            ]);

            audioHandler.skipToQueueItem(0);
            audioHandler
                .seek(const Duration(seconds: 0));
            audioHandler.play();
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: true,
                backgroundColor:
                ColorsApp.white,
                builder: (BuildContext
                context) =>
                const ModalCourseAudio());
          }
          else if (type == 101) {
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: true,
                backgroundColor:
                ColorsApp.white,
                builder: (BuildContext
                context) =>
                 ModalCourseRest(timeRest: value.restMinutes,));
          }
          else if (type == 103) {
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: true,
                backgroundColor:
                ColorsApp.white,
                builder: (BuildContext
                context) =>
                 ModalCourseTesting(title: value.title, desc: value.descript,questionGroup: value.questionGroups, id: id,));
          }
          else if (type == 102) {
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: true,
                backgroundColor:
                ColorsApp.white,
                builder: (BuildContext
                context) =>
                    ModalCourseFile(title: value.title, id: id, url: value.url, des: value.descript,));
          }
          else if (type == 105) {
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: true,
                backgroundColor:
                ColorsApp.white,
                builder: (BuildContext
                context) =>
                    DetailCoursesBookAndPdfPage(getBookAndPdfDetailModel: plannerSessionItemDetailModel!, image: plannerSessionItemDetailModel!.photoShow,));
          }
          else if (type == 106) {
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: true,
                backgroundColor:
                ColorsApp.white,
                builder: (BuildContext
                context) =>
                    DetailCoursesBookAndPdfPage(getBookAndPdfDetailModel: plannerSessionItemDetailModel!, image: plannerSessionItemDetailModel!.photoShow,));
          }
      } catch (e) {
        removeProgress();
      }
    }).catchError((value) {
      if (kDebugMode) {
        print(value);
      }
      removeProgress();
    });
  }


  plannerAddSupport(BuildContext context,String text,bool hasFile,String fileUrl,int plannerUserId ) async {
    if(controllerDesc.text!=""){
      isLoadingCall.value=false;
      showProgress(context);
      await _repository.plannerAddSupport(text, hasFile, fileUrl, plannerUserId).then((value) {
        try {
          removeProgress();
          ShowSnackBar().showSnackBar(
            context,
            value.message,duration: const Duration(seconds: 5),
          );
          isLoadingCall.value=true;
          box.remove("idImage");
          controllerDesc.text="";
        } catch (e) {
          removeProgress();
          isLoadingCall.value=true;
        }
      }).catchError((value) {
        if (kDebugMode) {
          print(value);
          isLoadingCall.value=true;
        }
        removeProgress();
      });
    }else{
      ShowSnackBar().showSnackBar(
        context,
        "توضیحات تیکت را تکمیل فرمایید",duration: const Duration(seconds: 5),
      );
    }

  }


  plannerItemPartAddPractise(BuildContext context,int id,String text,bool hasFile,String fileUrl,int plannerUserId ) async {
    if(controllerDesc.text!=""){
      isLoadingCall.value=false;
      showProgress(context);
      await _repository.plannerItemPartAddPractise(id,text, hasFile, fileUrl, plannerUserId).then((value) {
        try {
          removeProgress();
          ShowSnackBar().showSnackBar(
            context,
            value.message,duration: const Duration(seconds: 5),
          );
          isLoadingCall.value=true;
          box.remove("idImage");
          controllerDesc.text="";
          Navigator.pop(context);
        } catch (e) {
          removeProgress();
          isLoadingCall.value=true;
        }
      }).catchError((value) {
        if (kDebugMode) {
          print(value);
          isLoadingCall.value=true;
        }
        removeProgress();
      });
    }else{
      ShowSnackBar().showSnackBar(
        context,
        "توضیحات تیکت را تکمیل فرمایید",duration: const Duration(seconds: 5),
      );
    }

  }

}
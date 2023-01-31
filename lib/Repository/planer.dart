

import '../View/Blog/Models/list_post_model.dart';
import '../View/Planer/Models/AnswerQuestionModel.dart';
import '../View/Planer/Models/getLevelQuestionsModel.dart';
import '../View/Planer/Models/getPlannerBasePage_model.dart';
import '../View/Planer/Models/planner_list_model.dart';
import '../View/Planer/Models/planner_session_item_details_model.dart';
import '../View/Planer/Models/planner_session_item_model.dart';
import '../View/test_farahi/Model/courses_detail.dart';
import '../View/test_farahi/Model/my_courses_model.dart';
import '../network/service_helper.dart';
import '../network/service_url.dart';
import 'cansult_app.dart';

class PlanerRepository {
  final ServiceHelper _helper;


  PlanerRepository() : _helper = ServiceHelper();


  Future<GetPlannerBasePageModel> getPlannerBasePage() async{

    final resources = await _helper.post(ServiceURL.getPlannerBasePageUrl,auth: true,);
    return  GetPlannerBasePageModel.fromJson(resources);
  }


  Future<GetLevelQuestionsModel> getLevelQuestions() async{

    final resources = await _helper.post(ServiceURL.getLevelQuestionsUrl,auth: true,);
    return  GetLevelQuestionsModel.fromJson(resources);
  }


  Future<GetLevelQuestionsModel> getSmartQuestions() async{

    final resources = await _helper.post(ServiceURL.getSmartQuestionsUrl,auth: true,);
    return  GetLevelQuestionsModel.fromJson(resources);
  }


  Future<GeneralModel> addLevelResult(int id,List<Answer>? answers) async{

    final resources = await _helper.post(ServiceURL.addLevelResultUrl,auth: true,data: {"answers":answers,"id":id});
    return  GeneralModel.fromJson(resources);
  }
  Future<GeneralModel> plannerItemPartTestResult(int id,List<Answer>? answers) async{

    final resources = await _helper.post(ServiceURL.plannerItemPartTestResultUrl,auth: true,data: {"answers":answers,"id":id});
    return  GeneralModel.fromJson(resources);
  }


  Future<GeneralModel> addSmartResult(List<AnswerQuestionModel>? answers) async{

    final resources = await _helper.post(ServiceURL.addSmartResultUrl,auth: true,data: {"answers":answers});
    return  GeneralModel.fromJson(resources);
  }

  Future<PlannerListModel> plannerList(int id) async{

    final resources = await _helper.post(ServiceURL.plannerUrl,auth: true,data: {"id":id});
    return  PlannerListModel.fromJson(resources);
  }

  Future<PlannerSessionItemsModel> plannerSessionItems(int id) async{
    final resources = await _helper.post(ServiceURL.plannerSessionItemsUrl,auth: true,data: {"id":id});
    return  PlannerSessionItemsModel.fromJson(resources);
  }

  Future<PlannerSessionItemDetailModel> plannerSessionItemsDetail(int id) async{
    final resources = await _helper.post(ServiceURL.getPlannerSesstionItemDetailUrl,auth: true,data: {"id":id});
    return  PlannerSessionItemDetailModel.fromJson(resources);
  }


  Future<GeneralModel> plannerAddSupport(String text,bool hasFile,String fileUrl,int plannerUserId) async{

    final resources = await _helper.post(ServiceURL.plannerAddSupportUrl,auth:
    true,data: {"text":text,"hasFile":hasFile,"fileUrl":fileUrl,"plannerUserId":
    plannerUserId});
    return  GeneralModel.fromJson(resources);
  }



  Future<GeneralModel> plannerItemPartAddPractise(int id,String text,bool hasFile,String fileUrl,int plannerUserId) async{

    final resources = await _helper.post(ServiceURL.plannerItemPartAddPractiseUrl,auth:
    true,data: {"id":id,"text":text,"hasFile":hasFile,"fileUrl":fileUrl,"plannerUserId":
    plannerUserId});
    return  GeneralModel.fromJson(resources);
  }

}



class GeneralModel {
  GeneralModel({
    required this.message,
  });

  final String message;

  factory GeneralModel.fromJson(Map<String, dynamic> json) => GeneralModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

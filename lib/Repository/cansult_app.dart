
import '../Models/Request/pay_factory_req_model.dart';
import '../Models/Responses/consult_filter_model.dart';
import '../Models/Responses/consult_info_model.dart';
import '../Models/Responses/consult_model.dart';
import '../Models/Responses/factory_info_model.dart';
import '../Models/Responses/factory_model.dart';
import '../Network/service_helper.dart';
import '../Network/service_url.dart';
import '../View/SentRequest/Model/consult_page_model.dart';
import '../View/SentRequest/Model/register_new_consult_model.dart';

class ConsultRepository {
  final ServiceHelper _helper;

  ConsultRepository() : _helper = ServiceHelper();

  Future<ConsultFilterModel> consultFilter() async{
    final resources = await _helper.post(ServiceURL.consultFilterUrl);
    return  ConsultFilterModel.fromJson(resources);


  }

  Future<ConsultPageModel> consultPage() async{
    final resources = await _helper.post(ServiceURL.consultPageUrl);
    return  ConsultPageModel.fromJson(resources);


  }

  Future<ConsultModel> consult(int page , int pageSize,String search,int view,int call,int chat,int buy,int linkId) async{
    final resources = await _helper.post(ServiceURL.consultUrl,data: {
      "page":page,
      "pageSize":pageSize,
      "search":search,
      "view":view,
      "call":call,
      "chat":chat,
      "buy":buy,
      "linkId":linkId,
    });
    return  ConsultModel.fromJson(resources);
  }


  Future<RegisterConsultModel> registerNewConsult(
      String name ,String phoneNumber) async {
    final resources = await _helper.post(ServiceURL.registerNewConsultUrl,data: {
      "name":name,
      "phoneNumber":phoneNumber,
    });
    return  RegisterConsultModel.fromJson(resources);
  }


  Future<GeneralModel> registerNewConsultWithSup(
      String name , String instagram,String phoneNumber,String detail,int linkId) async {
    final resources = await _helper.post(ServiceURL.registerNewConsultWithUrl,data: {
      "name":name,
      "instagram":instagram,
      "phoneNumber":phoneNumber,
      "detail":detail,
      "linkId":linkId,
    });
    return  GeneralModel.fromJson(resources);
  }

  Future<GeneralModel> changeDetailUserConsult(
      int id , String phone,String name) async {
    final resources = await _helper.post(ServiceURL.changeDetailUserConsultUrl,data: {
      "id":id,
      "phone":phone,
      "name":name,
    });
    return  GeneralModel.fromJson(resources);
  }


  Future<GeneralModel> consultOperation(
      int id , int type,int rate,String consultResult,String text) async {
    final resources = await _helper.post(ServiceURL.consultOperationUrl,data: {
      "id":id,
      "type":type,
      "rate":rate,
      "consultResult":consultResult,
      "text":text,
    });
    return  GeneralModel.fromJson(resources);
  }

  Future<GeneralModel> addCourseConsult(
      int id , int courseId,String text,String image1,String image2,String image3,String trackingCode
      ,int installments,int link,int price
      ) async {
    final resources = await _helper.post(ServiceURL.addCourseConsultUrl,data: {
      "id":id,
      "courseId":courseId,
      "text":text,
      "image1":image1,
      "image2":image2,
      "image3":image3,
      "trackingCode":trackingCode,
      "installments":installments,
      "link":link,
      "price":price,
    });
    return  GeneralModel.fromJson(resources);
  }




  Future<FactoryModel> factory(int page , int pageSize,String search) async{
    final resources = await _helper.post(ServiceURL.factoryUrl,data: {
      "page":page,
      "pageSize":pageSize,
      "search":search,
    });
    return  FactoryModel.fromJson(resources);
  }


  Future<ConsultInfoModel> consultInfo(int id ) async{
    final resources = await _helper.post(ServiceURL.consultInfoUrl,data: {
      "id":id,
    });
    return  ConsultInfoModel.fromJson(resources);
  }


  Future<ConsultInfoModel> payFactory(RequestPayFactoryModel requestPayFactoryModel ) async{
    final resources = await _helper.post(ServiceURL.payFactoryUrl,data: {
      "id":requestPayFactoryModel.id,
      "pays":requestPayFactoryModel.pays,
    });
    return  ConsultInfoModel.fromJson(resources);
  }

  Future<ConsultFilterModel> consultAddLink() async{
    final resources = await _helper.post(ServiceURL.consultAddLinkUrl,);
    return  ConsultFilterModel.fromJson(resources);
  }


  Future<FactoryInfoModel> factoryInfo(int id ) async{
    final resources = await _helper.post(ServiceURL.factoryInfoUrl,data: {
      "id":id,
    });
    return  FactoryInfoModel.fromJson(resources);
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

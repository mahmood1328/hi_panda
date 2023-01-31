
import '../View/test_farahi/Model/courses_detail.dart';
import '../View/test_farahi/Model/my_courses_model.dart';
import '../network/service_helper.dart';
import '../network/service_url.dart';

class HomeRepository {
  final ServiceHelper _helper;

  HomeRepository() : _helper = ServiceHelper();

  // Future<ShopIndexModel> shopIndex(int id) async{
  //
  //   final resources = await _helper.post(ServiceURL.shopIndex,auth: true,data: {"id":id});
  //   return  ShopIndexModel.fromJson(resources);
  // }


  Future<MyCoursesModel> getMyCourses() async{

    final resources = await _helper.post(ServiceURL.myCourse,auth: true);
    return  MyCoursesModel.fromJson(resources);
  }

  Future<MyCoursesDetailModel> getMyCoursesDetail(int id,int pId,int type) async{

    final resources = await _helper.post(ServiceURL.myCourseDetail,auth: true,data: {"id":id,"pId":pId,"type":type});
    return  MyCoursesDetailModel.fromJson(resources);
  }



}

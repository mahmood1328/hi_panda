

import '../View/Blog/Models/list_post_model.dart';
import '../View/test_farahi/Model/courses_detail.dart';
import '../View/test_farahi/Model/my_courses_model.dart';
import '../network/service_helper.dart';
import '../network/service_url.dart';
import 'cansult_app.dart';

class BlogRepository {
  final ServiceHelper _helper;

  BlogRepository() : _helper = ServiceHelper();



  Future<ListPostsModel> listPost(int page,int pageSize,search) async{

    final resources = await _helper.post(ServiceURL.listPostsUrl,auth: true,data: {"page":page,"pageSize":pageSize,"search":search});
    return  ListPostsModel.fromJson(resources);
  }

  Future<GeneralModel> postOperation(String id,String text,int type) async{

    final resources = await _helper.post(ServiceURL.postOperationUrl,auth: true,data: {"id":id,"text":text,"type":type});
    return  GeneralModel.fromJson(resources);
  }



}



import '../View/Blog/Models/list_post_model.dart';
import '../View/Dictionary Page/Models/dictioary_list_model.dart';
import '../View/Dictionary Page/Models/dictioary_model.dart';
import '../View/test_farahi/Model/courses_detail.dart';
import '../View/test_farahi/Model/my_courses_model.dart';
import '../network/service_helper.dart';
import '../network/service_url.dart';
import 'cansult_app.dart';

class DictionaryRepository {
  final ServiceHelper _helper;

  DictionaryRepository() : _helper = ServiceHelper();



  Future<DictionaryListModel> listDictionary() async{

    final resources = await _helper.post(ServiceURL.dictonaryList,auth: true);
    return  DictionaryListModel.fromJson(resources);
  }

  Future<DictionaryModel> dictionary(int dictionaryId,String text) async{

    final resources = await _helper.post(ServiceURL.dictonary,auth: true,data: {"dictionaryId":dictionaryId,"text":text});
    return  DictionaryModel.fromJson(resources);
  }



}

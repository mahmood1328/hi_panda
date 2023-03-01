

import '../View/Blog/Models/list_post_model.dart';
import '../View/Dictionary Page/Models/dictioary_list_model.dart';
import '../View/Dictionary Page/Models/dictioary_model.dart';
import '../View/Flash Card/Models/get_box_model.dart';
import '../View/Flash Card/Models/get_flash_card_category_model.dart';
import '../View/Flash Card/Models/get_flash_card_list_model.dart';
import '../View/Flash Card/Models/get_keyword_model.dart';
import '../View/test_farahi/Model/courses_detail.dart';
import '../View/test_farahi/Model/my_courses_model.dart';
import '../network/service_helper.dart';
import '../network/service_url.dart';
import 'cansult_app.dart';

class FlashCardRepository {
  final ServiceHelper _helper;

  FlashCardRepository() : _helper = ServiceHelper();



  Future<GetFlashCardListModel> getFlashCardList() async{

    final resources = await _helper.post(ServiceURL.getFlashCardListUrl,auth: true);
    return  GetFlashCardListModel.fromJson(resources);
  }


  Future<GeneralModel> addGeneralToMyFlashCard(int generalCategoryId) async{

    final resources = await _helper.post(ServiceURL.addGeneralToMyFlashCardUrl,auth: true,data: {"generalCategoryId":generalCategoryId});
    return  GeneralModel.fromJson(resources);
  }

  Future<GeneralModel> addItemToFlashCardCategory(String title,String photoId,int level) async{

    final resources = await _helper.post(ServiceURL.addItemToFlashCardCategoryUrl,auth: true,data: {"title":title,"photoId":photoId,"level":level});
    return  GeneralModel.fromJson(resources);
  }


  Future<GetFlashCardCategoryModel> getFlashCardCategory( ) async{

    final resources = await _helper.post(ServiceURL.getFlashCardCategoryUrl,auth: true,);
    return  GetFlashCardCategoryModel.fromJson(resources);
  }


  Future<GeneralModel> addItemToFlashCard( int flashCardCategory,String keyword, String text,String photoId,String sentence) async{

    final resources = await _helper.post(ServiceURL.addItemToFlashCardUrl,auth: true,data: {"flashCardCategory":flashCardCategory,"keyword":keyword,"text":text,
    "photoId":photoId,"sentence":sentence
    });
    return  GeneralModel.fromJson(resources);
  }

  Future<GetBoxModel> getBox( int flashCardCategory,) async{

    final resources = await _helper.post(ServiceURL.getBoxUrl,auth: true,data: {"flashCardCategory":flashCardCategory
    });
    return  GetBoxModel.fromJson(resources);
  }

  Future<GetKeywordModel> getKeyword( int flashCardCategory,int box,int lastId) async{

    final resources = await _helper.post(ServiceURL.getKeywordUrl,auth: true,data: {"flashCardCategory":flashCardCategory,"box":box,"lastId":lastId
    });
    return  GetKeywordModel.fromJson(resources);
  }

  Future<GeneralModel> keywordSendToOtherBox( int flashCardKeyword,int box) async{

    final resources = await _helper.post(ServiceURL.keywordSendToOtherBoxUrl,auth: true,data: {"flashCardKeyword":flashCardKeyword,"box":box
    });
    return  GeneralModel.fromJson(resources);
  }

  Future<GeneralModel> sendToMyFriend( int flashCardCategory,bool general,List<String> phoneNumbers) async{

    final resources = await _helper.post(ServiceURL.sendToMyFriendUrl,auth: true,data: {"flashCardCategory":flashCardCategory,"general":general,"phoneNumbers":phoneNumbers
    });
    return  GeneralModel.fromJson(resources);
  }



}


import '../Network/service_helper.dart';
import '../Network/service_url.dart';
import '../View/Chat/Model/buy_page_model.dart';
import '../View/Chat/Model/chat_messages_model.dart';
import '../View/Chat/Model/chat_page_model.dart';
import '../View/Chat/Model/has_buy_chat_model.dart';
import '../View/Chat/Model/support_check_user_model.dart';
import '../View/Chat/Model/support_page_model.dart';
import '../View/Chat/Model/supports_model.dart';

class ChatRepository {
  final ServiceHelper _helper;

  ChatRepository() : _helper = ServiceHelper();


  Future<SupportsModel> supports(
      int page,int pageSize,String search
      ) async {
    final resources = await _helper.post(
        ServiceURL.supportsUrl, data: {
      "page": page,
      "pageSize": pageSize,
      "search": search,
    });
    return SupportsModel.fromJson(resources);
  }

  Future<SupportsModel> buys(
      int page,int pageSize,String search
      ) async {
    final resources = await _helper.post(
        ServiceURL.buysUrl, data: {
      "page": page,
      "pageSize": pageSize,
      "search": search,
    });
    return SupportsModel.fromJson(resources);
  }
  Future<SupportPageModel> supportPage() async{
    final resources = await _helper.post(ServiceURL.supportPageUrl);
    return  SupportPageModel.fromJson(resources);
  }

  Future<BuyPageModel> buyPage() async{
    final resources = await _helper.post(ServiceURL.buyPageUrl);
    return  BuyPageModel.fromJson(resources);
  }

  Future<HasBuyChatModel> hasBuyChat() async{
    final resources = await _helper.post(ServiceURL.hasBuyChatUrl);
    return  HasBuyChatModel.fromJson(resources);
  }

  Future<GeneralModel> chatUnlock(int id) async{
    final resources = await _helper.post(ServiceURL.chatUnlockUrl,data: {"id":id});
    return  GeneralModel.fromJson(resources);
  }

  Future<SupportCheckUserModel> supportCheckUser(String phoneNumber) async{
    final resources = await _helper.post(ServiceURL.supportCheckUserUrl,data: {"phoneNumber":phoneNumber});
    return  SupportCheckUserModel.fromJson(resources);
  }
  Future<ChatPageModel> chatPage(String id) async{
    final resources = await _helper.post(ServiceURL.chatPageUrl,data: {"id":id});
    return  ChatPageModel.fromJson(resources);
  }

  Future<ChatMessagesModel> chatMessages(int id,int page) async{
    final resources = await _helper.post(ServiceURL.chatMessagesUrl,data: {"id":id,"page":page});
    return  ChatMessagesModel.fromJson(resources);
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

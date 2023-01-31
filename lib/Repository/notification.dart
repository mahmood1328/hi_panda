import '../View/Notofication_list/Model/notification_list_model.dart';
import '../network/service_helper.dart';
import '../network/service_url.dart';
import 'cansult_app.dart';

class NotificationRepository {
  final ServiceHelper _helper;


  NotificationRepository() : _helper = ServiceHelper();



  Future<GetNotificationModel> getMyNotification(int page,int pageSize,String search,int viewFilter) async{

    final resources = await _helper.post(ServiceURL.getMyNotifiUrl,auth:
    true,data: {"page":page,"pageSize":pageSize,"search":search,"viewFilter":
    viewFilter});
    return  GetNotificationModel.fromJson(resources);
  }


  Future<GeneralModel> addViewNotifi(int id) async{
    final resources = await _helper.post(ServiceURL.addViewNotifiUrl,auth:
    true,data: {"id":id,});
    return  GeneralModel.fromJson(resources);
  }

}



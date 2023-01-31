
import '../Models/app_info_model.dart';
import '../Network/service_helper.dart';
import '../Network/service_url.dart';
import 'cansult_app.dart';

class AuthorizeRepository {
  final ServiceHelper _helper;

  AuthorizeRepository() : _helper = ServiceHelper();

  Future<GeneralModel> savePushTokenMobileInfo(
      String pushToken,String osType,String osVersion,String explorer,String deviceModel
      ,String appVersion,String loginCode
      ) async {
    final resources = await _helper.post(
        ServiceURL.savePushTokenMobileInfoUrl, data: {
      "pushToken": pushToken,
      "osType": osType,
      "osVersion": osVersion,
      "explore": explorer,
      "deviceModel": deviceModel,
      "appVersion": appVersion,
      "loginCode": loginCode,
    });
    return GeneralModel.fromJson(resources);
  }

  Future<GeneralModel> saveUserInfo(
      String name,String sex,
      ) async {
    final resources = await _helper.post(
        ServiceURL.saveUserInfoUrl, data: {
      "name": name,
      "sex": sex,
    });
    return GeneralModel.fromJson(resources);
  }

  Future<GeneralModel> deletePushToken(
      String loginCode
      ) async {
    final resources = await _helper.post(
        ServiceURL.deletePushTokenUrl, data: {
      "loginCode": loginCode,
    });
    return GeneralModel.fromJson(resources);
  }

  Future<GetAppInfoModel> getAppInfo(
      String loginCode
      ) async {
    final resources = await _helper.post(
        ServiceURL.getAppInfoUrl, data: {
      "loginCode": loginCode,
    });
    return GetAppInfoModel.fromJson(resources);
  }

  }



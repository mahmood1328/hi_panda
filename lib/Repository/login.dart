
import '../Models/app_info_model.dart';
import '../Models/get_app_info_model.dart';
import '../Models/login_model.dart';
import '../Models/verfy_model.dart';
import '../network/service_helper.dart';
import '../network/service_url.dart';

class LoginRepository {
  final ServiceHelper _helper;

  LoginRepository() : _helper = ServiceHelper();

  Future<LogInModel> login(String mobile,String smsCode) async{
    var data = <String, String>{
      'PhoneNumber': mobile,
      'SMSSendCode': smsCode,
    };
    final resources = await _helper.post(ServiceURL.login, data: data,auth: false);
    return  LogInModel.fromJson(resources);
  }

  Future<VerifyModel> verify(String mobile,String smsCode) async{
    var data = <String, String>{
      'phoneNumber': mobile,
      'verifyCode': smsCode,
    };
    final resources = await _helper.post(ServiceURL.verify, data: data,auth: false);
    return  VerifyModel.fromJson(resources);
  }

  Future<LogInModel> register(String name,String sex) async{
    var data = <String, String>{
      'name': name,
      'sex': sex,
    };
    final resources = await _helper.post(ServiceURL.register, data: data);
    return  LogInModel.fromJson(resources);
  }

  Future<GetAppInfoUpdateModel> getAppInfo() async{
    final resources = await _helper.post(ServiceURL.getAppInfoUrl,auth: false);
    return  GetAppInfoUpdateModel.fromJson(resources);
  }

}

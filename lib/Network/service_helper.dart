import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Models/error_model.dart';
import 'app_exception.dart';

class ServiceHelper {
  final box = GetStorage();
  final String baseUrl = 'hipanda.ir';

  static final ServiceHelper _serviceHelper = ServiceHelper._internal();

  factory ServiceHelper() {
    return _serviceHelper;
  }

  ServiceHelper._internal();

  Future<dynamic> post(
      String url, {
        Map<String, dynamic> data = const {},
        Map<String, String>? queryParam,
        Map<String, String>? headers,
        bool auth = true,
      }) async {
    return await patternRequest(RequestType.post, url,
        data: data, headers: headers, auth: auth, queryParam: queryParam);
  }

  Future<dynamic> put(
      String url, {
        Map<String, dynamic> data = const {},
        Map<String, String>? queryParam,
        Map<String, String>? headers,
        bool auth = true,
      }) async {
    return await patternRequest(RequestType.put, url,
        data: data, headers: headers, auth: auth, queryParam: queryParam);
  }

  Future<dynamic> get(
      String url, {
        Map<String, String>? queryParam,
        Map<String, String>? headers,
        bool auth = false,
      }) async {
    return await patternRequest(RequestType.get, url,
        headers: headers, auth: auth, queryParam: queryParam);
  }

  Future<dynamic> delete(
      String url, {
        Map<String, String>? queryParam,
        Map<String, String>? headers,
        bool auth = true,
      }) async {
    return await patternRequest(RequestType.delete, url,
        headers: headers, auth: auth, queryParam: queryParam);
  }

  Future<dynamic> patternRequest(
      RequestType type,
      String url, {
        Map<String, dynamic> data = const {},
        Map<String, String>? queryParam,
        Map<String, String>? headers,
        bool auth = true,
      }) async {
    log(data.toString(), name: 'request Data log');
    log(headers.toString(), name: 'extra header send');
    log(queryParam.toString(), name: 'query data');

    final Map<String, String> headerSend = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    if (headers != null) {
      headerSend.addAll(headers);
    }
    if (auth) {
      //todo go to constructor
      String token = await box.read("tokenn");

      headerSend['Authorization'] = "Bearer $token";
    }

    final http.Response response;
    switch (type) {
      case RequestType.post:
        response = await http.post(
          Uri.https(baseUrl, url, queryParam),
          headers: headerSend,
          body: jsonEncode(data),
        ).timeout(const Duration(seconds: 20));
        break;
      case RequestType.get:
        response = await http.get(
          Uri.https(baseUrl, url, queryParam),
          headers: headerSend,
        ).timeout(const Duration(seconds: 20));
        break;
      case RequestType.delete:
        response = await http.delete(
          Uri.https(baseUrl, url, queryParam),
          headers: headerSend,
          body: jsonEncode(data),
        ).timeout(const Duration(seconds: 20));
        break;
      case RequestType.put:
        response = await http.put(
          Uri.https(baseUrl, url, queryParam),
          headers: headerSend,
          body: jsonEncode(data),
        ).timeout(const Duration(seconds: 20));
        break;
    }
    print(url);

    return _returnResponse(response,);
  }

  dynamic _returnResponse(http.Response response) {


    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print('==============\n  post service url: \n=> $responseJson \n*********\n ');
        return responseJson;
      case 400:
        ErrorModel responseBody =
        ErrorModel.fromJson(json.decode(response.body));
        print(response.body);
        throw BadRequestException(responseBody.message);
      case 401:
        ErrorModel responseBody =
        ErrorModel.fromJson(json.decode(response.body));
        throw BadRequestException(responseBody.message);
      case 403:
        ErrorModel responseBody =
        ErrorModel.fromJson(json.decode(response.body));
        throw UnauthorisedException(responseBody.message);
      case 503:
        ErrorModel responseBody =
        ErrorModel.fromJson(json.decode(response.body));
        throw UnauthorisedException(responseBody.message);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }















  Future<Map<dynamic, dynamic>?> patternWithFile(
      String url, {
        Map<String, File>? files,
        Map<String, String> data = const <String, String>{},
        bool haveToken = true,
      }) async {
    var request = http.MultipartRequest(
        "POST",
        Uri.https(
          baseUrl,
          url,
        ));

    String token = await box.read("tokenn");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": 'Bearer $token'
    };
    request.headers.addAll(headers);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    if (files != null) {
      files.forEach((key, value) async {
        //  if (kIsWeb) {
        //     request.files.add(http.MultipartFile.fromBytes(key, value.bytes!));
        //   } else {
        request.files
            .add(await http.MultipartFile.fromPath(key, value.path));
        //   }
      });
    }

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    final Map body = json.decode(respStr);

    //todo debug
    // print('data to send : $data \n');
    // print('data to send : $body \n');
    // print(
    //     "response of $url : statusCode->${response.statusCode} \n body->$respStr");

    if (body['status']) {
      return body;
    } else {
      throw Exception('Error');
    }
  }

  Future<Map<dynamic, dynamic>?> imageProfile2(
      String url, {
        File? file,
        String keyName = 'profileImage',
        // Map<String, dynamic> data = const <String, String>{},
        bool haveToken = true,
      }) async {
    var request = http.MultipartRequest(
        "POST",
        Uri.https(
          baseUrl,
          url,
        ));

    String token = await box.read("tokenn");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": 'Bearer $token'
    };
    request.headers.addAll(headers);

    // data.forEach((key, value) {
    //   request.fields[key] = value;
    // });

    if(file != null) {
      request.files.add(await http.MultipartFile.fromPath(
        keyName,
        file.path,
      ));
    }

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    final Map<String, dynamic>  body = json.decode(respStr);
    // UploadImageModel res= UploadImageModel.fromJson(body);
    //todo debug
    print('data to send : $body \n');
    print(
        "response of $url : statusCode->${response.statusCode} \n body->$respStr");
    box.write("idImage",body['file']);
    print(body['file']);
    if (body['succeeded'] == 'true') {
      box.write("idImage",body['file']);
      print(body['file']);
      //  box.write("idImage",body['data']["id"]);
      //  print(body['message']);
      //  print(body['data']["id"]);
      return body;
    } else if (body['error'] == 'error') {
    } else {

    }
    return null;
  }

  // Future<Map<dynamic, dynamic>?> noskheUpload(
  //     String url, {
  //       Map<String, PlatformFile>? files,
  //       Map<String, String> data = const <String, String>{},
  //       bool haveToken = true,
  //     }) async {
  //   var request = http.MultipartRequest(
  //       "POST",
  //       Uri.https(
  //         baseUrl,
  //         url,
  //       ));
  //
  //   String token = await box.read("tokenn");
  //
  //   Map<String, String> headers = {
  //     "Accept": "application/json",
  //     "Authorization": 'Bearer $token'
  //   };
  //   request.headers.addAll(headers);
  //
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //
  //   if (files != null) {
  //     files.forEach((key, value) async {
  //       if (kIsWeb) {
  //         request.files.add(http.MultipartFile.fromBytes(key, value.bytes!));
  //       } else {
  //         request.files
  //             .add(await http.MultipartFile.fromPath(key, value.path!));
  //       }
  //     });
  //   }
  //
  //   http.StreamedResponse response = await request.send();
  //   final respStr = await response.stream.bytesToString();
  //   final Map body = json.decode(respStr);
  //
  //   //todo debug
  //   // print('data to send : $data \n');
  //   // print('data to send : $body \n');
  //   // print(
  //   //     "response of $url : statusCode->${response.statusCode} \n body->$respStr");
  //
  //   if (body['status']) {
  //     return body;
  //   } else {
  //     throw Exception('file format not support must be jpg,jpeg,bmp,png,pdf,txt,docx,webp');
  //   }
  // }
  //
  //
  //
  //
  // Future<Map<dynamic, dynamic>?> patternWithFile2(
  //     String url, {
  //       List<PlatformFile>? file,
  //       String keyName = 'files',
  //       Map<String, dynamic> data = const <String, String>{},
  //       bool haveToken = true,
  //     }) async {
  //   var request = http.MultipartRequest(
  //       "POST",
  //       Uri.https(
  //         baseUrl,
  //         'public/api/application/v1/' + url,
  //       ));
  //
  //   // String token = await box.read("tokenn");
  //   //
  //   // Map<String, String> headers = {
  //   //   "Accept": "application/json",
  //   //   "Authorization": 'Bearer $token'
  //   // };
  //   // request.headers.addAll(headers);
  //
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //
  //
  //   if (file != null) {
  //     for(int i =0; i<file.length ; i++){
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'files[$i]',
  //         file[i].path!,
  //       ));
  //     }
  //   }
  //
  //   http.StreamedResponse response = await request.send();
  //   final respStr = await response.stream.bytesToString();
  //   final Map body = json.decode(respStr);
  //
  //   //todo debug
  //   // print('data to send : $data \n');
  //   // print('data to send : $body \n');
  //   // print(
  //   //     "response of $url : statusCode->${response.statusCode} \n body->$respStr");
  //
  //   if (body['data'] == 'true') {
  //     return body;
  //   } else if (body['data'] == 'error') {
  //   } else {}
  //   return null;
  // }
  //
  Future<Map<dynamic, dynamic>?> imageProfile(
      String url, {
        File? file,
        String keyName = 'fileUpload',
         Map<String, dynamic> data = const <String, String>{},
        bool haveToken = true,
      }) async {
    var request = http.MultipartRequest(
        "POST",
        Uri.https(
          baseUrl,
          url,
        ));

    String token = await box.read("tokenn");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": 'Bearer $token'
    };
    request.headers.addAll(headers);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    if(file != null) {
      request.files.add(await http.MultipartFile.fromPath(
        keyName,
        file.path,
      ));
    }

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    final Map body = json.decode(respStr);

    //todo debug
    print('data to send : $body \n');
    print(
        "response of $url : statusCode->${response.statusCode} \n body->$respStr");

    if (body['fileId'] != '') {
      return body;
    } else if (body['data'] == 'error') {
    } else {}
    return null;
  }
  //
  //
  // Future<Map<dynamic, dynamic>?> imageNoskhe(
  //     String url, {
  //       PlatformFile? file,
  //       String keyName = 'file',
  //       Map<String, dynamic> data = const <String, String>{},
  //       bool haveToken = true,
  //     }) async {
  //   var request = http.MultipartRequest(
  //       "POST",
  //       Uri.https(
  //         baseUrl,
  //         'public/api/application/v1/' + url,
  //       ));
  //
  //   String token = await box.read("tokenn");
  //
  //   Map<String, String> headers = {
  //     "Accept": "application/json",
  //     "Authorization": 'Bearer $token'
  //   };
  //   request.headers.addAll(headers);
  //
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //
  //   if(file != null) {
  //     print("ok");
  //     request.files.add(await http.MultipartFile.fromPath(
  //       keyName,
  //       file.path!,
  //     ));
  //   }
  //
  //   http.StreamedResponse response = await request.send();
  //   final respStr = await response.stream.bytesToString();
  //   final Map body = json.decode(respStr);
  //
  //   //todo debug
  //   // print('data to send : $data \n');
  //   // print('data to send : $body \n');
  //   // print(
  //   //     "response of $url : statusCode->${response.statusCode} \n body->$respStr");
  //
  //   if (body['data'] == 'true') {
  //     return body;
  //   } else if (body['data'] == 'error') {
  //   } else {}
  //   return null;
  // }


  Future<String> downloadFile(String url, String fileName, String dir) async {
    HttpClient httpClient =  HttpClient();
    File? file;
    String filePath = '';
    String myUrl = '';
    String data="";

    try {
      myUrl = url;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        data = await file.readAsString(encoding: utf8);
        await file.writeAsBytes(bytes);
      }
      else {
        filePath = 'Error code: '+response.statusCode.toString();
      }
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return data;
  }}

enum RequestType { post, get, delete, put }



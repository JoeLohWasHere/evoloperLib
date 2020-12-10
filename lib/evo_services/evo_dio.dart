import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'evo_alice_interceptor.dart';

class DioWebClient{
  Dio dio;
  bool MOCK = false;


  DioWebClient({String baseUrl}){
    dio = new Dio();
    dio.options.baseUrl = baseUrl;
  }

  Future<Response> getAPI({Map<String,dynamic> headers,String path,String baseUrl = ""}) async{
    try{
      if(baseUrl != ""){
        dio.options.baseUrl = baseUrl;
      }
      dio.options.headers =headers;
      dio.options.contentType = "application/json";
      if(DEBUG_MODE){
        dio.interceptors.add(aliceInterceptor.alice.getDioInterceptor());
      }
      if(MOCK){
        dio.interceptors.add(new MockInterceptor());
      }
      Response response = await dio.get(path);
      return response;
    }on DioError catch(e){
      print('Failed to GET: $e');
      switch(e.response.statusCode){
        case 400:
          if(e.response.data != null){
            return new Response(data:e.response.data,statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }else{
            return new Response(statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }
          break;
        case 500:
          if(e.response.data != null){
            return new Response(data:e.response.data,statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }else{
            return new Response(statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }
          break;
        default:
          if(e.response.data != null){
            return new Response(data:e.response.data,statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }else{
            return new Response(statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }
          break;
      }
    }
  }

  Future<Response> postAPI({Map<String,dynamic> headers,String path,String body,String baseUrl = ""}) async {
    try {
      Response response;
      if(baseUrl != ""){
        dio.options.baseUrl = baseUrl;
      }
      dio.options.headers =headers;
      dio.options.contentType = "application/json";
      if(DEBUG_MODE){
        dio.interceptors.add(aliceInterceptor.alice.getDioInterceptor());
      }
      if(MOCK){
        dio.interceptors.add(new MockInterceptor());
      }
      if(body == null){
        response = await dio.post(path);
      }else{
        response = await dio.post(path,data: body);
      }
      return response;
    }on DioError catch (e){
      print('Failed to POST: $e:');
      switch(e.response.statusCode){
        case 400:
          if(e.response.data != null){
            return new Response(data:e.response.data,statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }else{
            return new Response(statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }
          break;
        case 500:
          if(e.response.data != null){
            return new Response(data:e.response.data,statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }else{
            return new Response(statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }
          break;
        default:
          if(e.response.data != null){
            return new Response(data:e.response.data,statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }else{
            return new Response(statusMessage: e.error,statusCode: e.response.statusCode,headers: e.response.headers);
          }
          break;
      }
    }
  }

}


class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  @override
  Future onRequest(RequestOptions options) async {
    String apiPath = options.path.replaceAll(options.baseUrl, "");
    final resourcePath = _jsonDir + apiPath + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    final map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );

    return Response(
      data: map,
      statusCode: 200,
    );
  }
}
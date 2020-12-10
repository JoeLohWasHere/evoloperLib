import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class DownloadResult{
  final Map<String,dynamic> result;

  DownloadResult({this.result});
}

class EvoDownloadService{
  Dio dio;

  static EvoDownloadService instance = EvoDownloadService();

  EvoDownloadService(){
    dio = new Dio();
  }

  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }

    // in this example we are using only Android and iOS so I can assume
    // that you are not trying it for other platforms and the if statement
    // for iOS is unnecessary

    // iOS directory visible to user
    return await getApplicationDocumentsDirectory();
  }

  Future<DownloadResult> downloadFile({String downloadUrl,String savedFileName,void Function(int,int) onReceiveProgress}) async{
    try{
      final downloadFilePath = await _getDownloadDirectory();
      final savePath = path.join(downloadFilePath.path,savedFileName);
      final response = dio.download(downloadUrl, savePath,onReceiveProgress: onReceiveProgress);
      Map<String,dynamic> result = {
        'isSuccess' : true,
        'filePath' : savePath,
        'errorMessage' : null,
      };
      return new DownloadResult(result: result);

    }on DioError catch (e){
      print("error $e");
      Map<String,dynamic> result = {
        'isSuccess' : false,
        'filePath' : null,
        'errorMessage' : e.error.toString(),
      };
      return new DownloadResult(result: result);
    }
  }

}
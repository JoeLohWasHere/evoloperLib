import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EvoImageConverter{

  Future<String> EncodeImageToBase64(String imageUrl) async{
    try{
      String encodeString = "";
      http.Response response = await http.get(imageUrl);
      encodeString = base64Encode(response.bodyBytes);
      return encodeString;
    }catch(e){
      log(e);
      return "";
    }

  }

  Future<String> EncodeImageToBase64ByFile(File file) async{
    try{
      final bytes = file.readAsBytesSync();
      String encodeString = base64Encode(bytes);
      log(encodeString);
      return encodeString;
    }catch(e){
      log(e);
      return "";
    }
  }

  Image DecodeBase64ToString(String bytes){
    try{
      var base64 = base64Decode(bytes);
      return Image.memory(base64);
    }catch(e){
      log(e);
      return null;
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class EvoHttp{
  final String url, body;
  final Map header;
  dynamic data;
  int responseCode;
  String errorMsg;

  EvoHttp({this.url, this.header, this.body});

  Future<void> _statusCheck(_response) async{
    responseCode = await _response.statusCode;
    try{
      switch (responseCode){
        case 200:
          data = await json.decode(_response.body);
          break;
        default:
          data = null;
          errorMsg = await json.decode(_response.body)['Message'];
      }
    }catch(e){
      data = null;
      errorMsg = 'No Response';
    }
  }

  Future <void> getAPI() async {
    try {
      var _response = await http.get(Uri.encodeFull(this.url), headers: this.header);
      await _statusCheck(_response);
    } catch (e){
      print('Failed to GET: $e');
    }
  }

  Future <void> postAPI() async {
    try {
      var _response;
      if(this.body == null){
        _response = await http.post(Uri.encodeFull(this.url), headers: this.header);
      } else {
        _response = await http.post(Uri.encodeFull(this.url), headers: this.header, body: this.body);
      }
      await _statusCheck(_response);
    } catch (e){
      print('Failed to POST: $e:');
    }
  }
}
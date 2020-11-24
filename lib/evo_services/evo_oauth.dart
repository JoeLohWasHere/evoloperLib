import 'dart:math';

class EvoOAuth{
  final String clientId, redirectUri, responseType, scope, authority, unencodedPath;

  EvoOAuth({this.clientId, this.redirectUri, this.responseType, this.scope, this.authority, this.unencodedPath});

  Uri getUri(){
    const String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = new Random();
    String _getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    String _nonce = _getRandomString(10);
    String _state = '${DateTime.now()}${_rnd.nextInt(9999999)}';
    Map<String,String> _queryParameters = {
      'client_id':clientId,
      'redirect_uri':redirectUri,
      'response_type':responseType,
      'scope':scope,
      'state':_state,
      'nonce':_nonce
    };

    return Uri.https(authority, unencodedPath, _queryParameters);
  }
}

import 'package:evo_lib/evo_services/evo_string_format.dart';

class EvoAddressFormat{
  final String line1, line2, line3, postCode;

  EvoAddressFormat({this.line1, this.line2, this.line3, this.postCode});

  String
  _fullAddress='',
      _symbol1=',', _symbol2=',', _symbolPost=',', _symbol3='.',
      _add1='',  _add2='',  _addPost='',  _add3='',
      _newLine1='\n', _newLine2='\n', _newLinePost='\n';

  EvoStringFormat _evoStringFormat = new EvoStringFormat();

  String getAddress(){
    if(line1==''&&line2==''&&postCode==''&&line3==''){return _fullAddress='';}
    else{
      if(postCode=='' && line3==''){_symbol2='.';}
      if(line2=='' && postCode=='' && line3==''){_symbol1='.';}
      if(postCode!='' && line3==''){_symbolPost='.';}

      if(line1==''){_symbol1 = '';} else {_add1 = '${_evoStringFormat.removeWhitespaceSymbols(line1)}$_symbol1';}
      if(line2==''){_symbol2 = ''; _newLine1='';} else {_add2 = '${_evoStringFormat.removeWhitespaceSymbols(line2)}$_symbol2';}
      if(postCode==''){_symbolPost = ''; _newLine2='';} else {_addPost = '${_evoStringFormat.removeWhitespaceSymbols(postCode)}$_symbolPost';}
      if(line3==''){_symbol3 = ''; _newLinePost='';} else {_add3 = '${_evoStringFormat.removeWhitespaceSymbols(line3)}$_symbol3';}

      _fullAddress='$_add1$_newLine1$_add2$_newLine2$_addPost$_newLinePost$_add3';

      return _fullAddress;
    }
  }
}
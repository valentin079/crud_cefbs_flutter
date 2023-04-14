
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArquivoService{
  static const String url = "http://localhost:8080/";
  static const String resourse = "arquivos";

  String getUrl(){
    return "$url$resourse";
  }

  void register(String nome, String pasta) async {
    final response = await http.post(
      Uri.parse(getUrl()),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'nome': nome, 'pasta': pasta}),
    );
  }
  void delete() async{

  }

  Future<String> get() async{
    http.Response response = await http.get(Uri.parse(getUrl()));
    return response.body;
  }

}
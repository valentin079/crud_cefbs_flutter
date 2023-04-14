import 'dart:convert';
import 'package:arquivo_morto/screens/cadastrar.dart';
import 'package:arquivo_morto/services/arquivo_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Arquivo {
  String nome;
  String pasta;

  Arquivo(this.nome, this.pasta);
}

class TelaArquivos extends StatefulWidget {
  @override
  _TelaArquivosState createState() => _TelaArquivosState();
}

class _TelaArquivosState extends State<TelaArquivos> {
  ArquivoService service = new ArquivoService();
  List<Arquivo> arquivos = [];

  Future<void> buscarArquivos() async {
    String url = service.getUrl();
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Verifica se a resposta foi bem-sucedida
      List<dynamic> json = jsonDecode(response.body);
      setState(() {
        arquivos =
            json.map((item) => Arquivo(item['nome'], item['pasta'])).toList();
      });
    } else {
      throw Exception('Erro ao buscar arquivos: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arquivo Morto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.search),
              label: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Busque por um nome',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cadastrar()));
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Nome')),
                    DataColumn(label: Text('Pasta')),
                    DataColumn(label: Text('Apagar')),
                  ],
                  rows: arquivos
                      .map(
                        (arquivo) => DataRow(
                      cells: [
                        DataCell(Text(arquivo.nome)),
                        DataCell(Text(arquivo.pasta)),
                        DataCell(
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                            label: Text(''),
                          ),
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: buscarArquivos,
        child: Icon(Icons.refresh),
      ),
    );

  }
}



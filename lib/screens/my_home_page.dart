import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> folders = [
    {'name': 'Emerson Valentin', 'number': 10},
    {'name': 'Jackson Reis', 'number': 5},
    {'name': 'Folder 3', 'number': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arquivo Morto'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {}, child: Container(
              width: 200,
              child: Row(
                children: [
                  Text('Adiconar ao arquivo morto'),
                  Icon(Icons.add),
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 370,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Buscar no Arquivo Morto',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                  Center(
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text('Nome'),
                        ),
                        DataColumn(label: Text('Pasta')),
                        DataColumn(label: Text('Remover')),
                      ],
                      rows: folders
                          .map((folder) => DataRow(cells: [
                                DataCell(Text(folder['name'])),
                                DataCell(Text(folder['number'].toString())),
                                DataCell(Icon(Icons.delete)),
                              ]))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

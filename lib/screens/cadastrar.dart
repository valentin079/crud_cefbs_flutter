import 'package:arquivo_morto/services/arquivo_service.dart';
import 'package:flutter/material.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({Key? key}) : super(key: key);

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  ArquivoService service = new ArquivoService();
  var _pastaDigitada;
  var _nomeDigitado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);}
        ),
        title: Text('Cadastrar'),
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 400,
                      child: TextFormField(
                        onChanged: (nome) {
                          setState(() {
                            _nomeDigitado = nome;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'Digite o nome do arquivo'),
                      )),
                  Container(
                    width: 400,
                    child: TextFormField(
                      onChanged: (pasta) {
                        setState(() {
                          _pastaDigitada = pasta;
                        });
                      },
                      decoration: InputDecoration(hintText: 'Código da pasta'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        width: 100,
                        height: 17,
                        child: Row(
                          children: [
                            Text(style: TextStyle(fontSize: 15), 'Cadastrar'),
                            Icon(Icons.input),
                          ],
                        ),
                      ),
                      onTap: () {
                        service.register('$_nomeDigitado', '$_pastaDigitada');
                      },
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

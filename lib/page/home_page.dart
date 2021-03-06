import 'dart:convert';

import 'package:desafio_mao_na_massa/page/produto.dart';
import 'package:desafio_mao_na_massa/page/selecionar_produro_page.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Produto> dados;

  final numberFormat =
      NumberFormat.currency(name: 'R\$', locale: 'pt_BR', decimalDigits: 2);

  final numberFormatValor = NumberFormat();

  get color => null;
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/dados.json').then((dadosJson) {
      setState(() {
        List list = json.decode(dadosJson);

        dados = list.map<Produto>((map) => Produto.fromMap(map)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha uma revenda'),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Icon(Icons.import_export_outlined),

          // ),

          PopupMenuButton(
            icon: Icon(Icons.import_export_outlined),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Melhor Avaliação'),
                      new Checkbox(
                        onChanged: (bool value) {},
                        value: false,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mais rápido'),
                      new Checkbox(
                        onChanged: (bool value) {},
                        value: false,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mais barato'),
                      new Checkbox(
                        onChanged: (bool value) {},
                        value: false,
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.help),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text("Suporte"),
                ),
                PopupMenuItem(
                  value: 0,
                  child: Text("Termos de serviço"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Botijões de 13 kg em:',
                          style:
                              TextStyle(fontSize: 14, color: Colors.black38)),
                      Text(
                        'Av. Paulista 1001:',
                        style: TextStyle(fontSize: 22, color: Colors.black38),
                      ),
                      Text('Paulista, São Paulo - SP:',
                          style:
                              TextStyle(fontSize: 18, color: Colors.black38)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_location,
                        color: Colors.blue,
                      ),
                      Text(
                        'Mudar',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: dados
                      .map((element) => new Card(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * .10,
                                  decoration: BoxDecoration(
                                      color: Color(
                                          int.parse(element.cor, radix: 16) +
                                              0xFF000000),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      )),
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Text(
                                      element.tipo,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 96,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            selecionarItem(element, context),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    element.nome,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: element.melhorPreco
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.orange,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              RotatedBox(
                                                                quarterTurns:
                                                                    -1,
                                                                child: Icon(
                                                                  Icons
                                                                      .bookmark,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Menor Preço',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : Container(),
                                                )
                                              ],
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      'Nota',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      'Tempo médio',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      'Preço',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          numberFormatValor
                                                              .format(
                                                                  element.nota),
                                                          style: TextStyle(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      element.tempoMedio,
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      numberFormat.format(
                                                          element.preco),
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selecionarItem(Produto produto, context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SelecionarProduroPage(produto: produto)));
  }
}

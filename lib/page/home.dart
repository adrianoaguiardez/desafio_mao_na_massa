import 'package:desafio_mao_na_massa/page/home_page.dart';
import 'package:desafio_mao_na_massa/page/selecionar_produro_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        SelecionarProduroPage.routerPage: (_) => SelecionarProduroPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

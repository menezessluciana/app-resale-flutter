import 'dart:convert';

import 'package:app_resale/app/routers/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _bestEvaluationSelected = false;
  bool _fasterSelected = false;
  bool _cheaperSelected = false;

  List<dynamic> fornecedores;

  void onFilterChange(type, value) {
    switch (type) {
      case 'bestevaluation':
        setState(() {
          _bestEvaluationSelected = value;
          fornecedores.sort((a, b) {
            return a['nota'].compareTo(b['nota']);
          });
        });
        break;
      case 'faster':
        setState(() {
          _fasterSelected = value;
          fornecedores.sort((a, b) {
            return a['tempoMedio'].compareTo(b['tempoMedio']);
          });
        });
        break;
      case 'cheaper':
        setState(() {
          _cheaperSelected = value;
          fornecedores.sort((a, b) {
            return a['preco'].compareTo(b['preco']);
          });
        });
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString('assets/dados.json')
        .then((jsonData) => this.setState(() {
              fornecedores = json.decode(jsonData);
            }));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha uma Revenda'),
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.swap_vert),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: _bestEvaluationSelected,
                    child: CheckboxListTile(
                      value: _bestEvaluationSelected,
                      title: Text('Melhor avaliação'),
                      onChanged: (bool value) {
                        onFilterChange('bestevaluation', value);
                      },
                    ),
                  ),
                  PopupMenuItem(
                    value: _fasterSelected,
                    child: CheckboxListTile(
                      value: _fasterSelected,
                      title: Text('Mais rápido'),
                      onChanged: (bool value) {
                        onFilterChange('faster', value);
                      },
                    ),
                  ),
                  PopupMenuItem(
                    value: _cheaperSelected,
                    child: CheckboxListTile(
                      value: _cheaperSelected,
                      title: Text('Mais barato'),
                      onChanged: (bool value) {
                        onFilterChange('cheaper', value);
                      },
                    ),
                  ),
                ];
              }),
          PopupMenuButton(
              child: Center(child: Text('?', style: TextStyle(fontSize: 25))),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Text('Suporte'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text('Termos de serviço'),
                  ),
                ];
              })
        ],
      ),
      body: Container(
        height: ScreenUtil.screenHeight,
        width: ScreenUtil.screenWidth,
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: ScreenUtil.screenWidth,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Botijões de 13gk em:',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 9)),
                          Text('Av Paulista, 1001',
                              style: TextStyle(fontSize: 17)),
                          Text('Paulista, São Paulo, SP',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.place, color: Colors.blue),
                        Text('Mudar', style: TextStyle(color: Colors.blue)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return _cardList(fornecedores[index], _);
                },
                itemCount: fornecedores?.length ?? 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _cardList(dynamic fornecedor, BuildContext _) {
  return InkWell(
    onTap: () {
      Get.toNamed(Routes.shoppingCart,
          arguments: ShoppingCartPageArguments(fornecedor: fornecedor));
    },
    child: Container(
      width: ScreenUtil.screenWidth,
      margin: EdgeInsets.only(bottom: 20),
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(
                          int.parse(fornecedor['cor'], radix: 16) + 0xFF000000),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: Center(
                        child: Text(fornecedor['tipo'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13))),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(fornecedor['nome']),
                        fornecedor['melhorPreco']
                            ? Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                    color: Colors.amber[600]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.label, color: Colors.white, size: 20),
                                      SizedBox(width: 5),
                                      Text(
                                        'Melhor Preço',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(height: 35)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Nota',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11)),
                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Text(fornecedor['nota'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                                Icon(Icons.star, color: Colors.yellow, size: 20)
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Tempo Médio',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11)),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(fornecedor['tempoMedio'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text('min',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 9)),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Preço',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11)),
                            SizedBox(height: 5),
                            Text(
                                'R\$ ${fornecedor['preco'].toString().replaceAll('.', ',')}0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22))
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    ),
  );
}

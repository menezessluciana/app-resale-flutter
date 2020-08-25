import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingCartPage extends StatefulWidget {
  dynamic fornecedor;
  ShoppingCartPage({
    Key key,
    this.fornecedor,
  }) : super(key: key);
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text('A quantidade minima é 1'),  backgroundColor: Colors.red);
  int qtd = 1;
  double valorTotal = 0;


  @override
  void initState() {
    super.initState();
    valorTotal = widget.fornecedor['preco'];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,  
      appBar: AppBar(
        title: Text('Selecionar Produtos'),
        actions: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 5),
              child: Text('?', style: TextStyle(fontSize: 28)),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: ScreenUtil.screenHeight * 0.22,
              width: ScreenUtil.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                       right: 40, left: 40, top: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 18,
                              width: 18,
                              margin: EdgeInsets.only(bottom: 18),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0,
                                      spreadRadius: 8,
                                      color: Color(0xffE0E0E0),
                                    ),
                                  ]),
                            ),
                            Text('Comprar'),
                          ],
                        ),
                        Container(
                          color: Colors.grey[300],
                          width: 50,
                          height: 1,
                          margin: EdgeInsets.only(bottom: 35),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(bottom: 18),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Text('Pagamento'),
                          ],
                        ),
                        Container(
                          color: Colors.grey[300],
                          width: 50,
                          height: 1,
                          margin: EdgeInsets.only(bottom: 35),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(bottom: 18),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Text('Confirmação'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    width: ScreenUtil.screenWidth,
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              margin: EdgeInsets.only(right: 5),
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black),
                              child: Center(
                                child: Text(
                                  qtd.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                                '${widget.fornecedor['nome']} - Botijão de 13kg'),
                          ],
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('R\$', style: TextStyle(fontSize: 10)),
                              Text('${valorTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                  height: ScreenUtil.screenHeight * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: <Widget>[
                                Icon(Icons.home, color: Colors.grey, size: 35),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(widget.fornecedor['nome']),
                                    SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Text(widget.fornecedor['nota']
                                            .toString()),
                                        SizedBox(width: 3),
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 8),
                                        SizedBox(width: 30),
                                        Text(
                                            '${widget.fornecedor['tempoMedio'].toString()} min'),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(widget.fornecedor['tipo'],
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.grey[100],
                          width: ScreenUtil.screenWidth,
                          height: 1),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, top: 20, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('Botijão de 13kg'),
                                SizedBox(height: 2),
                                Text(widget.fornecedor['nome']),
                                SizedBox(height: 2),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text('R\$', style: TextStyle(fontSize: 10)),
                                    Text(
                                      '${valorTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 70,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        qtd> 1? qtd--: _scaffoldKey.currentState.showSnackBar(snackBar);
                                        valorTotal =
                                            widget.fornecedor['preco'] * qtd;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 22),
                                  Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/icon-gas.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        height: 20,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.amber[700],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Center(
                                              child: Text(qtd.toString(), style:TextStyle(fontSize: 11))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 22),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        qtd++;
                                        valorTotal =
                                            widget.fornecedor['preco'] * qtd;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    width: 250,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                          colors: [Colors.blue[200], Colors.blue[600]]),
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        'IR PARA O PAGAMENTO',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

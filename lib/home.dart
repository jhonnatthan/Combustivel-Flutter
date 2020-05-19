import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerAlcool = TextEditingController();
  TextEditingController controllerGasolina = TextEditingController();

  String mensagemResultado = "* Qual combustível *";
  double razao = 0;

  void calcular() {
    double pa = double.tryParse(controllerAlcool.text);
    double pg = double.tryParse(controllerGasolina.text);

    if (pa == null || pg == null) {
      setState(() {
        mensagemResultado = "Digite os valores corretamente!";
      });
    } else {
      razao = pa / pg;

      if (razao <= 0.7) {
        setState(() {
          mensagemResultado = "Melhor abastecer com Alcool";
        });
      } else {
        setState(() {
          mensagemResultado = "Melhor abastecer com Gasolina";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alcool/Gasolina"),
          centerTitle: true,
        ),
        body: Container(
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          ),
                          child: Image.asset(
                            'assets/images/industry.png',
                            width: 100,
                            alignment: Alignment.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: Text(
                            mensagemResultado,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Preço do Alcool"),
                                  controller: controllerAlcool,
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Preço da Gasolina"),
                                  controller: controllerGasolina,
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            )),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Calcular",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: calcular,
                        )
                      ],
                    )))));
  }
}

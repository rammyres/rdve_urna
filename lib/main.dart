import 'package:flutter/material.dart';
import 'package:flutter_numpad_widget/flutter_numpad_widget.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pin_put/pin_put.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RDVE Urna',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  TextEditingController editor = new TextEditingController();

  NumpadController tecladoNumerico;

  FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _toqueTecladoNumerico(String value) {
    setState(() {
      print(value);
      editor.text = "${editor.text}$value";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digite o numero do candidato"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: SizedBox.expand(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[300],
                      width: 8,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/imgs/square.jpg",
                          alignment: Alignment.center,
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300],
                            width: 8,
                          ),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nome",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                    width: 8,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      // TextField(
                      //   controller: editor,
                      //   decoration:
                      //       InputDecoration(labelText: "Numero do Candidato"),
                      // ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 4,
                        child: PinPut(
                          fieldsCount: 5,
                          controller: editor,
                          focusNode: _pinPutFocusNode,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.deepPurpleAccent.withOpacity(.5),
                            ),
                          ),
                        ),
                      ),
                      NumericKeyboard(
                        onKeyboardTap: _toqueTecladoNumerico,
                        textColor: Colors.green,
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        buttonPadding: EdgeInsets.all(20),
                        children: [
                          RaisedButton(
                            child: Text(
                              "Branco",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                editor.text = "00000";
                              });
                            },
                          ),
                          RaisedButton(
                            child: Text(
                              "Corrige",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.orange,
                            onPressed: () {
                              setState(() {
                                editor.text = "";
                              });
                            },
                          ),
                          RaisedButton(
                            child: Text(
                              "Confirma",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.green,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

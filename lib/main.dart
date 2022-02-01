import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Jorge Carlos Parra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Inicio(title: 'Calculadora Jorge Carlos Parra'),
    );
  }
}

String strInput = "";
String resultado = "0";
final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();


class Inicio extends StatefulWidget {
const Inicio({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Inicio> createState() => _EstadoCalculadora();
}

class _EstadoCalculadora extends State<Inicio> {
  //creamos un metodo para definir que hacer cuando se pulsa cada boton
  AccionBoton(String boton){
    switch (boton){
      case "AC":
        setState(() {
            txtEntrada.text = "";
            txtResultado.text = "";
          });
      break;

      case "D":
        txtEntrada.text = (txtEntrada.text.length > 0)
        ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1)): "";
      break;

      case "=":
        strInput = txtEntrada.text;
        strInput = strInput.replaceAll('x', "*");
        Parser P = new Parser();
        Expression exp = P.parse(strInput);
        ContextModel cm = new ContextModel();
        resultado = exp.evaluate(EvaluationType.REAL, cm).toString(); 
        setState(() {
          txtResultado.text = resultado;
        });
      break;

      case "+":
        if(txtEntrada.text.length > 0 ){
          setState(() {
              txtEntrada.text = txtEntrada.text + boton;
            });
        } else {
          setState(() {
              txtEntrada.text = "0" + boton;
            });
        }
      break;

      case "-":
        if(txtEntrada.text.length > 0 ){
          setState(() {
              txtEntrada.text = txtEntrada.text + boton;
            });
        } else {
          setState(() {
              txtEntrada.text = "0" + boton;
            });
        }
      break;

      case "/":
        if(txtEntrada.text.length > 0 ){
          setState(() {
              txtEntrada.text = txtEntrada.text + boton;
            });
        } else {
          setState(() {
              txtEntrada.text = "0" + boton;
            });
        }
      break;

      case "x":
        if(txtEntrada.text.length > 0 ){
          setState(() {
              txtEntrada.text = txtEntrada.text + boton;
            });
        } else {
          setState(() {
              txtEntrada.text = "0" + boton;
            });
        }
      break;

      case ".":
        if(txtEntrada.text.length > 0 ){
          setState(() {
              txtEntrada.text = txtEntrada.text + boton;
            });
        } else {
          setState(() {
              txtEntrada.text = "0" + boton;
            });
        }
      break;

      default:
        setState(() {
            txtEntrada.text = txtEntrada.text + boton;
          });
      break;
    }

  }

  //creamos un widget que sirva para crear un container de un boton
  Widget construirBoton(String btnText, Color btnColor){
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 28.0, color: Colors.black, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          AccionBoton(btnText);
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(
                      fontSize: 40,
                      fontFamily: 'RobotoMono',
                    )),
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'RobotoMono',
                ),
                textAlign: TextAlign.right,
                controller: txtEntrada,
                onTap: () =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
              )
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "Resultado",
                    fillColor: Colors.deepPurpleAccent,
                    hintStyle: TextStyle(fontFamily: 'RobotoMono')),
                style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold
                    // color: Colors.deepPurpleAccent
                ),
                textAlign: TextAlign.right,
                controller: txtResultado,
                )
          ),

          Expanded(
             child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        construirBoton("AC", Colors.deepOrange),
                        construirBoton("D", Colors.cyan),
                        construirBoton("/", Colors.cyan),
                      ]
                    ),

                    TableRow(
                      children: [
                        construirBoton("7", Colors.grey),
                        construirBoton("8", Colors.grey),
                        construirBoton("9", Colors.grey),
                      ]
                    ),

                    TableRow(
                      children: [
                        construirBoton("4", Colors.grey),
                        construirBoton("5", Colors.grey),
                        construirBoton("6", Colors.grey),
                      ]
                    ),

                    TableRow(
                      children: [
                        construirBoton("1", Colors.grey),
                        construirBoton("2", Colors.grey),
                        construirBoton("3", Colors.grey),
                      ]
                    ),

                    TableRow(
                      children: [
                        construirBoton(".", Colors.grey),
                        construirBoton("0", Colors.grey),
                        construirBoton("00", Colors.grey),
                      ]
                    ),
                  ],
                )
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        construirBoton("x", Colors.cyan),
                      ]
                    ),

                    TableRow(
                      children: [
                        construirBoton("-", Colors.cyan),
                      ]
                    ),

                    TableRow(
                      children: [
                        construirBoton("+", Colors.cyan),
                      ]
                    ),

                    TableRow(
                      children: [
                        construirBoton("=", Colors.deepOrange),
                      ]
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

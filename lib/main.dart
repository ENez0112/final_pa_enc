import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Examen());

class Examen extends StatelessWidget {
  const Examen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Examen final ENC",
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController controller = TextEditingController();
  TextEditingController numController = TextEditingController();
  actualizar(String str) {
    setState(() {
      controller.text = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Examen final ENC",
          style: TextStyle(
            color: Color(0xFF356859),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFBE6),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: numController,
                decoration: InputDecoration(
                  labelText: "Introduce el numero",
                  labelStyle: TextStyle(
                    color: Color(0xFFFFFBE6),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _actualizar(int.parse(numController.text));
              },
              color: Color(0xFF356859),
              splashColor: Color(0xFFFFFBE6),
              child: Text(
                "Obtener dato",
                style: TextStyle(
                  color: Color(0xFFFFFBE6),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Introduce el apellido",
                  labelStyle: TextStyle(
                    color: Color(0xFFFFFBE6),
                  ),
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFFBE6),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _actualizar(int id) async {
    String url = "https://wsfinal.azurewebsites.net/api/" + id.toString();
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    // var jsonResponse = json.decode(response.body);
    // print(response.body);
    actualizar(response.body);
  }
}

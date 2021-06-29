import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController firstOperand = new TextEditingController();
  TextEditingController secondOperand = new TextEditingController();
  TextEditingController operatorKalkulator = new TextEditingController();

  var response;
  var get_number;
  var result;

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Kalkulator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
                child: Text(
                  result == null
                      ? "Belum ada hasil"
                      : result['result'].toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                height: 50),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: firstOperand,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'firstOperand',
                    hintText: 'Masukkan operand pertama'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: secondOperand,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'secondOperand',
                    hintText: 'Masukkan operand kedua'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: operatorKalkulator,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'operatorKalkulator',
                    hintText: 'Masukkan operator'),
              ),
            ),
            Container(
              height: 50,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  var first = firstOperand.text;
                  var second = secondOperand.text;
                  var oper = operatorKalkulator.text;

                  var url = 'http://10.0.2.2:8000/tambah/';

                  var data = {'satu': first, 'dua': second, 'operator': oper};

                  response = await http.post(url,
                      headers: headers, body: json.encode(data));

                  result = json.decode(response.body);

                  print(result);

                  setState(() {});
                },
                child: Text(
                  '=',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}

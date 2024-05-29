import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Adivinanza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Página Principal de Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random _random = Random();
  late int _numeroObjetivo;
  final TextEditingController _controller = TextEditingController();
  int _intentos = 0;
  final int _maxIntentos = 10;
  String _helperText = 'Adivina el número entre 1 y 100';

  @override
  void initState() {
    super.initState();
    _reiniciarJuego();
  }

  void _reiniciarJuego() {
    _numeroObjetivo = _random.nextInt(100) + 1;
    _intentos = 0;
    _helperText = 'Adivina el número entre 1 y 100';
    _controller.clear();
    setState(() {});
  }

  void _mostrarDialogoResultado(String titulo, String contenido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(contenido),
          actions: <Widget>[
            TextButton(
              child: Text("Jugar de Nuevo"),
              onPressed: () {
                Navigator.of(context).pop();
                _reiniciarJuego();
              },
            ),
            TextButton(
              child: Text("Salir"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _verificarAdivinanza(String str) {
    if (str.isEmpty) return;

    int adivinanza = int.parse(str);
    _intentos++;
    String retroalimentacion;
    int intentos_restantes = 10 - _intentos;

    if (adivinanza < _numeroObjetivo) {
      retroalimentacion = '¡Más alto! te quedan $intentos_restantes intentos';
    } else if (adivinanza > _numeroObjetivo) {
      retroalimentacion = '¡Más bajo! te quedan $intentos_restantes intentos';
    } else {
      _mostrarDialogoResultado('¡Felicidades!', 'Adivinaste el número en $_intentos intentos.');
      return;
    }

    if (_intentos >= _maxIntentos) {
      _mostrarDialogoResultado('Juego Terminado', 'Has usado los $_maxIntentos intentos. El número era $_numeroObjetivo.');
      return;
    }

    _helperText = retroalimentacion;
    int intensidad = (_intentos / _maxIntentos * 255).toInt();
    Color colorRetroalimentacion = adivinanza < _numeroObjetivo
        ? Colors.red.withOpacity(intensidad / 255)
        : Colors.green.withOpacity(intensidad / 255);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_helperText),
        backgroundColor: colorRetroalimentacion,
        duration: Duration(seconds: 3),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          controller: _controller,
          onSubmitted: _verificarAdivinanza,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIconColor: Colors.purple,
            filled: true,
            fillColor: Color(0xfff4c8f0),
            prefixIcon: Icon(Icons.numbers),
            constraints: BoxConstraints(maxWidth: 450),
            helperText: _helperText,
            hintText: "Escribe tu número",
            labelText: "Número",
            border: OutlineInputBorder(),
          ),
          style: TextStyle(
            color: Color(0xffff0000),
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

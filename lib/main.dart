import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Primera práctica',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 20, 86)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Primera práctica'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.1, 1],
            colors: [Colors.blue, Colors.black],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: const Text("Hola mundo!"),
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 15, 216, 58),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 11, 95, 3),
                            blurRadius: 20.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      child: const Center(child: Text("Otro container")),
                    ),
                    Container(
                      margin: EdgeInsets.all(40),
                      width: 300,
                      height: 90,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFF4AAEFD),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Container(
                        width: 210,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0xFF94CCF9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            bottomLeft: Radius.circular(45),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Lonches',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: const Text("Hola mundo!"),
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.centerRight,
                          radius: 0.8,
                          colors: [Colors.yellow, Colors.black],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("Click corto");
                      },
                      onLongPress: () {
                        print("Click Largo");
                      },
                      onDoubleTap: () {
                        print("Doble click");
                      },
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 5),
                          image: DecorationImage(
                            image: AssetImage("../assets/hamburguesa.png"),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(-5, 5),
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        alignment: Alignment.bottomLeft,
                        child: const Text(""),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 250.0,
                      margin: const EdgeInsets.all(50.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(15, 135, 226, 1),
                            Color.fromRGBO(3, 29, 178, 1),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff1552ed),
                            spreadRadius: 10,
                            blurRadius: 20,
                            offset: Offset(3, 7),
                          )
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Otro azulito sisisi',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.lightBlue,
                      child: Text('A', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black,
                              offset: Offset(10, 10))
                        ],
                      ),
                      transform: Matrix4.rotationZ(0),
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(25),
                      width: 300,
                      height: 100,
                      child: Text("Hola a todos"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green[100], shape: BoxShape.circle),
                      margin: EdgeInsets.all(45),
                      padding: EdgeInsets.all(46),
                      alignment: Alignment(0.0, 0.0),
                      child: Text("Círculo."),
                    ),
                    Container(
                      
                    )
                    ],
                ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

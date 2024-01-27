import 'package:flutter/material.dart';

//PAGINA DEL BLUETOOTH
class BlueTooth extends StatefulWidget {
  const BlueTooth({
    super.key,
  });

  @override
  State<BlueTooth> createState() => _BlueToothState();
}

class _BlueToothState extends State<BlueTooth> {
  bool light0 = false;

  var prueba = ["uno", "dos", "tres"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Color.fromARGB(255, 207, 207, 207), width: 0.5),
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 207, 207, 207),
                        width: 0.5))),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Bluetooth",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Switch(
                            value: light0,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              setState(() {
                                light0 = value;
                              });
                            }),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(prueba.length,
                (index) => CrearInkWell(dispositivo: prueba[index])),
          )
        ],
      ),
    );
  }
}

class CrearInkWell extends StatefulWidget {
  const CrearInkWell({
    super.key,
    required this.dispositivo,
  });

  final String dispositivo;

  @override
  State<CrearInkWell> createState() => _CrearInkWellState();
}

class _CrearInkWellState extends State<CrearInkWell> {
  Color miColor = Colors.red;

  String estado = "...";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (miColor == Colors.red) {
            miColor = const Color.fromARGB(255, 88, 156, 90);
            estado = "Conectado";
          } else {
            miColor = Colors.red;
            estado = "Desconectado";
          }
        });
      },
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Color.fromARGB(255, 207, 207, 207), width: 0.5),
                bottom: BorderSide(
                    color: Color.fromARGB(255, 207, 207, 207), width: 0.5))),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.eco,
                color: miColor,
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.dispositivo)),
            ),
            Expanded(
              flex: 2,
              child: Text(estado),
            )
          ],
        ),
      ),
    );
  }
}

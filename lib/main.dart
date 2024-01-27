import 'package:flutter/material.dart';

//IMPORTS DE ARCHIVOS EXTERNOS
import 'bluetooth.dart';
import 'console.dart';
import 'map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AirMetrics'),
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
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 223, 223, 223),
        selectedIndex: currentPage,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.bluetooth),
            label: 'Bluetooth',
          ),
          NavigationDestination(
            icon: Icon(Icons.terminal),
            label: 'Console',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
      body: <Widget>[
        const BlueTooth(),
        const Console(),
        const Map(),
      ][currentPage],
    );
  }
}

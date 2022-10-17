import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xfff8e2e2),
        drawer: Drawer(
          backgroundColor: const Color(0xff6d2f2f),
          child: ListView(
          padding: const EdgeInsets.only(top: 40, left: 12),
          children: const [ListTile(
            title: Text(
              "Sobre o Museu",
              style: TextStyle(fontSize: 20),
            ),
            textColor: Colors.white,
          ),
            ListTile(
              title: Text(
                "Exposições",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
            ),
            ListTile(
              title: Text(
                "Serviços",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
            ),
            ListTile(
              title: Text(
                "Idiomas",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,

            ),
            ListTile(
              title: Text(
                "Ajuda",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
            ),
            ListTile(
              title: Text(
                "Sobre",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
            ),],
          ),
        ),
      appBar: AppBar(
        backgroundColor: const Color(0xff974141),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('MUSEAR'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notícias",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,),
                  textAlign: TextAlign.start,),
              ),
              CarouselSlider(
                options: CarouselOptions(height: 160.0),
                items: [1, 2, 3, 4].map((i) {
                  return Builder
                    (builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child:
                      Text('text $i', style: const TextStyle(fontSize: 16.0),),
                    );
                  },
                  );
                }).toList(),
              ),],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: const Color(0xff842e2e),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,size: 24,),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera,  color: Colors.white,size: 24,),
            label: "Câmera",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.schedule, color: Colors.white, size: 24,),
            label: "Agendamento",),
        ],
      ),
    );// This trailing comma makes auto-formatting nicer for build methods.;
  }
}

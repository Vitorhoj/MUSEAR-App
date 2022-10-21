import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:musear/about_the_app_screen.dart';
import 'package:musear/about_the_museum_screen.dart';
import 'package:musear/exhibitions_screen.dart';
import 'package:musear/help_screen.dart';
import 'package:musear/languages_screen.dart';
import 'package:musear/scheduling_screen.dart';
import 'package:musear/services_screen.dart';


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
      //routes: Map<>,
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

  final int _selectedIndex = 0;

  void _navigateTo(int index) {
    switch (index) {
      case 0: {
        Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MyHomeScreen()),);
      } break;
      case 1: {
        Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ChangeLanguagesScreen()),);
      } break;
      case 2: {
        Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SchedulingScreen()),);
      }break;
    }
  }


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
            children: [
            ListTile(
              title: const Text(
                "Sobre o Museu",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutMuseumScreen()),);
              },
            ),
            ListTile(
              title: const Text(
                "Exposições",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ExhibitionsScreen()),);
              },
            ),
            ListTile(
              title: const Text(
                "Serviços",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ServicesScreen()),);
              },
            ),
            ListTile(
              title: const Text(
                "Idiomas",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ChangeLanguagesScreen()),);
              },
            ),
            ListTile(
              title: const Text(
                "Ajuda",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpScreen()),);
              },
            ),
            ListTile(
              title: const Text(
                "Sobre",
                style: TextStyle(fontSize: 20),
                selectionColor: Color(0xff974141),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutAppScreen()),);
              },
            ),
          ],
        ),
        ),
      appBar: AppBar(
        backgroundColor: const Color(0xff842e2e),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('MUSEAR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Notícias",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 180.0),
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              """   Você pode visualizar mais informações sobre uma peça clicando no botão com o ícone de uma câmera na parte inferior da tela para abrir a câmera e realizar a leitura do QR Code correspondente à peça!
Se tiver dificuldades para abrir a câmera e escanear o QR Code, você pode utilizar também a barra de pesquisa abaixo pesquisando pelo título ou pelo código ou pelo autor da peça!""",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Título, código ou autor'),
                    autofocus: false,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(20, 58),
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff974141),
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: const Color(0xff842e2e),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
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
        currentIndex: _selectedIndex,
      onTap: _navigateTo,),
    );// This trailing comma makes auto-formatting nicer for build methods.;
  }
}


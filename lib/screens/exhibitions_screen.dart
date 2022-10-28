import 'package:flutter/material.dart';
import 'package:musear/screens/about_the_app_screen.dart';
import 'package:musear/screens/about_the_museum_screen.dart';
import 'package:musear/screens/help_screen.dart';
import 'package:musear/screens/languages_screen.dart';
import 'package:musear/main.dart';
import 'package:musear/screens/scheduling_screen.dart';
import 'package:musear/screens/services_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:musear/classes/language_constants.dart';
import 'package:musear/classes/language.dart';

class ExhibitionsScreen extends StatefulWidget {
  const ExhibitionsScreen({super.key});

  @override
  State<ExhibitionsScreen> createState() => _ExhibitionsScreen();
}

class _ExhibitionsScreen extends State<ExhibitionsScreen> {
  @override
  Widget build(BuildContext context) {
    const int selectedIndex = 0;
    String ticket = '';

    readQRCode() async {
      String code = await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF",
        "Cancelar",
        false,
        ScanMode.QR,
      );
      setState(() => ticket = code != '-1' ? code : 'Não validado');
    }

    void navigateTo(int index) {
      switch (index) {
        case 0:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MyHomeScreen()),
            );
          }
          break;
        case 1:
          {
            readQRCode();
          }
          break;
        case 2:
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SchedulingScreen()),
            );
          }
          break;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xfff8e2e2),
      drawer: Drawer(
        backgroundColor: const Color(0xff974141),
        child: ListView(
          padding: const EdgeInsets.only(top: 40, left: 12),
          children: [
            ListTile(
              title: const Text(
                "Início",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyHomeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text(
                "Sobre o Museu",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutMuseumScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExhibitionsScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ServicesScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ChangeLanguagesScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpScreen()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutAppScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff842e2e),
        centerTitle: true,
        title: const Text("MUSEAR"),
        titleTextStyle: const TextStyle(fontSize: 35),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [],
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
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 24,
            ),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera,
              color: Colors.white,
              size: 24,
            ),
            label: "Câmera",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.schedule,
              color: Colors.white,
              size: 24,
            ),
            label: "Agendamento",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: navigateTo,
      ),
    );
  }
}

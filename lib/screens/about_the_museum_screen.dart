import 'package:flutter/material.dart';
import 'package:musear/screens/about_the_app_screen.dart';
import 'package:musear/screens/exhibitions_screen.dart';
import 'package:musear/screens/help_screen.dart';
import 'package:musear/screens/languages_screen.dart';
import 'package:musear/main.dart';
import 'package:musear/screens/scheduling_screen.dart';
import 'package:musear/screens/services_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:musear/classes/language_constants.dart';
import 'package:musear/classes/language.dart';

class AboutMuseumScreen extends StatefulWidget {
  const AboutMuseumScreen({super.key});

  @override
  State<AboutMuseumScreen> createState() => _AboutMuseumScreen();
}

class _AboutMuseumScreen extends State<AboutMuseumScreen> {

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
              MaterialPageRoute(builder: (_) => const MyHomeScreen()),);
          }
          break;
        case 1:
          {
            readQRCode();
          }
          break;
        case 2:
          {
            Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SchedulingScreen()),);
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
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const MyHomeScreen()),);
              },
            ),
            ListTile(
              title: const Text(
                "Sobre o Museu",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const AboutMuseumScreen()),);
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
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const ExhibitionsScreen()),);
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
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ServicesScreen()),);
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
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const ChangeLanguagesScreen()),);
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
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HelpScreen()),);
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
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AboutAppScreen()),);
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
        actions: <Widget> [Padding(
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              SizedBox(height: 12),
              Text(
                "Histórico do Museu",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                """  O Museu Rondon de Etnologia e Arqueologia é uma instituição universitária, sem fins lucrativos que visa a pesquisa, o ensino e a extensão nas áreas de Etnologia e Arqueologia. Foi criado pela Resolução nº CD 36/72 de 30 de junho de 1972 e nomeado como “Museu Rondon” pela Resolução do Conselho Diretor da Fundação Universidade Federal de Mato Grosso nº 36 de 30 de junho de 1972.
                O MUSEAR é unidade administrativa do Instituto de Ciências Humanas e Sociais da Universidade Federal de Mato Grosso (ICHS). A unidade museal possui dois cargos: Supervisão e Museólogo.  O Conselho Científico é formado por docentes do Departamento de Antropologia e pelo Museólogo com funções de avaliar e emitir pareceres sobre atividades e projetos científicos e de exposições, desenvolvidos no âmbito do Museu, ações estabelecidas no Regimento Interno, aprovado pela Resolução CONSUNI Nº 11, de 27 de agosto de 2014.
                Inaugurado em 08 de janeiro de 1973, teve a colaboração de indigenistas como Orlando Villas Boas, João Américo Peret e Apoena Meireles, vinculados ao museu como pesquisadores, tornando-se os “principais fornecedores de acervo de cultura material exposto no salão de refeições do prédio do antigo restaurante universitário, situado no Parque Aquático, ao lado da piscina, onde permanece até hoje” (MACHADO, 2007, p. 29).""",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: const Color(0xff842e2e),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 24,),
            label: translation(context).inicio,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera, color: Colors.white, size: 24,),
            label: translation(context).camera,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.white, size: 24,),
            label: translation(context).agendamento,),
        ],
        currentIndex: selectedIndex,
        onTap: navigateTo,),
    );
  }
}
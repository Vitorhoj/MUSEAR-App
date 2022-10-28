import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:musear/classes/language.dart';
import 'package:musear/screens/about_the_app_screen.dart';
import 'package:musear/screens/about_the_museum_screen.dart';
import 'package:musear/screens/exhibitions_screen.dart';
import 'package:musear/screens/help_screen.dart';
import 'package:musear/screens/languages_screen.dart';
import 'package:musear/screens/more_info_piece_screen.dart';
import 'package:musear/screens/scheduling_screen.dart';
import 'package:musear/screens/services_screen.dart';
import 'package:musear/classes/language_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp>{
  Locale? _locale;

  setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomeScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
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
  String ticket = '';

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      translation(context).cancelar,
      false,
      ScanMode.QR,
    );
    setState(() => ticket = code != '-1' ? code : 'Não validado');
  }

  void _navigateTo(int index) {
    switch (index) {
      case 1: {
        readQRCode();
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
          backgroundColor: const Color(0xff974141),
          child: ListView(
          padding: const EdgeInsets.only(top: 40, left: 12),
            children: [
              ListTile(
                title: Text(translation(context).inicio,
                  style: const TextStyle(fontSize: 20),
                ),
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MyHomeScreen()),);
                },
              ),
            ListTile(
              title: Text(
                translation(context).sobreOMuseu,
                style: const TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutMuseumScreen()),);
              },
            ),
            ListTile(
              title: Text(
                translation(context).exposicoes,
                style: const TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ExhibitionsScreen()),);
              },
            ),
            ListTile(
              title: Text(
                translation(context).servicos,
                style: const TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ServicesScreen()),);
              },
            ),
            ListTile(
              title: Text(
                translation(context).idiomas,
                style: const TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ChangeLanguagesScreen()),);
              },
            ),
            ListTile(
              title: Text(
                translation(context).ajuda,
                style: const TextStyle(fontSize: 20),
              ),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpScreen()),);
              },
            ),
            ListTile(
              title: Text(
                translation(context).sobre,
                style: const TextStyle(fontSize: 20),
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
        title: const Text(
          "MUSEAR",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.normal),
        ),
          backgroundColor: const Color(0xff842e2e),
          centerTitle: true,
        actions: <Widget> [
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  translation(context).noticias,
                  style: const TextStyle(
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
               Text(
                 translation(context).qrCodeInfo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                translation(context).pesquisaPecaInfo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
          ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                   Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: translation(context).pesquisaPeca),
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const MoreInfoPieceScreen()),);
                      },
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
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
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 24,),
            label: translation(context).inicio,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.photo_camera,
              color: Colors.white,
              size: 24,),
            label: translation(context).camera,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.schedule,
              color: Colors.white,
              size: 24,),
            label: translation(context).agendamento,),
        ],
        currentIndex: _selectedIndex,
      onTap: _navigateTo,),
    );// This trailing comma makes auto-formatting nicer for build methods.;
  }
}


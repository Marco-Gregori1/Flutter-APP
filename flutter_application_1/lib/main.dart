import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pages.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/shared/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider(isDarkMode: Preferences.darkmode) ),
    ],
    child: const MyApp()

    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Marvel App',
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).currentTheme,
          initialRoute: 'home',
          routes: {
            'home': (context) => const HomePage(),
            'heroes': (context) => const HeroesPage(),
            'heroe': (context) => const HeroePage(heroeId:0,url: '',name: '',desc: ''),
            'feedback': (context) => const FeedbackForm()
          },
        );
      }
    
  }
  
  // Hacer que email y el tick se guarde en shared preferences
  // Comitear API Y APP
  // Documentar (Como le pega a la API ) y ver como enviar APK??
  // Entregar

  // se entrega :
  //  -Repositorio en GitHub
  //  -N° de API y Dimensiones con las que fue probado el prototipo a entregar.
  //  -En caso de que hayan generado un nuevo repositorio para la API de Node.js también 
  //   deberá ser compartido.
  //  -APK de la aplicación.
  //


  
 // LOCALHOST PARA ANDROID (celular real)
 // http://10.0.2.2:8000...

 //  LOCALHOST DENTRO PC 
 // http://127.0.0.1:8000...





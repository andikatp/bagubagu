import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/blocs/data_bloc.dart';
import 'package:news_app/constants/color.dart';
import 'package:news_app/features/home/screen/main_screen.dart';
import 'package:news_app/features/home/screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: primary),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: MainScreen.routeName,
        routes: {
          '/': (context) => const SplashScreen(),
          MainScreen.routeName: (context) => const MainScreen()
        },
      ),
    );
  }
}

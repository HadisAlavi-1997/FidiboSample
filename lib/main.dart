import 'package:fidibo/data/data.dart';
import 'package:fidibo/widgets/Menu/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Screens/Auth/Auth.dart';
import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/HomeScreen/NavigationBarClass.dart';
import 'Screens/EbookPage/EbookPage.dart';
import 'Screens/OnbordingScreen/OnboardingScreen.dart';

import 'Screens/fidiplus/fidiboplus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondTextColor = Color(0xff5b6580);
    const primaryColor = Color(0xFF000000);
    const onboardingcolorwhite = Color(0xFF4AD6F6);
    const SurfaceColor = Color(0xFFF4F4EF);
    const lablecolor = Color(0xF21E1C13);

    final width=MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.green, // رنگ اصلی اپلیکیشن

        //////////////////////////////////////////////////
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 5,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'Avenir',

                )))),
        textTheme: const TextTheme(
          labelMedium: TextStyle(
              fontFamily: 'Iranian',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff376AED)),
          labelSmall: TextStyle(
            fontSize: 13,
            fontWeight:  FontWeight.w700,
            fontFamily: 'Iranian',
              color: lablecolor
          ),
          headlineSmall: TextStyle(
              fontFamily: 'Iranian', color: primaryTextColor, fontSize: 18),
          headlineMedium: TextStyle(
              fontFamily: 'Iranian',
              fontWeight: FontWeight.bold,
              color: primaryTextColor,
              fontSize: 20),
          titleLarge: TextStyle(
              fontFamily: 'Iranian',
              color: primaryTextColor,
              fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
            fontFamily: 'Iranian',
            color: primaryColor,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Iranian',
            color: primaryTextColor,
            fontWeight: FontWeight.w800,
          ),
          bodySmall: TextStyle(
              fontFamily: 'Iranian',
              fontWeight: FontWeight.w500,
              color: Color(0xffb1b9ca),
              fontSize: 8),
        ),

        colorScheme: const ColorScheme.light(
          background: Color(0xFFF7F7F8),

          surface: SurfaceColor,
          primary: primaryColor,
          onSurface: secondTextColor,
          onBackground: primaryTextColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // اگر پکیج دیگری برای محلی‌سازی دارید، آن را هم اضافه کنید
      ],
      locale: Locale('fa', 'IR'),
      home: width<800? MainScreen():Home(),);



  }
}
class MainScreen extends StatefulWidget {
  const MainScreen ({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenDesktopState();
}

const int homeIndex = 0;
const int fidiplusIndex = 1;
const int categoryIndex = 2;
const int LibraryIndex = 3;

const double bottomNavigationHeight = 65;

class _MainScreenDesktopState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
            children: [
              Positioned.fill(
                bottom:bottomNavigationHeight ,
                child: IndexedStack(
                  index: selectedScreenIndex,
                  children: const [
                    Home(),

                    FidiPlusPage(),

                    EbookPage(),

                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Navigation(onSelectedTap: (int index) {
                  setState(() {
                    selectedScreenIndex=index;
                  });
                }, selectedIndex: selectedScreenIndex,)  ,)
            ]

        ));
  }
}
//************************************************************************************************
class MainScreenDesktop extends StatefulWidget {
  const MainScreenDesktop({Key? key}) : super(key: key);

  @override
  _MainScreenDesktopState createState() => _MainScreenDesktopState();
}

const int homeIndexDesktop = 0;
const int bookElectronic = 1;
const int audiobook = 2;
const int magazinePage  = 3;
const int university = 3;


class _MainScreenState extends State<MainScreenDesktop> {
  int selectedScreenIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
            children: [
              Positioned.fill(
                bottom:bottomNavigationHeight ,
                child: IndexedStack(
                  index: selectedScreenIndex,
                  children: const [
                    Home(),



                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Menu(onSelectedTap: (int index) {
                  setState(() {
                    selectedScreenIndex=index;
                  });
                }, selectedIndex: selectedScreenIndex,)  ,)
            ]

        ));
  }
}

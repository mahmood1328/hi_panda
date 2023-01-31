
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Controller/controller_main_page.dart';
import 'Helper/config.dart';
import 'Helper/route_handler.dart';
import 'Services/audio_service.dart';
import 'View/Chat/Page/list_chat_page.dart';
import 'View/SplashScreen/Controller/splash_controller.dart';
import 'View/SplashScreen/Page/splash_screen.dart';
import 'View/audio_player/Page/player_page.dart';
// Import the generated file
late AudioPlayerHandler audioHandler;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
var appController=Get.put(AppController());
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);

// flutter local notification
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

// firebase background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A Background message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  HttpOverrides.global =  MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  Paint.enableDithering = true;

   await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey:"AIzaSyCbuEwHsntkcRhqM3sJUPZDp5hTa80nriU",
      appId:"1:608348110618:web:b73f62ee36ca974af7b6a3",
      messagingSenderId: "608348110618",
      projectId: "sinafarahi-8222a",
    ),
  );

  //apiKey: "AIzaSyCbuEwHsntkcRhqM3sJUPZDp5hTa80nriU",
  //
  //   authDomain: "sinafarahi-8222a.firebaseapp.com",
  //
  //   projectId: "sinafarahi-8222a",
  //
  //   storageBucket: "sinafarahi-8222a.appspot.com",
  //
  //   messagingSenderId: "608348110618",
  //
  //   appId: "1:608348110618:web:b73f62ee36ca974af7b6a3",
  //
  //   measurementId: "G-5Y8HQSQ8X1"

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

// Firebase local notification plugin
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

//Firebase messaging
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await Hive.initFlutter();
  await openHiveBox('settings');
  await openHiveBox('downloads');
  await openHiveBox('Favorite Songs');
  await openHiveBox('cache', limit: true);
  if (Platform.isAndroid) {
  }
  await startService();
  runApp(MyApp());
}


Future<void> startService() async {
  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandlerImpl(),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'com.shadow.blackhole.channel.audio',
      androidNotificationChannelName: 'Hi Panda',
      androidNotificationOngoing: true,
      androidNotificationIcon: 'drawable/ic_stat_music_note',
      androidShowNotificationBadge: true,
      // androidStopForegroundOnPause: Hive.box('settings')
      // .get('stopServiceOnPause', defaultValue: true) as bool,
      notificationColor: Colors.grey[900],
    ),
  );
}

Future<void> openHiveBox(String boxName, {bool limit = false}) async {
  if (limit) {
    final box = await Hive.openBox(boxName).onError((error, stackTrace) async {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String dirPath = dir.path;
      final File dbFile = File('$dirPath/$boxName.hive');
      final File lockFile = File('$dirPath/$boxName.lock');
      await dbFile.delete();
      await lockFile.delete();
      await Hive.openBox(boxName);
      throw 'Failed to open $boxName Box\nError: $error';
    });
    // clear box if it grows large
    if (box.length > 500) {
      box.clear();
    }
    await Hive.openBox(boxName);
  } else {
    await Hive.openBox(boxName).onError((error, stackTrace) async {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String dirPath = dir.path;
      final File dbFile = File('$dirPath/$boxName.hive');
      final File lockFile = File('$dirPath/$boxName.lock');
      await dbFile.delete();
      await lockFile.delete();
      await Hive.openBox(boxName);
      throw 'Failed to open $boxName Box\nError: $error';
    });
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');




  @override
  void initState() {
    super.initState();
    final String lang =
    Hive.box('settings').get('lang', defaultValue: 'English') as String;
    final Map<String, String> codes = {
      'English': 'en',
      'Russian': 'ru',
      'Portuguese': 'pt',
      'Indonesia': 'id',
    };
    _locale = Locale(codes[lang]!);
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }


  Widget initialFuntion() {
    return Hive.box('settings').get('auth') != null ? SplashScreenPage() : const SplashScreenPage();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black38,
        // systemNavigationBarContrastEnforced: false,
        // systemNavigationBarIconBrightness:
        //     Theme.of(context).brightness == Brightness.dark
        //         ? Brightness.light
        //         : Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return GetMaterialApp(
      title: "Hi Panda",
      //restorationScopeId: 'ragamedia',
      debugShowCheckedModeBanner: false,
      themeMode: currentTheme.currentTheme(),
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: currentTheme.currentColor(),
          cursorColor: currentTheme.currentColor(),
          selectionColor: currentTheme.currentColor(),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(width: 1.5, color: currentTheme.currentColor())),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: currentTheme.currentColor(),
        ),
        disabledColor: Colors.grey[600],
        brightness: Brightness.light,
        indicatorColor: currentTheme.currentColor(),
        progressIndicatorTheme: const ProgressIndicatorThemeData()
            .copyWith(color: currentTheme.currentColor()),
        iconTheme: IconThemeData(
          color: Colors.grey[800],
          opacity: 1.0,
          size: 24.0,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.grey[800],
            brightness: Brightness.light,
            secondary: currentTheme.currentColor()),
      ),
      darkTheme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: currentTheme.currentColor(),
          cursorColor: currentTheme.currentColor(),
          selectionColor: currentTheme.currentColor(),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(width: 1.5, color: currentTheme.currentColor())),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: currentTheme.getCanvasColor(),
          foregroundColor: Colors.white,
        ),
        canvasColor: currentTheme.getCanvasColor(),
        cardColor: currentTheme.getCardColor(),
        dialogBackgroundColor: currentTheme.getCardColor(),
        progressIndicatorTheme: const ProgressIndicatorThemeData()
            .copyWith(color: currentTheme.currentColor()),
        iconTheme: const IconThemeData(
          color: Colors.white,
          opacity: 1.0,
          size: 24.0,
        ),
        indicatorColor: currentTheme.currentColor(),
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.white,
          secondary: currentTheme.currentColor(),
          brightness: Brightness.dark,
        ),
      ),
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ru', ''), // Russian
        Locale('pt', ''), // Portuguese, no country code
        Locale('id', ''), // Indonesia, no country code
      ],
      routes: {
        '/': (context) => initialFuntion(),
         '/listChat': (context) => const ListChatPage(),
        // '/startScreen': (context) => const StartScreenPage(),
        // // '/about': (context) => AboutScreen(),
        // // '/playlists': (context) => PlaylistScreen(),
        // // '/localplaylists': (context) => LocalPlaylistScreen(),
        // // '/mymusic': (context) => MyMusicPage(),
        // // '/nowplaying': (context) => NowPlaying(),
        // // '/recent': (context) => RecentlyPlayed(),
        // // '/downloads': (context) => const Downloads(),
        // '/splash': (context) => const SplashScreenPage(),
        // '/featured':
      },
      onGenerateRoute: (RouteSettings settings) {
        return HandleRoute().handleRoute(settings.name);
      },
    );
  }
}

// eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTA2ODEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJTdXBwb3J0IiwiZXhwIjoxNjY0OTU4MDcwfQ.qYtprp99AaKCnHiMp9G910-7TaAAfr3f6Eog8Hx5Tms
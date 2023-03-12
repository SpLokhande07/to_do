import 'package:todo_app/import_helper.dart';
import 'package:todo_app/splash_screen.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   // This is the theme of your application.
        //   //
        //   // Try running your application with "flutter run". You'll see the
        //   // application has a blue toolbar. Then, without quitting the app, try
        //   // changing the primarySwatch below to Colors.green and then invoke
        //   // "hot reload" (press "r" in the console where you ran "flutter run",
        //   // or simply save your changes to "hot reload" in a Flutter IDE).
        //   // Notice that the counter didn't reset back to zero; the application
        //   // is not restarted.
        //   primarySwatch: MaterialColor(kPrimaryColor.value, const {
        //     50: Color.fromRGBO(17, 28, 47, 0.1),
        //     100: Color.fromRGBO(17, 28, 47, 0.2),
        //     200: Color.fromRGBO(17, 28, 47, 0.3),
        //     300: Color.fromRGBO(17, 28, 47, 0.4),
        //     400: Color.fromRGBO(17, 28, 47, 0.5),
        //     500: Color.fromRGBO(17, 28, 47, 0.6),
        //     600: Color.fromRGBO(17, 28, 47, 0.7),
        //     700: Color.fromRGBO(17, 28, 47, 0.8),
        //     800: Color.fromRGBO(17, 28, 47, 0.9),
        //     900: Color.fromRGBO(17, 28, 47, 1),
        //   }),
        // ),
        home: const SplashScreen(),
      );
    });
  }
}

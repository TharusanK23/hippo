import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart'; // qXI7snoRtJVhQp1475Cg

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        routes: Routes.routes,
        home: const InitView());
  }
}

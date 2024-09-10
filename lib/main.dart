import 'package:flutter/material.dart';
import 'package:flutter_application_app/pages/bottom_nabigation_bar.dart';
// import 'package:flutter/services.dart';

void main() {
  //隱藏system_bottom_bar
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarPage(),
    );
  }
}

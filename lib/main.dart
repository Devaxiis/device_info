import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:info/screen.dart';

  final deviceInfoPlugin = DeviceInfoPlugin();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true,),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

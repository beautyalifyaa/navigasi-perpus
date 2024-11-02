import 'package:flutter/material.dart';
import 'package:navigasi_perpus/views/home_view.dart';
import 'package:navigasi_perpus/views/perpus_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perpustakaan',
      initialRoute: '/',
    routes: <String, Widget Function(BuildContext)>{
      '/dashboard':(BuildContext context)=>HomeView(),
      '/perpus':(BuildContext context)=>PerpusView(),
    }
      
    );
  }
}

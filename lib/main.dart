import 'package:defuline_app/pages/homepage.dart' show DeflineDashboard;
import 'package:defuline_app/pages/profilpage.dart';
import 'package:defuline_app/pages/splesscreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Mydefline());
}
class Mydefline extends StatefulWidget {
  const Mydefline({super.key});

  @override
  State<Mydefline> createState() => _MydeflineState();
}

class _MydeflineState extends State<Mydefline> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(home: SplashScreen(),debugShowCheckedModeBanner: false,);

  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:heart_voyage_new/tabs.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
  //debugPaintSizeEnabled = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh_cn')
  ];


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '心旅',
      builder: EasyLoading.init(),



      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 252, 223, 215)),
        useMaterial3: true,
      ),
      home: tabs(),
    );
  }
}


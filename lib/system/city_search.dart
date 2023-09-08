import 'package:flutter/material.dart';
import 'package:get/get.dart';

class city_search extends StatefulWidget {
  const city_search({super.key});


  @override
  State<city_search> createState() => _city_searchState();
}

class _city_searchState extends State<city_search> {
  String data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
    );
  }
}

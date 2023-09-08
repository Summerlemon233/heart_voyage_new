import 'package:flutter/material.dart';
import 'package:get/get.dart';

class friend_result extends StatefulWidget {
  const friend_result({super.key});

  @override
  State<friend_result> createState() => _friend_resultState();
}

class _friend_resultState extends State<friend_result> {
  late final code;
  @override
  void initState() {
    code = Get.arguments;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('扫描结果'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Text(code),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          setState(() {
            Get.to(new_diary());
          });
        },
        child: Icon(Icons.add),
      ),*/
    );;
  }
}

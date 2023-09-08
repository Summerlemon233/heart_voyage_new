import 'package:get/get.dart';
import 'package:flutter/material.dart';

class message extends StatefulWidget {
  const message({Key? key}) : super(key: key);

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的消息"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("欢迎来到“恣由”App！"),
              subtitle: Text("点击以查看使用指南"),
              onTap: (){
                setState(() {

                });
              },
            )
          ],
        ),
      ),
    );
  }
}

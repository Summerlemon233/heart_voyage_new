import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/system/friend.dart';

class pet extends StatefulWidget {
  const pet({super.key});

  @override
  State<pet> createState() => _petState();
}

class _petState extends State<pet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('心宠'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/rabbit.png')
                  )
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                Get.to(friend());
              });
            }, child: Text("我的好友"))
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
    );
  }
}

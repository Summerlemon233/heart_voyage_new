import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heart_voyage_new/pet/change_name.dart';
import 'package:heart_voyage_new/system/friend.dart';

class pet extends StatefulWidget {
  const pet({super.key});

  @override
  State<pet> createState() => _petState();
}

class _petState extends State<pet> {
  String returnPetName() {
    final _nameBox = GetStorage();
    if (_nameBox.read('namePet') != null) {
      return _nameBox.read('namePet');
    } else
      return '心旅兔';
  }

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
                      image: AssetImage('assets/images/rabbit.png'))),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    returnPetName(),
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    child: Text('更改昵称'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        Get.to(change_name());
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(),
            Container(),
            Container(
              padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Get.to(friend());
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.add_reaction_outlined), Text("我的好友")],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Get.to(friend());
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.message), Text("聊天")],
                  )),
            )
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

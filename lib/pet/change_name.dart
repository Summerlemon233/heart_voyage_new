import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class change_name extends StatefulWidget {
  const change_name({super.key});

  @override
  State<change_name> createState() => _change_nameState();
}

class _change_nameState extends State<change_name> {
  final titleController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    //contextController.dispose();
    titleController.dispose();
    super.dispose();
  }

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
                      image: AssetImage('assets/images/rabbit.png')
                  )
              ),
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              alignment: Alignment.center,
              child: Text(
                '当前心宠：${returnPetName()}',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: titleController,
                decoration: const InputDecoration(
                  focusColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: '简单描述一下心宠的新名字吧',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final _nameBox = GetStorage();
                      _nameBox.write('namePet', titleController.text);
                    });
                  },
                  child: Text("保存心宠昵称")),
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.2,
                  0,
                  MediaQuery.of(context).size.width * 0.2,
                  0),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

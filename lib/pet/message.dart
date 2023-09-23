import 'package:flutter/material.dart';

class message extends StatefulWidget {
  const message({super.key});

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,

        title: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('我的消息'),

          ],
        ),

      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: ListView(
            children: [
              ElevatedButton(onPressed: (){}, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.add_reaction_rounded),
                  Text('新的好友申请'),
                ],
              )),
              SizedBox(height: 20),
              Center(
                child: Text('暂时没有新的好友申请。\n去别处看看吧~',style: TextStyle(
                  fontSize: 20,
                ),textAlign: TextAlign.center,),
              )
              ,
            ],
          ),
        ),
      ),
    );
  }
}

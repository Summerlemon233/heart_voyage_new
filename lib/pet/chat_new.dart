import 'package:flutter/material.dart';

class chat_new extends StatefulWidget {


  @override
  State<chat_new> createState() => _chat_newState();
}

class _chat_newState extends State<chat_new> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('和心宠聊天'),
            IconButton(
                onPressed: () {
                  setState(() {

                    //init_data();
                  });
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}

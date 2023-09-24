import 'package:flutter/material.dart';

import '../system/userdata_func.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('日记'),
            IconButton(
                onPressed: () {
                  setState(() {
                    init_data();
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
          child: ListView(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/map.png'),
                  Positioned(
                    child: Text(
                      '无忧星',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Smiley Sans',
                          color: Color.fromARGB(255, 255, 189, 177)),
                    ),
                    left: MediaQuery.of(context).size.width * 0.46,
                    top: MediaQuery.of(context).size.height * 0.12,
                  ),
                  Positioned(
                    child: Text(
                      '内在星',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Smiley Sans',
                          color: Color.fromARGB(255, 255, 189, 177)),
                    ),
                    left: MediaQuery.of(context).size.width * 0.5,
                    top: MediaQuery.of(context).size.height * 0.45,
                  ),
                  Positioned(
                    child: Text(
                      '平静星',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Smiley Sans',
                          color: Color.fromARGB(255, 255, 189, 177)),
                    ),
                    left: MediaQuery.of(context).size.width * 0.78,
                    top: MediaQuery.of(context).size.height * 0.62,
                  ),
                  Positioned(
                    child: Text(
                      '喜悦星',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Smiley Sans',
                          color: Color.fromARGB(255, 255, 189, 177)),
                    ),
                    left: MediaQuery.of(context).size.width * 0.53,
                    top: MediaQuery.of(context).size.height * 0.95,
                  ),
                  Positioned(
                    child: Text(
                      '自由星',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Smiley Sans',
                          color: Color.fromARGB(255, 255, 189, 177)),
                    ),
                    left: MediaQuery.of(context).size.width * 0.23,
                    top: MediaQuery.of(context).size.height * 1.25,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

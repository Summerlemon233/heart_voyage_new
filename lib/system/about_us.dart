import 'package:flutter/material.dart';




class about_us extends StatefulWidget {
  const about_us({Key? key}) : super(key: key);

  @override
  State<about_us> createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(45, 73, 104, 1),
          foregroundColor: Colors.white,
          title: Text('关于我们')),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 90),
            Center(
                child: Container(
              height: 130,
              child: Image(
                image: AssetImage('assets/images/icon_round.png'),
              ),
            )),
            SizedBox(height: 40),
            Center(
                child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        Text(
                          "心旅",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "Version 0.3.0 预览版 \n2023/04/22",
                          style: TextStyle(
                              fontSize: 20, fontFamily: 'Helvetica_Neue'),
                        ),
                        Text(
                          "开发者：反内卷小队\n",
                          //"（参赛同学来自北京大学心理与认知科学学院、信息科学技术学院、光华管理学院）",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'Helvetica_Neue'),
                        ),
                        Text(
                          "主要开发者：",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'Helvetica_Neue'),
                        ),
                      ],
                    )
                )
            ),
            ListTile(
              leading: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/01.jpg'),
                  radius: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyanAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              title: Text("odwaga.",style: TextStyle(fontFamily: 'Helvetica_Neue'),),
            ),Divider(),
            ListTile(
              leading: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/02.jpg'),
                  radius: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyanAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              title: Text("宝铁.Botty",style: TextStyle(fontFamily: 'Helvetica_Neue'),),
            ),Divider(),
            ListTile(
              leading: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/03.jpg'),
                  radius: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyanAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              title: Text("梨pepe",style: TextStyle(fontFamily: 'Helvetica_Neue'),),
            ),Divider(),
            ListTile(
              leading: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/04.jpg'),
                  radius: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyanAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              title: Text("Summer_柠檬",style: TextStyle(fontFamily: 'Helvetica_Neue'),),
            ),Divider(),
            ListTile(
              leading: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/05.jpg'),
                  radius: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyanAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              title: Text("YANGYU",style: TextStyle(fontFamily: 'Helvetica_Neue'),),
            ),Divider(),
            Center(
              child: Text(
                "App的GitHub页面：\nhttps://github.com/Summerlemon233/Heart_Voyage",
                style: TextStyle(fontFamily: 'Helvetica_Neue'),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "本应用源码遵循MIT开源许可协议。\nSummer_lemon 3rd Software Project\nCopyright Summer_lemon 2023\n",
                style: TextStyle(fontFamily: 'Helvetica_Neue'),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

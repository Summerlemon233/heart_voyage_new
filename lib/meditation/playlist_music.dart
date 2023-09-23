import 'package:flutter/material.dart';
import 'package:get/get.dart';




import 'ZHENGNIAN/summer_pockets.dart';

class playlist_music extends StatefulWidget {
  const playlist_music({Key? key}) : super(key: key);

  @override
  State<playlist_music> createState() => _playlist_musicState();
}

class _playlist_musicState extends State<playlist_music> {
  @override
  Widget build(BuildContext context) {


    return practicePage();
    /*_pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "寻心",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: "心岛",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sailing),
            label: "扬帆",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_road),
            label: "航迹",
          )
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );*/

  }
}

class practicePage extends StatefulWidget {
  const practicePage({Key? key}) : super(key: key);

  @override
  State<practicePage> createState() => _practicePageState();
}

class _practicePageState extends State<practicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        foregroundColor: Colors.white,
        title: Text("静听一段纯音乐"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
         /* ListTile(
            leading: const AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/eden_album.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: const Text('lear earth'),
            subtitle: const Text('可获得的成长值：5分\n所需时长：5分05秒'),
            onTap: () => Get.to(lear_earth()),
          ),

          const Divider(),
          ListTile(
            leading: const AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/eden_album.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: const Text('Liberating'),
            subtitle: const Text('可获得的成长值：5分\n所需时长：2分41秒'),
            onTap: () => Get.to(liberating()),
          ),
          const Divider(),
          ListTile(
            onTap: ()
            {
              setState(() {
                Get.to(eye_level());
              });
            },
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/ef_album.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text('Eye level'),
            subtitle: Text('可获得的成长值：5分\n所需时长：2分02秒'),
          ),
          const Divider(),
          ListTile(
            onTap: ()
            {
              Get.to(piano_serenade());
            },
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/ef_album.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text('Piano Serenade'),
            subtitle: Text('可获得的成长值：5分\n所需时长：3分40秒'),
          ),
          const Divider(),
          //const Divider(),*/
          ListTile(
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/Summer_Pockets_island.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('Summer Pockets'),
            subtitle: Text('可获得的成长值：5分\n所需时长：4分00秒'),
            onTap: () => Get.to(summer_pockets()),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

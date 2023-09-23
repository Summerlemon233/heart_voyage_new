import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ZHENGNIAN/bird_noise.dart';
import 'ZHENGNIAN/forest_noise.dart';
import 'ZHENGNIAN/insect_noise.dart';
import 'ZHENGNIAN/night_noise.dart';
import 'ZHENGNIAN/white_noise.dart';


class playlist_noise extends StatefulWidget {
  const playlist_noise({Key? key}) : super(key: key);

  @override
  State<playlist_noise> createState() => _playlist_noiseState();
}

class _playlist_noiseState extends State<playlist_noise> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 4;
    /*final List<Widget> _pages = [
      const seekHeart(),
      const sailIsland(),
      const sailCanvas(),
      const sailTrack(),
      const practicePage(),
    ];*/

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
        title: Text("静听一段白噪音"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/bird.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: const Text('鸟鸣与森林之风'),
            subtitle: const Text('可获得的成长值：5分\n所需时长3分45秒'),
            onTap: () => Get.to(bird_noise()),
          ),
          const Divider(),
          ListTile(
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/night.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('夜晚'),
            subtitle: Text('可获得的成长值：5分\n所需时长3分38秒'),
            onTap: () => Get.to(night_noise()),
          ),
          const Divider(),
          ListTile(
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/insect.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('乡间虫鸣'),
            onTap: () => Get.to(insect_noise()),
            subtitle: Text('可获得的成长值：5分\n所需时长3分38秒'),
          ),
          const Divider(),
          ListTile(
            onTap: ()
            {
              setState(() {
                Get.to(white_noise());
              });
            },
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/album.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('水之诗'),
            subtitle: Text('可获得的成长值：5分\n所需时长：7分20秒'),
          ),
          const Divider(),
          ListTile(
            onTap: ()
            {
              Get.to(forest_noise());
            },
            leading: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage('assets/images/forest.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('森林实地录音'),
            subtitle: Text('可获得的成长值：5分\n所需时长：1分10秒'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

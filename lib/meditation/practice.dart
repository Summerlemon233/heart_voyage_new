import 'package:flutter/material.dart';
import 'package:get/get.dart';


class practice extends StatefulWidget {
  const practice({Key? key}) : super(key: key);

  @override
  State<practice> createState() => _practiceState();
}

class _practiceState extends State<practice> {
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
        title: Text("情绪调节"),
      ),
      body: ListView(
        children: [
          /*const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const SizedBox(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage('assets/images/ZHENGNIAN.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: const Text('正念系列'),
            subtitle: const Text('可获得的成长值：10分'),
            onTap: () => Get.to(ZHENGNIAN()),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage('assets/images/sport.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('运动解压打卡'),
            subtitle: Text('可获得的成长值：10分'),
            onTap: () => Get.to(sports()),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage('assets/images/pure_music.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('静听一段纯音乐'),
            onTap: () => Get.to(playlist_music()),
            subtitle: Text('可获得的成长值：5分\n所需时长：4分00秒'),
          ),
          const Divider(),
          *//*const ListTile(
            leading: SizedBox(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage('assets/images/massage.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('按摩舒缓'),
            subtitle: Text('可获得的成长值：5分\n所需时长：7分35秒'),
          ),*//*
          //const Divider(),
          ListTile(
            onTap: ()
            {
              Get.to(playlist_noise());
            },
            leading: SizedBox(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage('assets/images/white_noise.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text('静听一段白噪音'),
            subtitle: Text('可获得的成长值：5分\n所需时长：7分20秒'),
          ),
          const Divider(),*/
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ZHENGNIAN/ZHENGNIAN_breathe.dart';
import 'ZHENGNIAN/ZHENGNIAN_grape.dart';
import 'ZHENGNIAN/ZHENGNIAN_scan.dart';
import 'ZHENGNIAN/ZHENGNIAN_sit.dart';
import 'ZHENGNIAN/ZHENGNIAN_space.dart';


class ZHENGNIAN extends StatefulWidget {
  const ZHENGNIAN({Key? key}) : super(key: key);

  @override
  State<ZHENGNIAN> createState() => _ZHENGNIANState();
}

class _ZHENGNIANState extends State<ZHENGNIAN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('正念'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: const practicePage(),
    );
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
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: AssetImage('assets/images/breathe_album.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: const Text('正念觉察呼吸'),
          subtitle: const Text('所需时长：12分36秒'),
          onTap: () => Get.to(ZHENGNIAN_breathe()),
        ),
        const Divider(),
        ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: AssetImage('assets/images/grape_album.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Text('正念进食葡萄干'),
          subtitle: Text('所需时长：17分52秒'),
          onTap: () => Get.to(ZHENGNIAN_grape()),
        ),
        const Divider(),
        ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: AssetImage('assets/images/body_scan_album.jpeg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Text('正念扫描身体'),
          subtitle: Text('所需时长：15分53秒'),
          onTap: () => Get.to(ZHENGNIAN_scan()),
        ),
        const Divider(),
        ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: AssetImage('assets/images/sit_album.jpeg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Text('正念静坐'),
          subtitle: Text('所需时长：14分57秒'),
          onTap: () => Get.to(ZHENGNIAN_sit()),
        ),
        const Divider(),
        ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: AssetImage('assets/images/breathe_space_album.jpeg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Text('三步呼吸空间'),
          subtitle: Text('所需时长：1分56秒'),
          onTap: () => Get.to(ZHENGNIAN_space()),
        ),
        const Divider(),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text('注：该正念系列音频由北京大学心理与认知科学学院刘兴华研究员课题组提供'),
        )

      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tabs.dart';

class treehole_animation extends StatefulWidget {
  @override
  _treehole_animationState createState() => _treehole_animationState();
}

class _treehole_animationState extends State<treehole_animation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scaleAnimation;
  late final Animation<double> opacityAnimation;
  late final Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化控制器并定义持续时间
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    // 创建缩放动画
    scaleAnimation = Tween<double>(begin: 1, end: 0.5).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    // 创建淡入动画
    opacityAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    // 创建位移动画
    slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(1.4, -1.4))
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInCubic));

    // 启动动画控制器
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        foregroundColor: Colors.white,
        title: Text('吐苦水树洞'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: FadeTransition(
              opacity: opacityAnimation,
              child: Text(
                "整理好心情\n继续出发吧",
                style: TextStyle(fontSize: 40,color: Color.fromRGBO(215, 169, 83, 1),fontStyle: FontStyle.italic),

              ),
            ),
          ),
          SlideTransition(
            position: slideAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
   /**/             alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/plane.png"),
                        fit: BoxFit.fitWidth)),
                //color: Colors.blue,
              ),
            ),
          ),
          Center(
              child: FadeTransition(
            opacity: opacityAnimation,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image(
                  image: AssetImage("assets/images/treehole.png"),
                )),
          )),
          Center(
            child: FadeTransition(
                opacity: opacityAnimation,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Get.back();
                        Get.back();
                      });
                    },
                    child: Text("点我返回"))),
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    // 销毁控制器
    controller.dispose();
    super.dispose();
  }
}

/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage/pages/tabs.dart';

class treehole_animation extends StatefulWidget {
  const treehole_animation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _treehole_animationState();
}

class _treehole_animationState extends State<treehole_animation>
    with SingleTickerProviderStateMixin {
  /// 可重复播放，持续时间为5秒的动画控制器
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(

      duration: const Duration(seconds: 5),
      vsync: this,
    );

    //启动动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("吐苦水树洞"),),
      /// 计算容器的尺寸
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size biggest = constraints.biggest;

          /// 需要平移的Widget 宽高
          const childHeight = 100.0;
          const childWidth = 100.0;

          /// 平移后Widget 变成0.25倍大小
          const targetChildHeight = childHeight / 5;
          const targetChildWidth = childWidth / 5;

          /// 计算起始位置 中间 -> 右上角
          /// 根据自身大小，以及父布局大小获取相对位置
          var beginRect = RelativeRect.fromSize(
            Rect.fromLTWH(
                biggest.width / 2, biggest.height / 2, childWidth, childHeight),
            biggest,
          );

          var endRect = RelativeRect.fromSize(
            Rect.fromLTWH(
              biggest.width - targetChildWidth,
              0,
              targetChildWidth,
              targetChildHeight,
            ),
            biggest,
          );

          /// 补间动画
          final rectAnimation =
              RelativeRectTween(begin: beginRect, end: endRect)
                  .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 0.5, curve: Curves.easeInOutCubic),
          ));
          final appearAnimation =
              Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1.0, curve: Curves.easeInOutCubic),
          ));

          return Stack(
            children: [
              PositionedTransition(
                rect: rectAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/plane.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Opacity(
                opacity: appearAnimation.value,
                child: Column(
                  children: [
                    Text("整理好心情，/n继续出发吧。"),
                    Image(image: AssetImage("assets/images/treehole.png")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Get.to(Tabs());
                          });
                        },
                        child: Text("点我返回"))
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}*/

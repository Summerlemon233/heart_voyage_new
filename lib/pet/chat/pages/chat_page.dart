import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/chat.dart';
import '../components/conversation.dart';

class chat extends GetResponsiveView {
  @override
  Widget? phone() {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(

        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('和心宠聊天'),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Get.back();
              },
            ),

          ],
        ),

      ),
      drawer: const ConversationWindow(),
      body: const ChatWindow(),
    );
  }

  @override
  Widget? desktop() {
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
      body: Row(
        children: const [
          ConversationWindow(),
          Expanded(child: ChatWindow()),
        ],
      ),
    );
  }

  @override
  Widget? builder() {
    return super.builder();
  }

  // @override
  // Widget builder() {
  //   bool useTabs = screen.isPhone || screen.isTablet;
  //   return Scaffold(
  //     appBar: useTabs
  //         ? AppBar(
  //             title: Text('appTitle'.tr),
  //           )
  //         : null,
  //     drawer: useTabs ? const ConversationWindow() : null,
  //     body: Stack(
  //       children: [
  //         useTabs
  //             ? Row(
  //                 children: const [
  //                   ChatWindow(),
  //                 ],
  //               )
  //             : Row(
  //                 children: const [ConversationWindow(), ChatWindow()],
  //               ),
  //       ],
  //     ),
  //   );
  // }
}

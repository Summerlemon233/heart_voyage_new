import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/system/settings.dart';

import '../controller/conversation.dart';
import '../controller/message.dart';
import '../pages/chat_setting.dart';
import '../repository/conversation.dart';

class ConversationWindow extends StatelessWidget {
  const ConversationWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: const Border(right: BorderSide(width: .1))),
      constraints: const BoxConstraints(maxWidth: 300),
      child: GetX<ConversationController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.conversationList.isEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "您之前似乎没有会话。\n点击下面创建一个，\n或键入提示来创建一个。",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: controller.conversationList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1,
                          child: ListTile(
                            onTap: () {
                              _tapConversation(index);
                            },
                            selected:
                                controller.currentConversationUuid.value ==
                                    controller.conversationList[index].uuid,
                            leading: Icon(
                              Icons.chat,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            title: Text(
                              controller.conversationList[index].name,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            trailing: Builder(builder: (context) {
                              return IconButton(
                                  onPressed: () {
                                    //显示一个overlay操作
                                    _showConversationDetail(context, index);
                                  },
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ));
                            }),
                          ),
                        );
                      },
                    ),
                  ),
            const Divider(thickness: .5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      onTapNewConversation();
                      closeDrawer();
                    },
                    label: Text("创建新会话"),
                    icon: const Icon(Icons.add_box),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  /*GetX<SettingsController>(builder: (controller) {
                    return TextButton.icon(
                      onPressed: () {},
                      label: Text("Version：${controller.version.value}"),
                      icon: const Icon(Icons.info),
                    );
                  }),
                  const SizedBox(
                    height: 6,
                  ),*/
                  TextButton.icon(
                    onPressed: () {
                      closeDrawer();
                      Get.to(chat_settings());
                    },
                    label: Text('设置'),
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  void _showConversationDetail(BuildContext context, int index) {
    final ConversationController controller = Get.find();
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: "delete",
          child: Text('删除'),
        ),
        PopupMenuItem(
          value: "rename",
          child: Text('重命名'),
        ),
      ],
    ).then((value) {
      if (value == "delete") {
        controller.deleteConversation(index);
      } else if (value == "rename") {
        _renameConversation(context, index);
      }
    });
  }

  void onTapNewConversation() {
    ConversationController controller = Get.find();
    controller.setCurrentConversationUuid("");
    MessageController messageController = Get.find();
    messageController.loadAllMessages("");
  }

  void _renameConversation(BuildContext context, int index) {
    final ConversationController conversationController = Get.find();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController controller = TextEditingController();
        controller.text = conversationController.conversationList[index].name;
        return AlertDialog(
          title: Text("重命名会话",),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "输入新的名字",
                  hintText: "输入新的名字",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
                autovalidateMode: AutovalidateMode.always,
                maxLines: null,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                conversationController.renameConversation(Conversation(
                  name: controller.text,
                  description: "",
                  uuid: conversationController.conversationList[index].uuid,
                ));
                Navigator.of(context).pop();
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
  }

  _tapConversation(int index) {
    ConversationController controller = Get.find();
    closeDrawer();
    String conversationUUid = controller.conversationList[index].uuid;
    controller.currentConversationUuid(conversationUUid);
    MessageController controllerMessage = Get.find();
    controllerMessage.loadAllMessages(conversationUUid);
  }

  void closeDrawer() {
    if (GetPlatform.isMobile) {
      Get.back();
    }
  }
}

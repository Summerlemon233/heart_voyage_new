import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import './about_us.dart';
import './friend.dart';
import './login.dart';
import './userdata.dart';
import '../pet/chat/controller/settings.dart';
import 'change_avatar.dart';
import 'common_image.dart';
import 'userdata_func.dart';

class settings extends StatefulWidget {
  //final String username;

  //settings({required this.username});

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool isDarkMode = Get.isDarkMode;
  AssetEntity? _avatar;

  //bool _tmp = Get.isDarkMode;
  bool _switchSelected = Get.isDarkMode;

  /*Future<void> _pickAvatar() async {
    final result = await AssetPicker.pickAssets(context, maxAssets: 1);
    if (result != null && result.isNotEmpty) {
      setState(() => _avatar = result.first);
    }
  }*/
  @override
  @override
  Widget build(BuildContext context) {
    var _readPhotoPath_avatar_var = readPhotoPath_avatar();
    bool _isSelectedAvatar = !(PhotoPath_avatar[0] == "");
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 223, 215),

        //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
        appBar: AppBar(
          //backgroundColor: Color.fromRGBO(45, 73, 104, 1),
          //foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 255, 189, 177),
          foregroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('设置'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      loadBasicData();
                      readPhotoPath_avatar();
                    });
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
        ),
        body: GetX<SettingsController>(builder: (controller) {
          return ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: GestureDetector(
                          child: Obx(
                            () => _isSelectedAvatar
                                ? Avatar(
                                    image: imageFromFile(PhotoPath_avatar[0])
                                        .image)
                                : Avatar(
                                    image: AssetImage(
                                        'assets/images/not_login.png')),
                          ),
                          onTap: () {
                            setState(() {
                              Get.to(change_avatar());
                            });
                          }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      "${basicData['username']}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      blurStyle: BlurStyle.outer,
                      offset: Offset.zero,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Divider(),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('我的好友'),
                onTap: () {
                  setState(() {
                    Get.to(friend());
                  });
                  // 点击我的好友后的操作
                  print('我的好友');
                },
              ),
              Divider(),
              Text('“与心宠聊天”有关设定',style: TextStyle(color: Colors.black26),),
              //Divider(),

              SwitchListTile(
                  title: Text(
                    "使用流式(Stream) API",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  value: controller.useStream.value,
                  onChanged: (value) {
                    controller.setUseStream(value);
                  }),

              const SizedBox(
                height: 20,
              ),
              controller.llm.value == "OpenAI"
                  ? TextFormField(
                      initialValue: controller.openAiKey.value,
                      decoration: InputDecoration(
                        labelText: "更改OpenAI API Key（如果能正常使用可不更改）",
                        hintText: "请输入您的OpenAI API Key（如果能正常使用可不更改）",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(Get.context!).colorScheme.primary),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        /*suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: controller.isObscure.value
                              ? Colors.grey
                              : Colors.blue,
                        ),
                        onPressed: () {
                          controller.isObscure.value =
                              !controller.isObscure.value;
                        },
                      ),*/
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      maxLines: 1,
                      onChanged: (value) => {
                        controller.setOpenAiKey(value),
                        OpenAI.apiKey = value,
                      },
                      onFieldSubmitted: (value) {
                        controller.setOpenAiKey(value);
                      },
                      obscureText: controller.isObscure.value,
                    )
                  : const SizedBox(),
              controller.llm.value == "OpenAI"
                  ? const SizedBox(
                      height: 20,
                    )
                  : const SizedBox(),
              controller.llm.value == "OpenAI" || controller.llm.value == "You"
                  ? DropdownButtonFormField(
                      value: controller.openAiBaseUrl.value,
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "设置响应服务器域名",
                        hintText: "请在这里设置反向代理URL",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(Get.context!).colorScheme.primary),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                      items: <String>[
                        "https://www.heartvoyage.live",
                        'https://api.openai.com',
                        'https://ai.fakeopen.com',
                        'https://api.openai-proxy.com',
                        'https://bard.brzhang.club/api/chat'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value, // 缩短显示文本
                            overflow: TextOverflow.ellipsis, // 超出长度省略号显示
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == null) return;
                        controller.setOpenAiBaseUrl(newValue);
                      },
                    )
                  : const SizedBox(),
              controller.llm.value == "OpenAI" || controller.llm.value == "You"
                  ? const SizedBox(
                      height: 20,
                    )
                  : const SizedBox(),
              controller.llm.value == "OpenAI" || controller.llm.value == "You"
                  ? DropdownButtonFormField(
                      value: controller.gptModel.value,
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "选择大语言模型",
                        hintText: "选择大语言模型",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(Get.context!).colorScheme.primary),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                      items: <String>[
                        'gpt-3.5-turbo',
                        /*'gpt-3.5-turbo-16k',
                      'gpt-4',
                      'gpt-4-0314',
                      'claude-instant-100k'*/
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == null) return;
                        controller.setGptModel(newValue);
                      })
                  : const SizedBox(),
              /*ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('切换主题'),
            onTap: () {
              // 点击切换主题后的操作
              print('切换主题');
            },
          ),*/
              /*SwitchListTile(
            secondary: Icon(Icons.nightlight_round),
            title: Text('夜间模式'),
            onChanged: (value) {
              setState(() {
                Get.changeThemeMode(_switchSelected? ThemeMode.dark : ThemeMode.light);
                  _switchSelected = !_switchSelected;
              });
              // 切换夜间模式后的操作
              //print('夜间模式：$value');
            },
            value: _switchSelected,
          ),*/
              /*SwitchListTile(
            secondary: Icon(Icons.nightlight_round),
            title: Text('夜间模式'),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
                Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
              });
            },
          ),*/Divider(),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('关于我们'),
                onTap: () {
                  setState(() {
                    Get.to(about_us());
                  });
                  // 点击退出登录后的操作
                  //log_out;
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('退出登录'),
                onTap: () {
                  setState(() {
                    final _loginStateValidator = GetStorage();
                    _loginStateValidator.write('isLogin', false);
                    Get.offAll(login());
                  });
                  // 点击退出登录后的操作
                  //log_out;
                  print('退出登录');
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text('关闭应用'),
                onTap: () {
                  setState(() {
                    saveBasicData();
                    SystemNavigator.pop();
                  });
                },
              ),
              Divider(),
            ],
          );
        })
    );
  }
}

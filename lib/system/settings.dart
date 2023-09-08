import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import './about_us.dart';
import './friend.dart';
import './login.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import './common_widgets.dart';
import './userdata.dart';
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
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        //backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        //foregroundColor: Colors.white,
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
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          GestureDetector(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: _isSelectedAvatar
                        ? Avatar(image: imageFromFile(PhotoPath_avatar[0]).image)
                        : Avatar(image: AssetImage('assets/images/not_login.png')),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                  Text("${basicData['username']}",style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                Get.to(change_avatar());
              });
            },
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
          ),*/
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('关于我们'),
            onTap: () {
              setState(() {
                Get.to(about_us());
              });
              // 点击退出登录后的操作
              //log_out;
              print('退出登录');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('退出登录'),
            onTap: () {
              setState(() {});
              // 点击退出登录后的操作
              //log_out;
              print('退出登录');
              Get.offAll(login());
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
      ),
    );
  }
}

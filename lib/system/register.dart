import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './change_avatar_register.dart';
import './login.dart';
import './userdata_func.dart';


import './userdata.dart';
import 'common_image.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  late Map _temp;
  late var _validateKey;
  late var _validateUrl;
  TextEditingController _controllerMail = new TextEditingController();
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();
  TextEditingController _controllerRePwd = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  String? _emailReg, _passwordReg, _userNameReg;

  bool _isObscure = true;
  Color _eyeColor = Colors.grey;
  final List _loginMethod = [
    {
      "title": "wechat",
      "icon": Icons.wechat,
    },
  ];
  @override
  void initState() {
    //graphValidationInit();
    // TODO: implement initState
    super.initState();
  }
  /*void graphValidationInit(){
    _temp = Apifm.graphValidateCodeUrl();
    _validateKey = _temp["key"];
    _validateUrl = _temp["imageUrl"];
  }*/

  /*bool confirm_if_unique() //async
  {
    if(userdata.totalNum == 0) return true;
    else
    {
    }
  }
// 设置持久化数据
  void _setData() async {
    // 实例化
    if(userdata.totalNum == 0){
    SharedPreferences? userdata_stored= await SharedPreferences.getInstance();
    }
    // 设置string类型
    var totalNum
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        foregroundColor: Colors.white,
        title: const Text("注册"),
      ),
      body: Form(
        key: _formKey, // 设置globalKey，用于后面获取FormStat
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
            buildTitle(), // Login
            buildTitleLine(), // Login下面的下划线
            const SizedBox(height: 50),
            buildUserName(), //用户名
            const SizedBox(
              height: 30,
            ),
            buildEmailTextField(), // 输入邮箱
            const SizedBox(height: 30),
            buildPasswordTextField(context), // 输入密码
            const SizedBox(height: 30),
            buildConfirmPasswordTextField(context), // 确认密码



            const SizedBox(height: 30),
            const SizedBox(height: 60),

            const SizedBox(height: 40),
            buildRegisterText(context), // 注册
          ],
        ),
      ),
    );
  }

  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            width: 40,
            height: 2,
          ),
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '注册',
          style: TextStyle(fontSize: 42),
        ));
  }

  Widget buildRegisterText(context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(45, 73, 104, 1),),
              // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(

                  side: BorderSide(style: BorderStyle.none)))),
          child:
          Text('注册', style: Theme.of(context).primaryTextTheme.headlineSmall,),

          onPressed: () {
            _emailReg = _controllerMail.text;
            _userNameReg = _controllerName.text;
            if (_controllerPwd.text != _controllerRePwd.text) {
              Get.snackbar('提示', '您的确认密码输入有误。请重新输入。');
              return;
            }
            _passwordReg = _controllerPwd.text;
            if (_emailReg != null &&
                _passwordReg != null &&
                _userNameReg != null) {
              //User userReg = new User(_userNameReg, _passwordReg, _emailReg);
              basicData['username'] = _userNameReg;
              basicData['email'] = _emailReg;
              basicData['password'] = _passwordReg;
              basicData['isLogin'] = true;
              saveBasicData();

              //IO_Data.writeData(userReg);
              //SharedPreferenceUtil.saveUser(userReg);
              //print(SharedPreferenceUtil.checkUser(userReg));
              if (/*IO_Data.checkUser(userReg)==  */ true) {
                print('signin_success');
                Future.delayed(Duration(milliseconds: 10), () {
                  selectedAsset_avatar = null;
                  Get.to(change_avatar_register());
                });
              }
            }
          },
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        style: TextStyle(
          fontFamily: "Helvetica_Neue",
        ),
        obscureText: _isObscure,
        // 是否显示文字
        onSaved: (v) => _passwordReg = v!,
        controller: _controllerPwd,
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入密码，长度请控制在8-16个字符之间。';
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            labelText: "密码",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildConfirmPasswordTextField(BuildContext context) {
    return TextFormField(
        style: TextStyle(
          fontFamily: "Helvetica_Neue",
        ),
        controller: _controllerRePwd,
        obscureText: _isObscure,
        // 是否显示文字
        validator: (v) {
          if (v!.isEmpty) {
            return '请再次确认密码。';
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            labelText: "确认密码",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildMobileTextField() {
    return TextFormField(
      style: TextStyle(
        fontFamily: "Helvetica_Neue",
      ),
      controller: _controllerMail,
      decoration: const InputDecoration(labelText: '手机号',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),),
      validator: (v) {
        var mobileReg = RegExp(
            "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$");
        if (!mobileReg.hasMatch(v!)) {
          return '请输入正确的手机号码';
        }
        return null;
      },
      //onSaved: (v) => _emailReg = v!,
    );
  }

  Widget buildEmailTextField() {
    return TextFormField(
      style: TextStyle(
        fontFamily: "Helvetica_Neue",
      ),
      controller: _controllerMail,
      decoration: const InputDecoration(labelText: '邮箱地址',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),),
      validator: (v) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(v!)) {
          return '请输入正确的邮箱地址';
        }
        return null;
      },
      onSaved: (v) => _emailReg = v!,
    );
  }

  Widget buildUserName() {
    return TextFormField(
      style: TextStyle(
        fontFamily: "Helvetica_Neue",
      ),
      controller: _controllerName,
      decoration: const InputDecoration(labelText: '用户名',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),),
      validator: (v) {
        if (v!.isEmpty) {
          return '请输入正确的用户名';
        }
        return null;
      },
      onSaved: (v) => _userNameReg = v!,
    );
  }


}

//   TextEditingController _controllerMail = new TextEditingController();
//   TextEditingController _controllerPwd = new TextEditingController();
//   TextEditingController _controllerRePwd = new TextEditingController();
//
//   void _userRegister() {
//       _email=_controllerMail.text;
//       _password=_controllerPwd.text;
//       _password_confirm=_controllerRePwd.text;
//
//       if (_formKey.currentState.validate()) {
//         save();//使用sharedPreferences存储数据
//         Navigator.pop(context);//返回到登陆页面
//       }
//   }



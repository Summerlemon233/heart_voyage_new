import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './register.dart';
import './userdata.dart';
import './userdata_func.dart';

class forgotpwsd extends StatefulWidget {
  const forgotpwsd({Key? key}) : super(key: key);

  @override
  _forgotpwsdState createState() => _forgotpwsdState();
}

class _forgotpwsdState extends State<forgotpwsd> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _loginEmail, _loginPassword;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;
  final List _loginMethod = [
    {
      "title": "wechat",
      "icon": Icons.wechat,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        foregroundColor: Colors.white,
        title: const Text("忘记密码"),
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
            const SizedBox(height: 60),
            buildEmailTextField(), // 输入邮箱
            const SizedBox(height: 30),
            buildPasswordTextField(context), // 忘记密码
            const SizedBox(height: 60),
            buildLoginButton(context), // 登录按钮

            // 其他登录方式
          ],
        ),
      ),
    );
  }

  Widget buildRegisterText(context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
            // 设置圆角
            shape: MaterialStateProperty.all(
                const StadiumBorder(side: BorderSide(style: BorderStyle.none))),
            //backgroundColor: MaterialStateProperty.all(Colors.white),
            //foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: Text(
            '注册',
            style: Theme.of(context).primaryTextTheme.headline5,
          ),
          onPressed: () {
            setState(() {
              Get.to(register());
            });
          },
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
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
              Text('重置密码', style: Theme.of(context).primaryTextTheme.headline5),
          onPressed: () {
            setState(() {
              // 表单校验通过才会继续执行
              (_formKey.currentState as FormState).save();
              //TODO 执行更改密码方法
              loadBasicData();
              basicData['password'] = _loginPassword;
              saveBasicData();
              Get.snackbar('提示', '重置密码成功！即将返回主页面。');
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  Get.back();
                });
              });
            });
            /*User judgeUser = new User('', _loginPassword, _loginEmail);
                print('&&&&& ${IO_Data.checkUserLogin(judgeUser).runtimeType}');
                IO_Data.checkUserLogin(judgeUser);
                print("${IO_Data.isLoginFlag}*&&");
                if (IO_Data.isLoginFlag == true) //登录成功
                    {

                }*/
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
        onSaved: (v) => _loginPassword = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入新密码';
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            labelText: "密码",
            labelStyle: TextStyle(
              fontFamily: "Helvetica_Neue",
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildEmailTextField() {
    return TextFormField(
      style: TextStyle(
        fontFamily: "Helvetica_Neue",
      ),
      decoration: InputDecoration(
        enabled: true,
        labelText: '之前注册的邮箱地址 ${basicData['email']}',
        labelStyle: TextStyle(
          fontFamily: "Helvetica_Neue",
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      validator: (v) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(v!)) {
          return '请输入正确的邮箱地址';
        }
      },
      onSaved: (v) => _loginEmail = v!,
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
          '忘记密码',
          style: TextStyle(fontSize: 42),
        ));
  }
}

/*class LoginController extends GetxController {
  //登陆按钮点击事件
  login(TextEditingController userNameController,
      TextEditingController passWordController) {
    var userName = userNameController.text;
    var passWord = passWordController.text;

    //1-用户协议是否勾选
    if (!isChecked.value) {
      Get.snackbar('用户协议未选中。', '请勾选用户协议。',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    //2-用户名判断
    if (userName.isEmpty) {
      Get.snackbar(
          '用户名异常', '用户名为空', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    //3-密码判断
    if (passWord.isEmpty) {
      Get.snackbar('密码异常', '密码为空', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.snackbar(
        '用户名、密码正确', '去登陆', snackPosition: SnackPosition.BOTTOM);
    print("用户名:$userName,密码：$passWord");
  }

  //用户协议勾选事件
  var isChecked = false.obs;

  void changeChecked(bool value) {
    isChecked.value = value;
  }
}

late LoginController controller = Get.put(LoginController());


//登陆界面
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var userNameController = TextEditingController();
  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80), //距离顶部距离
            buildTopWidget(), //设置登陆欢迎
            const SizedBox(height: 20), //距离上一个View距离
            buildAccountInputWidget(userNameController), //用户名
            const SizedBox(height: 20), //距离上一个View距离
            buildPasswordInputWidget(passWordController), //密码
            const SizedBox(
              height: 10,
            ), //距离上一个View距离
            buildPrivacyWidget(), //隐私政策
            const SizedBox(
              height: 10,
            ), //距离上一个View距离
            buildLoginButton(),
            const SizedBox(
              height: 10,
            ),
            buildRegisterButton(),
            const SizedBox(
              height: 10,
            ),
            //注册按钮
          ],
        ),
      ),
    );
  }

//Widget-Top
  Widget buildTopWidget() {
    return const Text(
      "欢迎登录",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
    );
  }

//手机号
  Widget buildAccountInputWidget(TextEditingController? userNameController) {
    return TextField(
      controller: userNameController,
      decoration: InputDecoration(labelText: "用户名（邮箱地址）"),
      style: TextStyle(fontSize: 16),
      keyboardType: TextInputType.phone,
    );
  }

//密码
  Widget buildPasswordInputWidget(TextEditingController? passWordController) {
    return TextField(
      controller: passWordController,
      obscureText: true,
      decoration: InputDecoration(labelText: "密码"),
      style: TextStyle(fontSize: 16),
    );
  }

//登陆按钮
  Widget buildLoginButton() {
    return SizedBox(
      child: ElevatedButton(
        child: new Text("登录"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            //Colors.blue,
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //圆角大小
            )),
        onPressed: () =>
            controller.login(userNameController, passWordController),
      ),
      width: double.infinity,
    );
  }

  Widget buildRegisterButton() {
    return SizedBox(
      child: ElevatedButton(
        child: new Text("没有账号？注册"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            //Colors.blue,
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //圆角大小
            )),
        onPressed: () =>
            Get.to(register()),
      ),
      width: double.infinity,
    );
  }

  //隐私协议
  Widget buildPrivacyWidget() {
    return Row(
      children: [
        Obx(() =>
            Checkbox(
                value: controller.isChecked.value,
                onChanged: (value) => controller.changeChecked(value!))),
        Text('同意', style: TextStyle(fontSize: 14)),
        Text('<服务协议>', style: TextStyle(fontSize: 14, color: Colors.blue)),
        Text('<隐私政策>', style: TextStyle(fontSize: 14, color: Colors.blue))
      ],
    );
  }


}*/

/*class login extends StatelessWidget {

}*/

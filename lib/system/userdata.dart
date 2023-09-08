import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import './userdata_func.dart';

/*List<dynamic> star = [
  ["number","date","image_id","title","context","used_time",
    "1_selected","2_selected","3_selected","4_selected","5_selected",
    "6_selected","7_selected","8_selected",],
];*/


/*class UserState {
  static bool isLogin = false;
  static String CurrUsername = "您暂时还未登录";
  static String CurrEmail = "";
  //static int score = 0;
  static String CurrProvince = "四川";
  static String CurrCity = "成都";
  static int CurrPet = 0;//0-dog,1-fox,2-wolf,3-rabbit
  static bool isTodaysigned = false;
  static double moodScore = 0;
  static int mood_cache_case = 0;
  static int star_case = 0;
}*/

class basicData_management extends GetxController {

}

Map<String,dynamic> basicData = {
  'isLogin':false,
  'username': '您暂时还未登录',
  'cellphone':'',
  'password':'',//暂时采用明文存储方式
  'friendCode':'00000',
  'score': 0,
  'note_case':0,
  'isSigned' : false,
  'date_mood':["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",],
  'title_mood':["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",],
  'context_mood':["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",],
  'province':["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",],
  'location':["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",],
}.obs;

//存储“我的星星”部分的数据，限定最高存储10条。

void refreshStarData()
{
  //先置为0
  for(int i = 1;i <= 9;i++)
  {
    basicData["${i}_pt"] = 0;
  }
  for(int i = 0;i < star_data.length;i++)
  {
    for(int j = 1;j <= 9;j++)
    {
      if(star_data[i]["${j}_selected"])
      {
        basicData["${j}_selected"]++;
      }
    }
  }
}





class User {
  String? _username;
  String? _password;
  String? _email;

  User(this._username, this._password, this._email);

  get username => _username;

  get password => _password;

  get email => _email;

/*@override
  String toString() {
    return "|$_username $_email $_password|";
  }*/
}

class IO_Data {
  static bool isLoginFlag = false;

  static Future<String> get localPath async {
    final _path = await getApplicationDocumentsDirectory();
    return _path.path;
  }

  static Future<File> get localFile async {
    final path = await localPath;
    print(path);
    return File('$path/data.txt');
  }

  static Future<File> writeData(User currUser) async {
    final file = await localFile;

    return file.writeAsString(
        'userNum。0。username【${currUser.username}】email“${currUser.email}”password‘${currUser.password}’');
    //对应徽标:编号为。 用户名为【】 邮箱为“” 密码为‘’
  }

  static Future<Map> readData() async {
    final file = await localFile;

    String contents = await file.readAsString();
    print(contents);
    //对contents的操作

    //userNum
    int first_usernum = contents.indexOf('。');
    int last_usernum = contents.lastIndexOf('。');
    print(contents.substring(first_usernum + 1, last_usernum));
    int userNum =
        int.parse(contents.substring(first_usernum + 1, last_usernum));
    //username
    int first_username = contents.indexOf('【');
    int last_username = contents.lastIndexOf('】');
    print(contents.substring(first_username + 1, last_username));
    String username = contents.substring(first_username + 1, last_username);

    //email
    int first_email = contents.indexOf('“');
    int last_email = contents.lastIndexOf('”');
    print(contents.substring(first_email + 1, last_email));
    String email = contents.substring(first_email + 1, last_email);
    //password
    int first_pswd = contents.indexOf('‘');
    int last_pswd = contents.indexOf('’');
    print(contents.substring(first_pswd + 1, last_pswd));
    String pswd = contents.substring(first_pswd + 1, last_pswd);
    return {
      "userNum": userNum,
      "userName": username,
      "email": email,
      "password": pswd,
    };
  }

  static Future checkUser(User judgeUser) async {
    Future<Map> readUser_tmp = readData();
    Map readUser = await readUser_tmp;
    if (judgeUser.username == readUser['userName'] &&
        judgeUser.email == readUser['email'] &&
        judgeUser.password == readUser['password']) {
      return true;
    } else
      return false;
  }

  /*static Future checkUserLogin(User judgeUser) async {
    Future<Map> readUser_tmp = readData();
    Map readUser = await readUser_tmp;
    print('###');
    print(judgeUser.email.runtimeType);
    print(judgeUser.password.runtimeType);
    print('%%%');
    print(judgeUser.email);
    print(judgeUser.password);
    print('---');
    print(readUser['email']);
    print(readUser['password']);
    print('***');
    print(readUser['email'].runtimeType);
    print(readUser['password'].runtimeType);
    print('@@@');
    print(judgeUser.email == readUser['email']);
    print(judgeUser.password == readUser['password']);
    print('+++');

    if (judgeUser.email == readUser['email'] &&
        judgeUser.password == readUser['password']) {
      isLoginFlag = true;
      UserState.isLogin = true;
      UserState.CurrEmail = judgeUser.email;
      UserState.CurrUsername = judgeUser.username;
      return;
    }
  }*/
}



/*class SharedPreferenceUtil {
  static const String ACCOUNT_NUMBER = "account_number";
  static const String USERNAME = "username";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";

  //查找账号是否已经注册
  static Future<bool> checkUser(User user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var clear = sp.clear();
    List<User> list = await getUsers();
    if (list.contains(user))
      return true;
    else
      return false;
    */ /*for (int i = 0; i < list.length; i++) {
      if (list[i].email == user.email) {
        if (list[i].password == user.password &&
            list[i]._username == user.username) {
          return true;
        }
      }
    }
    return false;*/ /*

    */ /*if (list.indexOf(user) == -1) {
      print(0);
      print(list);
      return false;
    } else {
      print(1);
      return true;
    }*/ /*
  }

  ///删掉单个账号
  static void delUser(User user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<User> list = await getUsers();
    list.remove(user);
    saveUsers(list, sp);
  }

  ///保存账号，如果重复，就将最近登录账号放在第一个
  static void saveUser(User user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    List<User> list = await getUsers();
    addNoRepeat(list, user);
    saveUsers(list, sp);
  }

  ///去重并维持次序
  static void addNoRepeat(List<User> users, User user) {
    if (users.contains(user)) {
      users.remove(user);
    }
    users.insert(0, user);
  }

  ///获取已经登录的账号列表
  static Future<List<User>> getUsers() async {
    List<User> list = [];
    SharedPreferences sp = await SharedPreferences.getInstance();
    int num = sp.getInt(ACCOUNT_NUMBER) ?? 0;
    for (int i = 0; i < num; i++) {
      String? username = sp.getString("$USERNAME$i");
      String? email = sp.getString("$EMAIL$i");
      String? password = sp.getString("$PASSWORD$i");
      list.add(User(username, password, email));
    }
    print("label");
    print(list);
    return list;
  }

  ///保存账号列表
  static saveUsers(List<User> users, SharedPreferences sp) {
    sp.clear();
    int size = users.length;
    for (int i = 0; i < size; i++) {
      sp.setString("$USERNAME$i", users[i].username);
      sp.setString("$PASSWORD$i", users[i].password);
      sp.setString("$EMAIL$i", users[i].email);
    }
    sp.setInt(ACCOUNT_NUMBER, size);
  }
}*/

/*class userdata {
  static int totalNum = 0;
  late String nowUserName;
  late String nowEmail;
  late String Password;
  late List<Map> users;
}*/

List<Map<dynamic,dynamic>> star_data = [{
  'number':0,
  'date':"",
  'image_id':"",
  'title':"",
  'context':"",
  'used_time':"",
  'score':0,
  '1_selected':false,
  '2_selected':false,
  '3_selected':false,
  '4_selected':false,
  '5_selected':false,
  '6_selected':false,
  '7_selected':false,
  '8_selected':false,
  '9_selected':false,
},
  {
    'number':1,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':2,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':3,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },{
    'number':4,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':5,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },{
    'number':6,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':7,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },{
    'number':8,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':10,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':11,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':12,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':13,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':14,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':15,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':16,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':17,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':18,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
  {
    'number':19,
    'date':"",
    'image_id':"",
    'title':"",
    'context':"",
    'used_time':"",
    'score':0,
    '1_selected':false,
    '2_selected':false,
    '3_selected':false,
    '4_selected':false,
    '5_selected':false,
    '6_selected':false,
    '7_selected':false,
    '8_selected':false,
    '9_selected':false,
  },
];

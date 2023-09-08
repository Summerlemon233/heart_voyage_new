import './common_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './userdata.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'dart:io';



void saveBasicData() async {
  //noprob
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = json.encode(basicData);
  prefs.setString('myData', jsonString);
}

void loadBasicData() async {
  //noprob
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = prefs.getString('myData')!;
  Map<String, dynamic> data = json.decode(jsonString);
  basicData = data;
}

void saveList(List list,String name) async {
  // 获取文档目录的路径
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  // 创建一个文件来保存列表
  File file = File('${appDocPath}/${name}.txt');
  String listString = list.join('\n');
  await file.writeAsString(listString);

  // 使用shared_preferences保存文件路径
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('${name}ListPath', file.path);
}

Future<List> readList(List list,String name) async {
  // 使用shared_preferences获取文件路径
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String filePath = prefs.getString('${name}ListPath')!;

  // 如果文件存在，则读取它的内容并返回列表
  if (filePath != null) {
    File file = File(filePath);
    if (await file.exists()) {
      String listString = await file.readAsString();
      List list = listString.split('\n');
      return list;
    }
  }

  return [];
}

/*Future<void> saveList(List list,String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String encodedList = jsonEncode(list);
  await prefs.setString(name, encodedList);
}

Future<void> getList(List list,String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? encodedList = prefs.getString(name);
  if (encodedList != null) {
    list =  List.from(jsonDecode(encodedList));
  } else {
    list = [];
}}*/








void storeStarDataSingle(int index) async {
  final prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(star_data[index]);
  prefs.setString('myStarData${index}', jsonString);
}



Future<void> readStarData() async {
  List<Map<String,dynamic>> tmp = [];
  final prefs = await SharedPreferences.getInstance();
  for(int index = 0;index <= basicData['star_case'] - 1;index++)
  {
    String jsonString = prefs.getString('myStarData${index}')!;
    Map<String, dynamic> data = json.decode(jsonString);
    tmp.add(data);
  }
  star_data = tmp;
  //List<dynamic> jsonData = jsonDecode(jsonString);
  //List<Map<String, dynamic>> starData = jsonData.map((e) => Map<String, dynamic>.from(e)).toList();
  //star_data = starData;
}

/*Future<void> saveData(List<Map<String, dynamic>> data) async {
  final directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/stardata.json');
  await file.writeAsString(jsonEncode(data));
  GetStorage().write('stardataPath', file.path);
}

Future<void> loadStarData() async {
  final path = GetStorage().read('stardataPath');
  if (path != null) {
    final file = File(path);
    if (await file.exists()) {
      final dataString = await file.readAsString();
      star_data = List<Map<String, dynamic>>.from(jsonDecode(dataString));
    }
  }
}*/

Future<void> init_data() async {
  loadBasicData();
  readPhotoPath();
  readPhotoPath_mood();
}
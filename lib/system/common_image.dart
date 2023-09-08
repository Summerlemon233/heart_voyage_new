// 导入必要的包
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/*//解决Future问题的全局临时变量
List<Image> tmpImageList = [];
Image? tmpImage;*/

// 定义一个全局变量，用于存储选中的照片
AssetEntity? selectedAsset;
AssetEntity? selectedAsset_mood;
AssetEntity? selectedAsset_avatar;

// 定义一个全局变量，用于存储照片路径
List<String> photoPath = [];
List<String> photoPath_mood = [];
List<String> PhotoPath_avatar = [""];

// 将照片路径List存入本地：

Future<void> savePhotoPath(List<String> filePaths) async {
  final directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/photoPaths.txt');
  await file.writeAsString(filePaths.join('\n'));
  GetStorage().write('photoPath', file.path);
}

Future<void> readPhotoPath() async {
  //photoPath = [];
  if(GetStorage().read('photoPath') == null) return;
  final filePath = GetStorage().read('photoPath');
  final File file = File(filePath);
  final content = await file.readAsString();
  //photoPath = [];
  photoPath = content.split('\n');
}

//mood_cache
Future<void> savePhotoPath_mood(List<String> filePaths) async {
  final directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/photoPaths_mood.txt');
  await file.writeAsString(filePaths.join('\n'));
  GetStorage().write('photoPath_mood', file.path);
}

Future<void> readPhotoPath_mood() async {
  if(GetStorage().read('photoPath_mood') == null) return;
  final filePath = GetStorage().read('photoPath_mood');
  final File file = File(filePath);
  final content = await file.readAsString();
  photoPath_mood = [];
  photoPath_mood = content.split('\n');
}

// 定义一个方法，用于选择一张照片，并将选中的照片转化为Image对象共预览
Future<void> selectPhoto(BuildContext context, int index) async {
  // 调用wechat_assets_picker插件，设置最大选择数量为1，只允许选择图片类型
  final List<AssetEntity>? result = await AssetPicker.pickAssets(
    context,
    pickerConfig: AssetPickerConfig(
      maxAssets: 1,
      requestType: RequestType.image,
    ),
  );
  // 如果有选择结果，则更新selectedAsset变量，并显示预览页面
  if (result != null) {
    selectedAsset = result.first;
    savePhoto(index);
  }
}

Future<void> selectPhoto_mood(BuildContext context, int index) async {
  // 调用wechat_assets_picker插件，设置最大选择数量为1，只允许选择图片类型
  final List<AssetEntity>? result = await AssetPicker.pickAssets(
    context,
    pickerConfig: AssetPickerConfig(
      maxAssets: 1,
      requestType: RequestType.image,
    ),
  );
  // 如果有选择结果，则更新selectedAsset变量，并显示预览页面
  if (result != null) {
    selectedAsset_mood = result.first;
    savePhoto_mood(index);
  }
}

// 定义一个方法，用于将选中的照片自命名以后写入设备内置目录，并添加文件路径到photoPath变量
Future<void> savePhoto(int index) async {
  // 获取设备内置目录的路径
  final directory = await getExternalStorageDirectory();
  // 获取选中的照片的原始数据和文件名后缀（如.jpg）
  final Uint8List? data = await selectedAsset!.originBytes;
  final String suffix = selectedAsset!.title!.split('.').last;
  // 如果有数据，则创建一个新文件对象，并以1作为文件名（如1.jpg）
  if (data != null) {
    final File file = File('${directory!.path}/${index}.$suffix');
    // 将数据写入文件，并将文件路径添加到photoPath变量
    await file.writeAsBytes(data);
    photoPath.add(file.path);
    savePhotoPath(photoPath);
    print('object');
  }
}

Future<void> savePhoto_mood(int index) async {
  // 获取设备内置目录的路径
  final directory = await getExternalStorageDirectory();
  // 获取选中的照片的原始数据和文件名后缀（如.jpg）
  final Uint8List? data = await selectedAsset_mood!.originBytes;
  final String suffix = selectedAsset_mood!.title!.split('.').last;
  // 如果有数据，则创建一个新文件对象，并以1作为文件名（如1.jpg）
  if (data != null) {
    final File file = File('${directory!.path}/${index}_mood.$suffix');
    // 将数据写入文件，并将文件路径添加到photoPath变量
    await file.writeAsBytes(data);
    photoPath_mood.add(file.path);
    savePhotoPath_mood(photoPath_mood);
  }
}

Image imageFromFile(String path) {
  if (path == "") {
    return Image(image: AssetImage('assets/images/star.png'));
  } else {
    final file = File(path);
    final image = Image.file(file);
    return image;
  }
}

Future<void> savePhotoPath_avatar(List<String> filePaths) async {
  final directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/PhotoPath_avatars.txt');
  await file.writeAsString(filePaths.join('\n'));
  GetStorage().write('PhotoPath_avatar', file.path);
}

Future<void> readPhotoPath_avatar() async {
  final filePath = GetStorage().read('PhotoPath_avatar');
  final File file = File(filePath);
  final content = await file.readAsString();
  PhotoPath_avatar = content.split('\n');
}

Future<void> selectPhoto_avatar(BuildContext context) async {
  // 调用wechat_assets_picker插件，设置最大选择数量为1，只允许选择图片类型
  final List<AssetEntity>? result = await AssetPicker.pickAssets(
    context,
    pickerConfig: AssetPickerConfig(
      maxAssets: 1,
      requestType: RequestType.image,
    ),
  );
  // 如果有选择结果，则更新selectedAsset变量，并显示预览页面
  if (result != null) {
    selectedAsset_avatar = result.first;
    savePhoto_avatar(0);
  }
}

Future<void> savePhoto_avatar(int index) async {
  final originFile = await selectedAsset_avatar!.originFile;
  if (originFile == null) return null;
  // 使用 image_cropper 库裁剪图像
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: originFile.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      //CropAspectRatioPreset.ratio3x2,
      //CropAspectRatioPreset.original,
      //CropAspectRatioPreset.ratio4x3,
      //CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: '裁剪头像',
          toolbarColor:  Color.fromRGBO(45, 73, 104, 1),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true),
      IOSUiSettings(
        title: '裁剪头像',
        minimumAspectRatio: 1,
        showCancelConfirmationDialog: true,
      ),
    ],
  );
  final File? file = File(croppedFile!.path);
  // 获取设备内置目录的路径
  final directory = await getExternalStorageDirectory();
  final path = directory!.path;
  final fileName = basename(file!.path);
  final newFile = File('$path/$fileName');
  await file.copy(newFile.path);
  PhotoPath_avatar[0] = (newFile.path);
  savePhotoPath_avatar(PhotoPath_avatar);
}

/*
Future<File?> cropImageWithUserInput(AssetEntity assetEntity) async {
  // 获取原始文件
  final originFile = await assetEntity.originFile;
  if (originFile == null) return null;

  // 使用 image_cropper 库裁剪图像
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: originFile.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      //CropAspectRatioPreset.ratio3x2,
      //CropAspectRatioPreset.original,
      //CropAspectRatioPreset.ratio4x3,
      //CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: '裁剪头像',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true),
      IOSUiSettings(
        title: '裁剪头像',
        minimumAspectRatio: 1,
        showCancelConfirmationDialog: true,
      ),
    ],
  );
  final File? file = File(croppedFile!.path);
  return croppedFile;
}
*/

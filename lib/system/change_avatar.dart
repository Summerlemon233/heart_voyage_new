import 'package:flutter/material.dart';
import './common_image.dart';
import './common_widgets.dart';
import './userdata.dart';
import './userdata_func.dart';

class Avatar extends StatefulWidget {
  final ImageProvider image;

  const Avatar({Key? key, required this.image}) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectPhoto_avatar(context);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue),
        ),
        child: CircleAvatar(
          backgroundImage: widget.image,
          //radius: 50,
        ),
      ),
    );
  }
}

class change_avatar extends StatefulWidget {
  @override
  _change_avatarState createState() => _change_avatarState();
}

class _change_avatarState extends State<change_avatar> {
  bool isSelectedAvatar = !(PhotoPath_avatar[0] == "");

  @override
  Widget build(BuildContext context) {
    var _readPhotoPath_avatar_var = readPhotoPath_avatar();
    return Scaffold(
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        //backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        //foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('上传头像'),
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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: isSelectedAvatar
                  ? Avatar(image: imageFromFile(PhotoPath_avatar[0]).image)
                  : Avatar(image: AssetImage('assets/images/not_login.png')),
              margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text("${basicData["username"]}",style: TextStyle(fontSize: 30),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.25, 0, MediaQuery.of(context).size.width * 0.25, 0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectPhoto_avatar(context);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add_a_photo),
                      Text("更换头像"),
                    ],
                  )),
            )

          ],
        ),
      ),
    );
  }
}

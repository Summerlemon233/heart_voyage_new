import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

String getDate() {
  DateTime now = DateTime.now();
  String temp = now.year.toString();
  temp += "年";
  temp += now.month.toString();
  temp += "月";
  temp += now.day.toString();
  temp += "日";
  return temp;
}

class funcCard extends StatelessWidget {
  final String Area;
  final String AssetPath;
  final VoidCallback onTapFunc;
  final int unlock;
  final Color color;

  const funcCard(
      {Key? key,
        required this.Area,
        required this.AssetPath,
        required this.onTapFunc,
        required this.color,
        this.unlock = 0}
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(

        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        padding: EdgeInsets.all(15),
        height: 175,
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            blurStyle: BlurStyle.outer,
            offset: Offset.zero,
          ),],
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage(AssetPath), fit: BoxFit.fitWidth),
        ),
        child: SizedBox(
          child:
          Text(Area, style: TextStyle(color: color, fontSize: 27,fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}

class momentCard extends StatelessWidget {

  final String AssetPath;
  final VoidCallback onTapFunc;
  final int unlock;
  final String AvatarPath;
  final String userName;
  final String releaseTime;
  final String textContent;
  final String location;
  final String province;
  final int likes;

  const momentCard(
      {Key? key,
      required this.AssetPath,
      required this.onTapFunc,
      required this.AvatarPath,
      required this.userName,
      this.unlock = 0,
      required this.releaseTime,
      required this.textContent,
      required this.location,
      required this.province,
      required this.likes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        padding: EdgeInsets.fromLTRB(5,10,5,10),
        //height: 128,
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            blurStyle: BlurStyle.outer,
            offset: Offset.zero,
          ),],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1.0,color: Colors.black26),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipOval(
                    child: Image(
                      image: AssetImage(AvatarPath),
                    ),
                  ),
                  Text(userName,style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 33,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on,size: 18,color: Colors.black45,),
                  SizedBox(width: 8,),
                  Text(location,style: TextStyle(
                    color: Colors.black45,
                  ),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(AssetPath), fit: BoxFit.fitWidth),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 15, 5, 2),
              child: Text(textContent,maxLines:30,textAlign: TextAlign.justify,style: TextStyle(

              ),),
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                LikeButton(likeCount: likes,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Text("发布于 ${province}   ${releaseTime}  ",style: TextStyle(
                  color: Colors.black45,
                ),),

              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

/*Image returnPet() {
  Image _tmp;
  switch (basicData['CurrPet']) {
    case 0:
      _tmp =  Image(image: AssetImage('assets/images/pet0.png'));break;
    case 1:
      _tmp =  Image(image: AssetImage('assets/images/pet1.png'));break;
    //return Image(image: AssetImage('assets/images/pet1.png'));
    case 2:
      _tmp =  Image(image: AssetImage('assets/images/pet2.png'));break;
    //return Image(image: AssetImage('assets/images/pet2.png'));
    case 3:
      _tmp =  Image(image: AssetImage('assets/images/pet3.png'));break;
    //return Image(image: AssetImage('assets/images/pet3.png'));
    default:
      _tmp =  Image(image: AssetImage('assets/images/pet0.png'));break;
    //return Image(image: AssetImage('assets/images/pet0.png'));
  }
  return */ /*Obx(() => Container
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue),
      ),
      child: CircleAvatar(
        backgroundImage: _tmp.image,
        radius: 50,
      )))*/ /*_tmp;
}*/

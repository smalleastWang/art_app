import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileCard extends StatelessWidget {
  final String img;
  final String title;
  final String author;
  final String authorUrl;
  final String type;
  final double worksAspectRatio;
  TileCard(
      {this.img,
      this.title,
      this.author,
      this.authorUrl,
      this.type,
      this.worksAspectRatio});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
            child: CachedNetworkImage(
              imageUrl: '$img',
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20.w)),
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10.w)),
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.sp),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20.w),
                bottom: ScreenUtil().setWidth(20.w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('$authorUrl'),
                  radius: ScreenUtil().setWidth(30.w),
                  // maxRadius: 40.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(20.w)),
                  width: ScreenUtil().setWidth(250.w),
                  child: Text(
                    '$author',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.sp),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(80.w)),
                  child: Text(
                    '${type == 'EXISE' ? '练习' : '其他'}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.sp),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

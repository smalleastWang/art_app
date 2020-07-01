import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:art_app/widgets/common/tile_card.dart';
import 'package:art_app/store/home.dart';
import 'package:dio/dio.dart';

class AboutPage extends StatefulWidget {
  static const routeName = 'about';
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    ScreenUtil.init();
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('about page'),
      ),
      // body: StaggeredGridView.countBuilder(
      //     crossAxisCount: 4,
      //     itemCount: 8,
      //     itemBuilder: (BuildContext context, int index) => new Container(
      //         color: Colors.green,
      //         child: new Center(
      //             child: new CircleAvatar(
      //             backgroundColor: Colors.white,
      //             child: new Text('$index'),
      //             ),
      //         )
      //     ),
      //     staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
      //     mainAxisSpacing: 4.0,
      //     crossAxisSpacing: 4.0,
      // ),
      body: FutureBuilder(
          future: _dio.get('https://api.tuchong.com/feed-app'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              var feedList = response.data['feedList'][0];
              var images = feedList['images'];
              print(images[1]);
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: images.length,
                // itemBuilder: (BuildContext context, int index) => new Container(
                //     child: Image.network('https://photo.tuchong.com/${images[index]['user_id']}/f/${images[index]['img_id']}.jpg'),
                // ),
                itemBuilder: (BuildContext context, int index) => TileCard(
                  img:
                      'https://photo.tuchong.com/${images[index]['user_id']}/f/${images[index]['img_id']}.jpg',
                  title: 'title',
                  author: 'author',
                  authorUrl: 'authorUrl',
                  type: 'type',
                  worksAspectRatio: 2,
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              );
            }
            //请求未完成时弹出loading
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

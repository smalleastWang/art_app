
import 'package:flutter/material.dart';

import 'package:art_app/routes/routes_widget.dart';

var isLogin = true;

// 不需要登录的路由
Map<String, WidgetBuilder> routes = {
    LoginPage.routeName: (BuildContext context) => LoginPage(),
    MyHomePage.routeName: (BuildContext context) => MyHomePage(),

};
// 需要登录的路由
Map<String, Widget> needLoginRoutes = {
    AboutPage.routeName: AboutPage(),
};

// 路由钩子
void routeHook(setting) {
    print(setting);
}

Route<dynamic> onGenerateRoute(RouteSettings setting) {
    routeHook(setting);
    Widget mathWidget = Center(child: Text('404'));
    needLoginRoutes.forEach((route, widget){
        if(isLogin && route == setting.name){
            mathWidget = widget;
        } else {
            mathWidget = LoginPage();
        }
    });
    return MaterialPageRoute(builder: (BuildContext context) => mathWidget);
}
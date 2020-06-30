
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:art_app/routes/index.dart';
import 'package:art_app/store/home.dart';
void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => Common())
            ],
            child: MyApp(),
        )
    );
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: '艾图',
            initialRoute: '/',
            // 不用登录的路由配置
            routes: routes,
            // 拦截的路由
            onGenerateRoute: onGenerateRoute,
        );
    }
}


import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LoginPage extends StatelessWidget {
    const LoginPage({Key key}) : super(key: key);
    static const routeName = 'login';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('login page'),
            ),
            body: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('this is login page'),
                    ],
                ),
            ),
        );
    }
}
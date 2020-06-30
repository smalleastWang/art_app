
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:art_app/widgets/home/count.dart';
import 'package:art_app/store/home.dart';

class AboutPage extends StatelessWidget {
    const AboutPage({Key key}) : super(key: key);
    static const routeName = 'about';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                    title: Text('about page'),
            ),
            body: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('this is about page'),
                        Count(),
                        FlatButton(
                            child: Text("decrement"),
                            onPressed: () => context.read<Common>().decrement(),
                        ),
                        FlatButton(
                            child: Text("to home"),
                            onPressed: () {
                                //导航到新路由   
                                Navigator.pushNamed(context, '/');
                            },
                        )
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => context.read<Common>().increment(),
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ),
        );
    }
}



import 'package:art_app/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:art_app/widgets/home/count.dart';
import 'package:art_app/store/home.dart';

class MyHomePage extends StatelessWidget {
    const MyHomePage({Key key}) : super(key: key);
    static const routeName = '/';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('home page'),
            ),
            body: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        const Text('You have pushed the button this many times:'),

                        /// Extracted as a separate widget for performance optimization.
                        /// As a separate widget, it will rebuild independently from [MyHomePage].
                        ///
                        /// This is totally optional (and rarely needed).
                        /// Similarly, we could also use [Consumer] or [Selector].
                        const Count(),
                        FlatButton(
                            child: Text("decrement"),
                            onPressed: () => context.read<Common>().decrement(),
                        ),
                        FlatButton(
                            child: Text("to about"),
                            onPressed: () {
                                //导航到新路由   
                                Navigator.pushNamed(context, 'about');
                                // Navigator.push(context,
                                // MaterialPageRoute(builder: (context) {
                                //     return AboutPage();
                                // }));
                            },
                        )
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                /// Calls `context.read` instead of `context.watch` so that it does not rebuild
                /// when [Common] changes.
                onPressed: () => context.read<Common>().increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
            ),
        );
    }
}
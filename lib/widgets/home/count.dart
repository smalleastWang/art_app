
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../store/home.dart';

class Count extends StatelessWidget {
    const Count({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Text(
            /// Calls `context.watch` to make [MyHomePage] rebuild when [Common] changes.
            '${context.watch<Common>().count}',
            style: Theme.of(context).textTheme.headline4
        );
    }
}
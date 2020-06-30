
import 'package:flutter/foundation.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class Common with ChangeNotifier, DiagnosticableTreeMixin {
    bool _isLogin = false;
    int _count = 0;
    bool get isLogin => _isLogin;
    int get count => _count;

    void increment() {
        _count++;
        notifyListeners();
    }
    void decrement() {
        _count--;
        notifyListeners();
    }

    /// Makes `Common` readable inside the devtools by listing all of its properties
    @override
    void debugFillProperties(DiagnosticPropertiesBuilder properties) {
        super.debugFillProperties(properties);
        properties.add(IntProperty('count', count));
    }
}
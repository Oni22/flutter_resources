import 'package:flutter/widgets.dart';
import 'package:multilang/multilang.dart';

class RProvider extends InheritedWidget {

  final Widget child;
  final BaseR Function() onSelectLanguage;

  RProvider({this.child,this.onSelectLanguage}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return null;
  }

  BaseR get string => onSelectLanguage();

  static RProvider of(BuildContext context) => context.dependOnInheritedWidgetOfExactType() as RProvider;
}

test() {
 
}
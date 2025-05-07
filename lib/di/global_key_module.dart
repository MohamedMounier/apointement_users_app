
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@module
abstract class GlobalKeyModule{
  @lazySingleton
  GlobalKey<NavigatorState> get key=>GlobalKey<NavigatorState>();
}
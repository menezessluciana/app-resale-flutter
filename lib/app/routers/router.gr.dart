// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app_resale/app/pages/home_page.dart';
import 'package:app_resale/app/pages/shopping_cart_page.dart';

abstract class Routes {
  static const home = '/';
  static const shoppingCart = '/shopping-cart';
  static const all = {
    home,
    shoppingCart,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        if (hasInvalidArgs<HomePageArguments>(args)) {
          return misTypedArgsRoute<HomePageArguments>(args);
        }
        final typedArgs = args as HomePageArguments ?? HomePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.shoppingCart:
        if (hasInvalidArgs<ShoppingCartPageArguments>(args)) {
          return misTypedArgsRoute<ShoppingCartPageArguments>(args);
        }
        final typedArgs =
            args as ShoppingCartPageArguments ?? ShoppingCartPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ShoppingCartPage(
              key: typedArgs.key, fornecedor: typedArgs.fornecedor),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HomePage arguments holder class
class HomePageArguments {
  final Key key;
  HomePageArguments({this.key});
}

//ShoppingCartPage arguments holder class
class ShoppingCartPageArguments {
  final Key key;
  final dynamic fornecedor;
  ShoppingCartPageArguments({this.key, this.fornecedor});
}

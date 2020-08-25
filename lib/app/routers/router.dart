
import 'package:auto_route/auto_route_annotations.dart';

import 'package:app_resale/app/pages/home_page.dart';
import 'package:app_resale/app/pages/shopping_cart_page.dart';

@MaterialAutoRouter()
class $Router {

  @initial
  HomePage home;
  ShoppingCartPage shoppingCart;
}
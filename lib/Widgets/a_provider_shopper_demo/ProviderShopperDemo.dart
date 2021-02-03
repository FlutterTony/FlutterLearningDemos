import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/a_provider_shopper_demo/screen/cart.dart';
import 'package:flutter_app/Widgets/a_provider_shopper_demo/screen/catalog.dart';
import 'package:flutter_app/Widgets/a_provider_shopper_demo/screen/login.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'models/cart.dart';
import 'models/catalog.dart';

class ProviderShopperDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
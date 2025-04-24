import 'package:flutter/material.dart';
import 'package:t4_110425_shoes_store/pages/mobile/mobile_layout.dart';
import 'package:t4_110425_shoes_store/pages/tablet/tablet_layout.dart';

import '../models/book_model.dart';
import 'desktop/desktop_layout.dart';
import 'mobile/cart_page.dart';
import 'mobile/detail_page.dart';
import 'mobile/profile_page.dart';
import 'mobile/read_page.dart';

import 'tablet/cart_page.dart' as t;
import 'tablet/detail_page.dart' as t;
import 'tablet/profile_page.dart' as t;
import 'tablet/read_page.dart' as t;

import 'desktop/cart_page.dart' as d;
import 'desktop/detail_page.dart' as d;
import 'desktop/profile_page.dart' as d;
import 'desktop/read_page.dart' as d;



class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Books Store',
            home: const MobileLayout(),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            ),
            routes: {
              '/cart': (context) => const CartPage(),
              '/detail': (context) => DetailPage(
                book: ModalRoute.of(context)!.settings.arguments as Book,
              ),
              '/profile': (context) => const ProfilePage(),
              '/read': (context) => ReadPage(
                book: ModalRoute.of(context)!.settings.arguments as Book,
              ),
            },
          );
        } else if (constraints.maxWidth < 1100) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Books Store',
            home: const TabletLayout(),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            ),
            routes: {
              '/cart': (context) => const t.CartPage(),
              '/detail': (context) => t.DetailPage(
                book: ModalRoute.of(context)!.settings.arguments as Book,
              ),
              '/profile': (context) => const t.ProfilePage(),
              '/read': (context) => t.ReadPage(
                book: ModalRoute.of(context)!.settings.arguments as Book,
              ),
            },
          ); // TabletLayout
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Books Store',
            home: const DestopLayout(),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            ),
            routes: {
              '/cart': (context) => const d.CartPage(),
              '/detail': (context) => d.DetailPage(
                book: ModalRoute.of(context)!.settings.arguments as Book,
              ),
              '/profile': (context) => const d.ProfilePage(),
              '/read': (context) => d.ReadPage(
                book: ModalRoute.of(context)!.settings.arguments as Book,
              ),
            },
          ); // DesktopLayout
        }
      },
    );
  }
}

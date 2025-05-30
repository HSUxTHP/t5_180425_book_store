import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t4_110425_shoes_store/pages/desktop/profile_page.dart';
import '../../models/book_model.dart';
import '../../providers/cart_provider.dart';
import 'cart_page.dart';
import 'detail_page.dart';
import 'home_page.dart';



class DestopLayout extends StatefulWidget {
  const DestopLayout({super.key});

  @override
  State<DestopLayout> createState() => _DestopLayoutState();
}

class _DestopLayoutState extends State<DestopLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            TextButton.icon(
              onPressed: () {
                setState(() => _selectedIndex = 0);
              },
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.white : Colors.white70),
              label: Text(
                'Home',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.white : Colors.white70,
                  fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                setState(() => _selectedIndex = 1);
              },
              icon: Icon(Icons.shopping_cart, color: _selectedIndex == 1 ? Colors.white : Colors.white70),
              label: Text(
                'Cart',
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.white : Colors.white70,
                  fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                setState(() => _selectedIndex = 2);
              },
              icon: Icon(Icons.person, color: _selectedIndex == 2 ? Colors.white : Colors.white70),
              label: Text(
                'Profile',
                style: TextStyle(
                  color: _selectedIndex == 2 ? Colors.white : Colors.white70,
                  fontWeight: _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),


      body: _pages[_selectedIndex],
      drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        // Text(
                        //   'Menu',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 24,
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        Text(
                          _selectedIndex == 0
                              ? 'Home'
                              : _selectedIndex == 1
                              ? 'Cart'
                              : 'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('Cart'),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

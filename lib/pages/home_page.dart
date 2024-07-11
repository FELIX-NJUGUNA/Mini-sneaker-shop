import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/components/bottom_nav_bar.dart';
import 'package:sneaker_shop_app/pages/shop_page.dart';

import 'cart_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  // selected index controls bottom navigation bar
  int _selectedIndex = 0;

  // method to update selected index when user taps the bottom nav bar
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [

    // shop page
    const ShopPage(),

    //cart page
   const CartPage(),
  ] ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Icon(Icons.menu),
                )
            )

        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
       Column(
         children: [

           // logo
           DrawerHeader(child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.asset("lib/images/nike.png",
               color: Colors.white,
               height: 50,),
           ),
           ),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25),
             child: Divider(color: Colors.grey[800],),
           ),

           //tiles
           Padding(
             padding: const EdgeInsets.only(left: 25.0),
             child: ListTile(
               leading: Icon(Icons.home, color: Colors.white,),
               title: Text("Home", style: TextStyle(color: Colors.white),),
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(left: 25.0),
             child: ListTile(
               leading: Icon(Icons.info, color: Colors.white,),
               title: Text("About", style: TextStyle(color: Colors.white),),
             ),
           ),
         ],
       ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text("Logout", style: TextStyle(color: Colors.white),),
              ),
            )

          ],
        ),
      ),
      body: _pages[_selectedIndex],

    );
  }
}

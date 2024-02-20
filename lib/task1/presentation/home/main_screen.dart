import 'package:flutter/material.dart';
import 'package:task1/task1/presentation/home/profile.dart';
import '../great.dart';
import '../my_page.dart';
import 'category.dart';
import 'colors.dart';
import 'home_screen.dart';


class MainScreen extends StatefulWidget {
  final Widget? child;
  final int? selectedIndex;
  const MainScreen({super.key, this.child, this.selectedIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyPage(),
    Category(),
    Great(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> titleList = ['Home', 'Account', 'Cart', 'Order','profile'];
  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null) {
      _selectedIndex = widget.selectedIndex!;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Colors.black,overflow: TextOverflow.visible),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            backgroundColor:  Color.fromARGB(255, 255, 255, 255),  
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,
              color: backgroundColor,
              ),
              label: 'search',
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color:backgroundColor),
              label: 'category',
             
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: backgroundColor,),
              label: 'great',
             
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, color: backgroundColor,),
              label: 'my page',
             
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 47, 202, 44),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

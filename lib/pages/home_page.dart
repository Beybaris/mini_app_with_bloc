import 'package:flutter/material.dart';
import 'package:innlab_bloc_test_example/core/textStyles_const.dart';
import 'checkPages/screen/check_page.dart';
import 'contacts/screen/contacts_page.dart';
import 'gallery/screen/gallery_page.dart';
import 'news_pages/screens/news_pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<Widget> _widgetOptions = <Widget>[
    NewsPage(),
    GalleryPage(),
    CheckPage(),
    ContastsPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff322C54), Color(0xff231D49)],
          ),

        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
           backgroundColor: Color(0xff322C54),
          fixedColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
            label: 'News',
            backgroundColor: Color(0xff322C54),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Gallery',
              backgroundColor: Color(0xff322C54),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Check',
              backgroundColor: Color(0xff322C54),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Contacts',
              backgroundColor: Color(0xff322C54),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Color(0xff59527F),
          unselectedLabelStyle: TextStyle(color: Color(0xff59527F),),
        ),
      ),
    );
  }
}

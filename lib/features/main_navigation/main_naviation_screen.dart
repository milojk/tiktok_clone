import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/stf_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';

class MainNaviationScreen extends StatefulWidget {
  const MainNaviationScreen({super.key});

  @override
  State<MainNaviationScreen> createState() => _MainNaviationScreenState();
}

class _MainNaviationScreenState extends State<MainNaviationScreen> {
  int _selectedIndex = 0;
  bool _isPostVideoSelected = false;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      _isPostVideoSelected = false;
    });
  }

  void _onPostVideoButtonTap() {
    setState(() {
      _isPostVideoSelected = true;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record Video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavTab(
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                text: 'Home',
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavTab(
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                text: 'Discover',
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(
                  isSelected: _isPostVideoSelected,
                ),
              ),
              Gaps.h24,
              NavTab(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                text: 'Inbox',
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                text: 'Profile',
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

    // Cupertino Design bottom Navigation Bar
    /*
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'home',
            backgroundColor: Colors.amber,
            //tooltip: 'What are you?',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
            backgroundColor: Colors.pink,
            //tooltip: 'What are you?',
          ),
        ],
      ),
      tabBuilder: (context, index) => screens[index],
    );
    */ //Cupertino Design bottom Navigation Bar - end


// Material Design version 3
/*
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: 
      
      // Material Design version 3
      NavigationBar(
        
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.teal,
            ),
            label: 'home',
          ),
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.amber,
            ),
            label: 'Search',
          ),
        ],
      ),
    );
*/  // Material Design version 3 - end


      // Material Design version 2 - old one
/*
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: 
      // Material Design version 2
        BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'home',
            backgroundColor: Colors.amber,
            //tooltip: 'What are you?',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
            backgroundColor: Colors.pink,
            //tooltip: 'What are you?',
          ),
        ],
      ),
    );
*/  // Material Design version 2 - end
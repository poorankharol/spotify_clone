import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/home/widget/savan_home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

int _selectedIndex = 0;

List<Widget> _pages = <Widget>[
  const SavanHome(),
  Container(),
  Container(),
  Container()
];

class _DashboardScreenState extends State<DashboardScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              _pages.elementAt(_selectedIndex),
              Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 0, 0),
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(135, 0, 0, 0),
                            Color.fromARGB(80, 0, 0, 0),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 0.3, 0.6, 0.75, 1.0],
                        ),
                      ),
                      padding: const EdgeInsets.only(right: 0, left: 0, top: 15),
                      child: Row(
                        children: [
                          BottomNavBarItem(
                            title: 'Home',
                            onTap: () {
                              _onItemTapped(0);
                            },
                            index: 0,
                            iconData: Icons.home_filled,
                          ),
                          BottomNavBarItem(
                            title: 'Search',
                            onTap: () {
                              _onItemTapped(1);
                            },
                            index: 1,
                            iconData: Icons.search_rounded,
                          ),
                          BottomNavBarItem(
                            title: 'Your Library',
                            onTap: () {
                              _onItemTapped(2);
                            },
                            index: 2,
                            iconData: Icons.library_music_rounded,
                          ),
                          BottomNavBarItem(
                            title: 'Premium',
                            onTap: () {
                              _onItemTapped(3);
                            },
                            index: 3,
                            iconData: Icons.workspace_premium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    Key? key,
    this.onTap,
    required this.title,
    required this.index,
    this.iconData,
  }) : super(key: key);
  final Function()? onTap;
  final String title;
  final int index;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        enableFeedback: false,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            Icon(
              iconData,
              color: _selectedIndex != index
                  ? const Color(0xffababab)
                  : Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            // title
            Text(
              title,
              style: TextStyle(
                  color: _selectedIndex != index
                      ? const Color(0xffababab)
                      : Colors.white,
                  fontSize: 11.0),
            ),
          ],
        ),
      ),
    );
  }
}

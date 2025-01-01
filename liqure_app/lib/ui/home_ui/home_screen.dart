import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:liqure_app/ui/home_ui/account_ui.dart';
import 'package:liqure_app/ui/home_ui/category_ui.dart';
import 'package:liqure_app/ui/home_ui/main_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List ui = [
    const CategoryUi(),
    const MainUi(),
    const AccountUi(),
  ];
  int _currentIndex = 0;

  final Color _backgroundColor = const Color(0xff4a4e69);
  final Color _floatColor = const Color(0xffadb5bd);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        onPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
        backgroundColor: _floatColor,
        shape: const CircleBorder(),
        child: Icon(
          Icons.home,
          size: 40,
          color: _currentIndex == 1 ? const Color(0xff4a4e69) : Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomAppBar(
          notchMargin: 10,
          elevation: 1,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: _floatColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.menu,
                  size: 50,
                  color: _currentIndex == 0 ? const Color(0xff4a4e69) : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                icon: Icon(Icons.person,
                    size: 50,
                    color:
                        _currentIndex == 2 ? const Color(0xff4a4e69) : Colors.white),
              )
            ],
          ),
        ),
      ),
      body: ui[_currentIndex],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pratice_ui_1/constants/colors.dart';

class BottomNavigate extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const BottomNavigate({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: const TextStyle(color: blackColor))),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              activeIcon: Container(
                width: 60,
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: redColor,
                    width: 3,
                  ),
                )),
                child: Icon(Icons.home),
              ),
              label: 'Nhận định',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.money),
              activeIcon: Container(
                width: 60,
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: redColor,
                    width: 3,
                  ),
                )),
                child: Icon(Icons.home),
              ),
              label: 'Dòng tiền',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.badge),
              label: 'Lập danh mục',
              activeIcon: Container(
                width: 60,
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: redColor,
                    width: 3,
                  ),
                )),
                child: Icon(Icons.home),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Quản trị',
              activeIcon: Container(
                width: 60,
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: redColor,
                    width: 3,
                  ),
                )),
                child: Icon(Icons.home),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Hướng dẫn',
              activeIcon: Container(
                width: 60,
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: redColor,
                    width: 3,
                  ),
                )),
                child: Icon(Icons.home),
              ),
            )
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}

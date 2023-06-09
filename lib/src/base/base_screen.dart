import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
   const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(color: Colors.red),
          Container(color: Colors.yellow),
          Container(color: Colors.blue),
          Container(color: Colors.purple)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(150),
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(currentIndex);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Carrinho"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Pedidos"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "Perfil"
          ),
        ],
      ),
    );
  }
}

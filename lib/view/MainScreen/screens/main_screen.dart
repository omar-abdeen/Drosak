import 'package:drosak/controller/MainScreen/main_screen_controller.dart';
import 'package:drosak/view/MainScreen/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBarMainScreen(
        listIcon: MainScreenController.listBottomNavBarModel,
      ),
      // appBar: AppBar(
      //   title: const Text('Main Screen'),
      //   centerTitle: true,
      // ),
    );
  }
}

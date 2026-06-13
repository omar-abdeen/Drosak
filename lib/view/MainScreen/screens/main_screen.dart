import 'package:drosak/controller/MainScreen/main_screen_controller.dart';
import 'package:drosak/view/MainScreen/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController _controller;

  @override
  void initState() {
    _controller = MainScreenController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.gertArgument(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBarMainScreen(
        outPutBottomNavBar: _controller.outputBottomNavBar,
        onTap: (value) {
          _controller.changeBottomNavBar(value);
        },
        listIcon: MainScreenController.listBottomNavBarModel,
      ),
      body: StreamBuilder(
        stream: _controller.outputBody,
        builder: (context, snapshot) => MainScreenController
            .listBottomNavBarModel[snapshot.data == null ? 0 : snapshot.data!]
            .screen,
      ),
    );
  }
}

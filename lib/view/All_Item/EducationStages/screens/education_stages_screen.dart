import 'package:drosak/controller/Education_stages/edcation_stades_controlloer.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_app_bar.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_list_view_education_stages.dart';
import 'package:flutter/material.dart';

class EducationStagesScreen extends StatefulWidget {
  const EducationStagesScreen({super.key});

  @override
  State<EducationStagesScreen> createState() => _EducationStagesScreenState();
}

class _EducationStagesScreenState extends State<EducationStagesScreen> {
  late EducationStatesController _controller;
  @override
  void initState() {
    _controller = EducationStatesController();
    super.initState();
  }
  void dispose() {
    _controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          
          onPressedAddCircle: () {
            _controller.openBottomSheet(context: context);
          },
          onPressedSearch: () {
            _controller.searchEducationStages( context);
          },
        ),
        body: Column(children: [CustomListViewEducationStages()]),
      ),
    );
  }
}

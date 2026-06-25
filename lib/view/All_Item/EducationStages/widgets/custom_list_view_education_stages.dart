import 'package:drosak/controller/Education_stages/edcation_stades_controlloer.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_iteam_education_stages.dart';
import 'package:flutter/material.dart';

class CustomListViewEducationStages extends StatefulWidget {
  const CustomListViewEducationStages({
    super.key,
    required this.onDeleteItem,
    required this.onEditItem,
  });

  final void Function(EducationModel itemEducationModel) onDeleteItem;
  final void Function(EducationModel itemEducationModel) onEditItem;

  @override
  State<CustomListViewEducationStages> createState() =>
      _CustomListViewEducationStagesState();
}

class _CustomListViewEducationStagesState
    extends State<CustomListViewEducationStages> {
  late EducationStatesController _educationStatesController;
  @override
  void initState() {
    super.initState();
    _educationStatesController = EducationStatesController();
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: _educationStatesController.outputEducationStages,
        initialData: _educationStatesController.listEducationModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              (!snapshot.hasData || snapshot.data!.isEmpty)) {
            return const Center(child: CircularProgressIndicator());
          }
          final list = snapshot.data;
          if (list == null || list.isEmpty) {
            return const Center(child: Text("لا توجد مراحل تعليمية مضافة"));
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: HeightManager.h35),
            itemBuilder: (context, index) => CustomItemEducationStages(
              itemEducationModel: list[index],
              onDeleteItem: widget.onDeleteItem,
              onEditItem: widget.onEditItem,
            ),
            separatorBuilder: (context, index) =>
                SizedBox(height: HeightManager.h35),
            itemCount: list.length,
          );
        },
      ),
    );
  }
}

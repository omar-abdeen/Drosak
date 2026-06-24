import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/core/resources/fonts_manager.dart';
import 'package:drosak/core/resources/height_manager.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_iteam_education_stages.dart';
import 'package:flutter/material.dart';
class CustomSearchListViewEductionStages extends StatelessWidget {
  const CustomSearchListViewEductionStages({
    super.key,
    required this.getSearchItems,
  });
  final Future<List<EducationModel>> getSearchItems;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EducationModel>>(
      future: getSearchItems,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style:  TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: FontsSize.f18),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No results found.',
              style:  TextStyle(fontWeight: FontWeight.bold ,fontSize: FontsSize.f18, color: ColorManager.kPrimaryColor),
            ),
          );
        } else {
          final list = snapshot.data;
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: HeightManager.h35),
            itemBuilder: (context, index) =>
                CustomItemEducationStages(itemEducationModel: list![index]),
            separatorBuilder: (context, index) =>
                SizedBox(height: HeightManager.h35),
            itemCount: list?.length ?? 0,
          );
        }
      },
    );
  }
}

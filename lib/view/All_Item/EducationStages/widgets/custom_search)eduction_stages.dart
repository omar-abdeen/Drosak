import 'package:drosak/core/database/sqflite/Eduction_Stages/eduction_stages_oprations.dart';
import 'package:drosak/core/resources/colors_manager.dart';
import 'package:drosak/model/Education/education_model.dart';
import 'package:drosak/view/All_Item/EducationStages/widgets/custom_search_List_view_Eduction_stages.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate({required this.onDeleteItem, required this.onEditItem});

  final void Function(EducationModel itemEducationModel) onDeleteItem;
  final void Function(EducationModel itemEducationModel) onEditItem;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super
        .appBarTheme(context)
        .copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorManager.kPrimaryColor,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: ColorManager.kWhiteColor, fontSize: 20),
          ),
          textTheme: super
              .appBarTheme(context)
              .textTheme
              .copyWith(
                titleLarge: TextStyle(
                  color: ColorManager.kWhiteColor,
                  fontSize: 20,
                ),
              ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: ColorManager.kWhiteColor),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: ColorManager.kWhiteColor),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    return query == ''
        ? const SizedBox()
        : CustomSearchListViewEductionStages(
            getSearchItems: eductionStagesOprations.searchEductionStages(
              searchWord: query,
            ),
            onDeleteItem: onDeleteItem,
            onEditItem: onEditItem,
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    EductionStagesOprations eductionStagesOprations = EductionStagesOprations();
    return FutureBuilder<List<EducationModel>>(
      future: eductionStagesOprations.searchEductionStages(searchWord: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'حدث خطأ: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'لا توجد نتائج مطابقة',
              style: TextStyle(color: Colors.grey),
            ),
          );
        } else {
          final suggestions = snapshot.data!;
          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final education = suggestions[index];
              return ListTile(
                title: Text(education.StagesName),
                onTap: () {
                  query = education.StagesName;
                  showResults(context);
                },
              );
            },
          );
        }
      },
    );
  }
}

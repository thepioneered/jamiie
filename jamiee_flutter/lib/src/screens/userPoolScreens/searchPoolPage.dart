import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';

class SearchPoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.primaryColorPurple.withAlpha(20),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColorPurple,
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.search,
                color: AppColors.primaryColorPurple,
                size: 22,
              ),
            ),
            onPressed: () {},
          )
        ],
        brightness: Brightness.light,
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Text("Search Page for Pool"),
      ),
    );
  }
}

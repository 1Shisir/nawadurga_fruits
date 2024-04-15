import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../utils/consts/sizes.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      PrimaryHeaderContainer(
          child: Column(children: [
        //appbar
        CustomHomeAppBar(),
        SizedBox(height: CustomSizes.spaceBtwnSections),

        //search bar
        CustomSearchContainer(
          showBackground: true,
          showBorder: true,
          text: 'Search',
          icon: Icons.search,
        ),
        SizedBox(height: CustomSizes.spaceBtwnSections),
      ]))
    ])));
  }
}

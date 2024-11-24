import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/common/utils/kcolors.dart';
import 'package:test1/common/widgets/app_style.dart';
import 'package:test1/common/widgets/back_button.dart';
import 'package:test1/common/widgets/logout_bottom_sheet.dart';
import 'package:test1/common/widgets/reusable_text.dart';
import 'package:test1/src/controllers/category_notifier.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: ReusableText(
            text: context.read<CategoryNotifier>().category,
            style: appStyle(16, Kolors.kPrimary, FontWeight.bold)),
      ),
    );
  }
}

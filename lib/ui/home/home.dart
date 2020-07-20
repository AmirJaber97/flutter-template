import 'package:flutter/material.dart';
import 'package:project_template/app/localization.dart';
import 'package:project_template/constants/app_strings.dart';
import 'package:project_template/ui/home/home_viewmodel.dart';
import 'package:project_template/ui/setup/app_base_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.translate(AppStrings.appName)),
      ),
      body: BaseWidget<HomeViewModel>(
        viewModel: HomeViewModel(),
        builder: (_, model, __) {
          return Center(
            child: Text('Template'),
          );
        },
      ),
    );
  }
}

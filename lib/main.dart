import 'package:flutter/material.dart';
import 'package:portfolio_hari_nikesh_r/di/locator.dart';
import 'package:portfolio_hari_nikesh_r/home/repository/HomeRepository.dart';
import 'package:portfolio_hari_nikesh_r/home/viewmodel/HomeViewModel.dart';
import 'package:provider/provider.dart';

import 'core/core_application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => HomeViewModel(homeRepo: locator<HomeRepository>()))
    ],
    child: applicationView(),
  ));
}

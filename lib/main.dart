import 'package:flutter/material.dart';
import 'package:portfolio_hari_nikesh_r/home/viewmodel/HomeViewModel.dart';
import 'package:provider/provider.dart';

import 'core/core_application.dart';
import 'data/di/locator.dart';
import 'data/repository/HomeRepository.dart';

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

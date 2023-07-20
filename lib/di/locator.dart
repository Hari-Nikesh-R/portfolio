import 'package:get_it/get_it.dart';
import 'package:portfolio_hari_nikesh_r/home/repository/impl/HomeRepositoryImpl.dart';
import 'package:portfolio_hari_nikesh_r/service/PackageInfo.dart';

import '../home/repository/HomeRepository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<HomeRepository>(() => HomeRepositoryImpl());
  locator.registerFactory<PackageInfoService>(() => PackageInfoServiceImpl());
}

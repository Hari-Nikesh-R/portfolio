import 'package:get_it/get_it.dart';
import 'package:portfolio_hari_nikesh_r/service/PackageInfo.dart';

import '../repository/HomeRepository.dart';
import '../repository/impl/HomeRepositoryImpl.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<HomeRepository>(() => HomeRepositoryImpl());
  locator.registerFactory<PackageInfoService>(() => PackageInfoServiceImpl());
}

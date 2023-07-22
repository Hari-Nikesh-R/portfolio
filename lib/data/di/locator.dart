import 'package:get_it/get_it.dart';
import 'package:portfolio_hari_nikesh_r/data/repository/impl/project_repository_impl.dart';
import 'package:portfolio_hari_nikesh_r/data/repository/project_repository.dart';
import 'package:portfolio_hari_nikesh_r/service/PackageInfo.dart';

import '../repository/home_repository.dart';
import '../repository/impl/home_repository_impl.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<HomeRepository>(() => HomeRepositoryImpl());
  locator.registerFactory<ProjectRepository>(() => ProjectRepositoryImpl());
  locator.registerFactory<PackageInfoService>(() => PackageInfoServiceImpl());
}

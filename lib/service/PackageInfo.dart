import 'package:package_info_plus/package_info_plus.dart';

abstract class PackageInfoService {
  Future<String> appVersion();
}

class PackageInfoServiceImpl implements PackageInfoService {
  @override
  Future<String> appVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String build = packageInfo.buildNumber;
    return 'v$version ($build)';
  }
}

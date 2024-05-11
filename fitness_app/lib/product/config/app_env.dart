import 'package:envied/envied.dart';
import 'package:fistness_app_firebase/product/config/i_app_env.dart';

part 'app_env.g.dart';

@Envied(path: 'assets/env/.env')
final class AppEnv implements AppEnvConfigure {
  @EnviedField(varName: 'baseUrl')
  static const String _baseUrl = _AppEnv._baseUrl;

  @override
  String get baseUrl => _baseUrl;
}

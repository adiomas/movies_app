// ignore_for_file: constant_identifier_names
enum AppEnvironment {
  DEV(
    env: 'dev',
    appTitle: 'Movies Dev',
  ),
  PROD(
    env: 'prod',
    appTitle: 'Movies Prod',
  );

  final String env;
  final String appTitle;

  const AppEnvironment({
    required this.env,
    required this.appTitle,
  });
}

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get envName => _environment.env;
  static String get appTitle => _environment.appTitle;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.PROD;
  static String get apiBaseUrl => const String.fromEnvironment('API_BASE_URL');
}

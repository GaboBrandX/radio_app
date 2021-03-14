abstract class EnvironmentConfig {
  static const BASE_URL = String.fromEnvironment(
    'ENVIRONMENT_VARIABLES_BASE_URL',
    defaultValue: '...',
  );

  static const API_KEY = String.fromEnvironment(
    'ENVIRONMENT_VARIABLES_API_KEY',
    defaultValue: '...',
  );

  static const API_HOST = String.fromEnvironment(
    'ENVIRONMENT_VARIABLES_API_HOST',
    defaultValue: '...',
  );
}

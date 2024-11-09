
class Constants {
  // API Endpoints
  static const String BASE_URL = 'http://your-api-url';
  static const String WEATHER_API_KEY = 'your-weather-api-key';
  
  // Asset Paths
  static const String LOGO_PATH = 'assets/images/logo.png';
  
  // Theme Colors
  static const Map<String, String> THEME_COLORS = {
    'primary': '#4CAF50',
    'secondary': '#2196F3',
    'error': '#f44336',
  };
  
  // Validation Rules
  static const int MIN_PASSWORD_LENGTH = 8;
  static const int MAX_USERNAME_LENGTH = 50;
  
  // Time Formats
  static const String DATE_FORMAT = 'yyyy-MM-dd';
  static const String TIME_FORMAT = 'HH:mm:ss';
  
  // Cache Keys
  static const String USER_TOKEN_KEY = 'user_token';
  static const String USER_DATA_KEY = 'user_data';
}

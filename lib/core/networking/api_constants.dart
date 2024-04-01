class ApiConstants {
  static const String apiBaseUrl = "https://codingarabic.online/api";

  static const String login = "/login";
  static const String signup = "/register";

// related to home screen
  static const String slider = "/sliders";
  static const String productBestSeller = "/products-bestseller";
  static const String productNewArrivals = "/products-new-arrivals";
  static const String categories = "/categories";
}

//dart run build_runner build --delete-conflicting-outputs
//email: m.s.a.oma6727@gmail.com
//pass: msa@hms6727

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

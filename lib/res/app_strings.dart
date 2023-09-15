final currentYear = DateTime.now().year;
final previousYear = currentYear - 1;

class AppStrings {
  static const String appName = 'Ven3';
  
  static const String baseUrl =
      "https://test-production-4bc9.up.railway.app/";
       static const String networkErrorMessage = "Network error, try again later";

  static const String products =
      "${baseUrl}products/all/";
static   String productDetails({required String productId}) =>
      "${baseUrl}products/product/$productId";
}
  
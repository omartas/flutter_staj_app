import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  Future<void> cacheProducts(String productsJson) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cached_products', productsJson);
  }

  Future<String?> getCachedProducts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cached_products');
  }
}

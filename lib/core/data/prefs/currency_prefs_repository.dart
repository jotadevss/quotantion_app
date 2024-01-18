import 'package:quotantion_app/core/models/currency.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyPrefs {
  static Future<void> saveCurrentCurrency(Currency currency) async {
    final prefs = await SharedPreferences.getInstance();
    final currencyJson = currency.toJson();
    await prefs.setString("current-currency", currencyJson);
  }

  static Future<void> saveCachingCurrency(List<Currency> currencies) async {
    final prefs = await SharedPreferences.getInstance();
    final currenciesJson = currencies.map((c) => c.toJson()).toList();
    prefs.setStringList("cache-currencies", currenciesJson);
  }

  static Future<List<Currency>> getCachingCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    final currenciesJson = prefs.getStringList("cache-currencies")!;
    final List<Currency> currencies = currenciesJson.map((json) => Currency.fromJson(json)).toList();
    return currencies;
  }

  static Future<Currency?> getCurrentCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    final currencyJson = prefs.getString("current-currency");
    return currencyJson == null ? null : Currency.fromJson(currencyJson);
  }
}

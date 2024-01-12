import 'package:quotantion_app/core/models/currency.dart';
import 'package:result_dart/result_dart.dart';

abstract class ICurrencyRepository {
  Future<Result<List<Currency>, Exception>> fetch();
}

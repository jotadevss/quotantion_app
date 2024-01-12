import 'package:dio/dio.dart';
import 'package:quotantion_app/core/data/contracts/currency_repository.dart';
import 'package:quotantion_app/core/models/currency.dart';
import 'package:quotantion_app/shared/extension.dart';
import 'package:result_dart/result_dart.dart';
import 'package:xml/xml.dart';

class DioCurrencyRepository implements ICurrencyRepository {
  final Dio _dio = Dio();

  @override
  Future<Result<List<Currency>, Exception>> fetch() async {
    try {
      final currencies = <Currency>[];
      const url = 'https://economia.awesomeapi.com.br/xml/available/uniq';
      final response = await _dio.get(url);
      final document = XmlDocument.parse(response.data);
      final xmlNode = document.children.whereType<XmlElement>().first.children;
      for (var xml in xmlNode) {
        final code = xml.toString().innerXmlCode();
        final name = xml.innerText;
        currencies.add(Currency(code: code, name: name));
      }
      return Success(currencies);
    } on DioException catch (e) {
      return Failure(e);
    }
  }
}

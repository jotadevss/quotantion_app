import 'package:asp/asp.dart';
import 'package:quotantion_app/core/models/currency.dart';

final currentCurrencyAtom = Atom<Currency?>(null);

// Getter
Currency? get currentCurrency => currentCurrencyAtom.value;

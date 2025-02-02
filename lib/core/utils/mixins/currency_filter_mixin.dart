import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/data/models/socket_models/asset_model.dart';

mixin CurrencyFilterMixin {
  bool matchesSearchQuery(CurrencyModel element, String searchText) {
    final codeMatch = element.code.toLowerCase().contains(searchText);
    final currencyName =
        ConstAppTexts.currencies[element.code]?.toLowerCase() ?? '';
    final nameMatch = currencyName.contains(searchText);
    return codeMatch || nameMatch;
  }
}

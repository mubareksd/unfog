// Custom delegates extend package-private Flutter localization bases.
// ignore_for_file: implementation_imports

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/src/widgets_localizations.dart';

class _TiWidgetsLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const _TiWidgetsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ti';

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    return SynchronousFuture<WidgetsLocalizations>(
      const TiWidgetsLocalization(),
    );
  }

  @override
  bool shouldReload(_TiWidgetsLocalizationsDelegate old) => false;
}

class TiWidgetsLocalization extends GlobalWidgetsLocalizations {
  /// Create an instance of the translation bundle for Tigrinya.
  ///
  /// For details on the meaning of the arguments, see
  /// [GlobalWidgetsLocalizations].
  const TiWidgetsLocalization() : super(TextDirection.ltr);

  @override
  String get reorderItemDown => 'ናብ ታሕቲ ኣውሰድ';

  @override
  String get reorderItemLeft => 'ናብ ጸጋም ኣውሰድ';

  @override
  String get reorderItemRight => 'ናብ የማን ኣውሰድ';

  @override
  String get reorderItemToEnd => 'ናብ መወዳእታ ኣውሰድ';

  @override
  String get reorderItemToStart => 'ናብ መጀመርታ ኣውሰድ';

  @override
  String get reorderItemUp => 'ናብ ላዕሊ ኣውሰድ';

  static const LocalizationsDelegate<WidgetsLocalizations> delegate =
      _TiWidgetsLocalizationsDelegate();

  @override
  String get copyButtonLabel => 'ቅዳ';

  @override
  String get cutButtonLabel => 'ቁርጽ';

  @override
  String get lookUpButtonLabel => 'ርአ';

  @override
  String get pasteButtonLabel => 'ኣንጥፍ';

  @override
  String get searchWebButtonLabel => 'ኣብ ኢንተርነት ድለይ';

  @override
  String get selectAllButtonLabel => 'ኩሉ ምረጽ';

  @override
  String get shareButtonLabel => 'ኣካፍል';

  @override
  String get noResultsFound => 'ውጽኢት ኣይተረኸበን';

  @override
  String get searchResultsFound => 'ውጽኢታት ድለይ';

  @override
  String get radioButtonUnselectedLabel => 'ዘይተመረጸ';
}

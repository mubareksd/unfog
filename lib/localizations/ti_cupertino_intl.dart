// Custom delegates extend package-private Flutter localization bases.
// ignore_for_file: implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/src/cupertino_localizations.dart';
import 'package:intl/intl.dart' as intl;

class _TiCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _TiCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ti';

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    final localeName = intl.Intl.canonicalizedLocale(locale.toString());
    return SynchronousFuture<CupertinoLocalizations>(
      TiCupertinoLocalization(
        localeName: localeName,
        dayFormat: intl.DateFormat('y', localeName),
        decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
        doubleDigitMinuteFormat: intl.DateFormat('y', localeName),
        fullYearFormat: intl.DateFormat('y', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        singleDigitHourFormat: intl.DateFormat('y', localeName),
        singleDigitMinuteFormat: intl.DateFormat('y', localeName),
        singleDigitSecondFormat: intl.DateFormat('y', localeName),
        weekdayFormat: intl.DateFormat('y', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_TiCupertinoLocalizationsDelegate old) => false;
}

class TiCupertinoLocalization extends GlobalCupertinoLocalizations {
  /// Create an instance of the translation bundle for Tigrinya.
  ///
  /// For details on the meaning of the arguments, see
  /// [GlobalCupertinoLocalizations].
  const TiCupertinoLocalization({
    required super.fullYearFormat,
    required super.dayFormat,
    required super.weekdayFormat,
    required super.mediumDateFormat,
    required super.singleDigitHourFormat,
    required super.singleDigitMinuteFormat,
    required super.doubleDigitMinuteFormat,
    required super.singleDigitSecondFormat,
    required super.decimalFormat,
    super.localeName = 'ti',
  });

  @override
  String get alertDialogLabel => 'መጠንቀቕታ';

  @override
  String get anteMeridiemAbbreviation => 'ጠዋት';

  @override
  String get clearButtonLabel => 'ኣጽርይ';

  @override
  String get copyButtonLabel => 'ቅዳ';

  @override
  String get cutButtonLabel => 'ቁርጽ';

  @override
  String get datePickerDateOrderString => 'dmy';

  @override
  String get datePickerDateTimeOrderString => 'date_time_dayPeriod';

  @override
  String? get datePickerHourSemanticsLabelFew => null;

  @override
  String? get datePickerHourSemanticsLabelMany => null;

  @override
  String? get datePickerHourSemanticsLabelOne => r'$hour ሰዓት';

  @override
  String get datePickerHourSemanticsLabelOther => r'$hour ሰዓት';

  @override
  String? get datePickerHourSemanticsLabelTwo => null;

  @override
  String? get datePickerHourSemanticsLabelZero => null;

  @override
  String? get datePickerMinuteSemanticsLabelFew => null;

  @override
  String? get datePickerMinuteSemanticsLabelMany => null;

  @override
  String? get datePickerMinuteSemanticsLabelOne => '1 ደቒቓ';

  @override
  String get datePickerMinuteSemanticsLabelOther => r'$minute ደቒቓ';

  @override
  String? get datePickerMinuteSemanticsLabelTwo => null;

  @override
  String? get datePickerMinuteSemanticsLabelZero => null;

  @override
  String get lookUpButtonLabel => 'ርአ';

  @override
  String get menuDismissLabel => 'ምናሌ ኣሰናቕት';

  @override
  String get modalBarrierDismissLabel => 'ኣሰናቕት';

  @override
  String get noSpellCheckReplacementsLabel => 'ዝወክስ ኣይተረኸበን';

  @override
  String get pasteButtonLabel => 'ኣንጥፍ';

  @override
  String get postMeridiemAbbreviation => 'ድሕሪ ቐትሪ';

  @override
  String get searchTextFieldPlaceholderLabel => 'ድለይ';

  @override
  String get searchWebButtonLabel => 'ኣብ ኢንተርነት ድለይ';

  @override
  String get selectAllButtonLabel => 'ኩሉ ምረጽ';

  @override
  String get shareButtonLabel => 'ኣካፍል...';

  @override
  String get tabSemanticsLabelRaw => r'ትም $tabIndex ካብ $tabCount';

  @override
  String? get timerPickerHourLabelFew => null;

  @override
  String? get timerPickerHourLabelMany => null;

  @override
  String? get timerPickerHourLabelOne => 'ሰዓት';

  @override
  String get timerPickerHourLabelOther => 'ሰዓታት';

  @override
  String? get timerPickerHourLabelTwo => null;

  @override
  String? get timerPickerHourLabelZero => null;

  @override
  String? get timerPickerMinuteLabelFew => null;

  @override
  String? get timerPickerMinuteLabelMany => null;

  @override
  String? get timerPickerMinuteLabelOne => 'ደቒቓ';

  @override
  String get timerPickerMinuteLabelOther => 'ደቒቓ';

  @override
  String? get timerPickerMinuteLabelTwo => null;

  @override
  String? get timerPickerMinuteLabelZero => null;

  @override
  String? get timerPickerSecondLabelFew => null;

  @override
  String? get timerPickerSecondLabelMany => null;

  @override
  String? get timerPickerSecondLabelOne => 'ካልኢት';

  @override
  String get timerPickerSecondLabelOther => 'ካልኢት';

  @override
  String? get timerPickerSecondLabelTwo => null;

  @override
  String? get timerPickerSecondLabelZero => null;

  @override
  String get todayLabel => 'ሎሚ';

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _TiCupertinoLocalizationsDelegate();

  @override
  String get backButtonLabel => 'ተመለስ';

  @override
  String get cancelButtonLabel => 'ኣቋርጽ';

  @override
  String get collapsedHint => 'ተዘርጊኡ';

  @override
  String get expandedHint => 'ተጸቢቑ';

  @override
  String get expansionTileCollapsedHint => 'ንምስፍሓሕ ክልተ ግዜ ጠውቕ';

  @override
  String get expansionTileCollapsedTapHint => 'ንዝያዳ ዝርዝር ኣስፍሕ';

  @override
  String get expansionTileExpandedHint => 'ንምጽባት ክልተ ግዜ ጠውቕ';

  @override
  String get expansionTileExpandedTapHint => 'ጽባት';
}

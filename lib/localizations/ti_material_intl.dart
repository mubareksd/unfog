import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/src/material_localizations.dart';
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/intl.dart' as intl;

const Map<String, String> tiLocaleDatePatterns = <String, String>{
  'd': 'd',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
  'LLLL': 'LLLL',
  'M': 'L',
  'Md': 'M/d',
  'MEd': 'EEE፣ M/d',
  'MMM': 'LLL',
  'MMMd': 'MMM d',
  'MMMEd': 'EEE፣ MMM d',
  'MMMM': 'LLLL',
  'MMMMd': 'MMMM d',
  'MMMMEEEEd': 'EEEE፣ MMMM d',
  'QQQ': 'QQQ',
  'QQQQ': 'QQQQ',
  'y': 'y',
  'yM': 'M/y',
  'yMd': 'd/M/y',
  'yMEd': 'EEE፣ d/M/y',
  'yMMM': 'MMM y',
  'yMMMd': 'd MMM y',
  'yMMMEd': 'EEE፣ MMM d y',
  'yMMMM': 'MMMM y',
  'yMMMMd': 'd MMMM y',
  'yMMMMEEEEd': 'y MMMM d, EEEE',
  'yQQQ': 'QQQ y',
  'yQQQQ': 'QQQQ y',
  'H': 'H',
  'Hm': 'HH:mm',
  'Hms': 'HH:mm:ss',
  'j': 'h a',
  'jm': 'h:mm a',
  'jms': 'h:mm:ss a',
  'jmv': 'h:mm a v',
  'jmz': 'h:mm a z',
  'jz': 'h a z',
  'm': 'm',
  'ms': 'mm:ss',
  's': 's',
  'v': 'v',
  'z': 'z',
  'zzzz': 'zzzz',
  'ZZZZ': 'ZZZZ',
};

const Map<String, Object> tiDateSymbols = <String, Object>{
  'NAME': 'ti',
  'ERAS': <String>[
    'ዓ/ዓ',
    'ዓ/ም',
  ],
  'ERANAMES': <String>[
    'ዓመተ ዓለም',
    'ዓመተ ምሕረት',
  ],
  'NARROWMONTHS': <String>[
    'ጃ',
    'ፌ',
    'ማ',
    'ኤ',
    'ሜ',
    'ጁ',
    'ጁ',
    'ኦ',
    'ሴ',
    'ኦ',
    'ኖ',
    'ዲ',
  ],
  'STANDALONENARROWMONTHS': <String>[
    'ጃ',
    'ፌ',
    'ማ',
    'ኤ',
    'ሜ',
    'ጁ',
    'ጁ',
    'ኦ',
    'ሴ',
    'ኦ',
    'ኖ',
    'ዲ',
  ],
  'MONTHS': <String>[
    'ጃንዩወሪ',
    'ፌብሩወሪ',
    'ማርች',
    'ኤፕሪል',
    'ሜይ',
    'ጁን',
    'ጁላይ',
    'ኦገስት',
    'ሴፕቴምበር',
    'ኦክቶበር',
    'ኖቬምበር',
    'ዲሴምበር',
  ],
  'STANDALONEMONTHS': <String>[
    'ጃንዩወሪ',
    'ፌብሩወሪ',
    'ማርች',
    'ኤፕሪል',
    'ሜይ',
    'ጁን',
    'ጁላይ',
    'ኦገስት',
    'ሴፕቴምበር',
    'ኦክቶበር',
    'ኖቬምበር',
    'ዲሴምበር',
  ],
  'SHORTMONTHS': <String>[
    'ጃንዩ',
    'ፌብሩ',
    'ማርች',
    'ኤፕሪ',
    'ሜይ',
    'ጁን',
    'ጁላይ',
    'ኦገስ',
    'ሴፕቴ',
    'ኦክቶ',
    'ኖቬም',
    'ዲሴም',
  ],
  'STANDALONESHORTMONTHS': <String>[
    'ጃንዩ',
    'ፌብሩ',
    'ማርች',
    'ኤፕሪ',
    'ሜይ',
    'ጁን',
    'ጁላይ',
    'ኦገስ',
    'ሴፕቴ',
    'ኦክቶ',
    'ኖቬም',
    'ዲሴም',
  ],
  'WEEKDAYS': <String>[
    'ሰንበት',
    'ሰኑይ',
    'ሰሉስ',
    'ረቡዕ',
    'ሓሙስ',
    'ዓርቢ',
    'ቀዳም',
  ],
  'STANDALONEWEEKDAYS': <String>[
    'ሰንበት',
    'ሰኑይ',
    'ሰሉስ',
    'ረቡዕ',
    'ሓሙስ',
    'ዓርቢ',
    'ቀዳም',
  ],
  'SHORTWEEKDAYS': <String>[
    'ሰንበ',
    'ሰኑይ',
    'ሰሉስ',
    'ረቡዕ',
    'ሓሙስ',
    'ዓርቢ',
    'ቀዳም',
  ],
  'STANDALONESHORTWEEKDAYS': <String>[
    'ሰንበ',
    'ሰኑይ',
    'ሰሉስ',
    'ረቡዕ',
    'ሓሙስ',
    'ዓርቢ',
    'ቀዳም',
  ],
  'NARROWWEEKDAYS': <String>[
    'ሰ',
    'ኑ',
    'ሉ',
    'ረ',
    'ሓ',
    'ዓ',
    'ቀ',
  ],
  'STANDALONENARROWWEEKDAYS': <String>[
    'ሰ',
    'ኑ',
    'ሉ',
    'ረ',
    'ሓ',
    'ዓ',
    'ቀ',
  ],
  'SHORTQUARTERS': <String>[
    'ሩብ 1',
    'ሩብ 2',
    'ሩብ 3',
    'ሩብ 4',
  ],
  'QUARTERS': <String>[
    '1ይ ሩብዒ',
    '2ይ ሩብዒ',
    '3ይ ሩብዒ',
    '4ይ ሩብዒ',
  ],
  'AMPMS': <String>[
    'ጠዋት',
    'ድሕሪ ቐትሪ',
  ],
  'DATEFORMATS': <String>[
    'y MMMM d, EEEE',
    'd MMMM y',
    'd MMM y',
    'dd/MM/y',
  ],
  'TIMEFORMATS': <String>[
    'h:mm:ss a zzzz',
    'h:mm:ss a z',
    'h:mm:ss a',
    'h:mm a',
  ],
  'FIRSTDAYOFWEEK': 6,
  'WEEKENDRANGE': <int>[
    5,
    6,
  ],
  'FIRSTWEEKCUTOFFDAY': 5,
  'DATETIMEFORMATS': <String>[
    '{1} {0}',
    '{1} {0}',
    '{1} {0}',
    '{1} {0}',
  ],
};

class _TiMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _TiMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ti';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final localeName = intl.Intl.canonicalizedLocale(locale.toString());

    // The locale (in this case `ti`) needs to be initialized into the custom
    // date symbols and patterns setup that Flutter uses.
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: tiLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(tiDateSymbols),
    );

    return SynchronousFuture<MaterialLocalizations>(
      TiMaterialLocalizations(
        localeName: localeName,
        decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'en_US'),
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_TiMaterialLocalizationsDelegate old) => false;
}
// #enddocregion Delegate

class TiMaterialLocalizations extends GlobalMaterialLocalizations {
  /// Create an instance of the translation bundle for Tigrinya.
  ///
  /// For details on the meaning of the arguments, see [GlobalMaterialLocalizations].
  const TiMaterialLocalizations({
    required super.fullYearFormat,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
    super.localeName = 'ti',
  });

  @override
  String get aboutListTileTitleRaw => r'ብዛዕባ $applicationName';

  @override
  String get alertDialogLabel => 'መጠንቀቕታ';

  @override
  String get anteMeridiemAbbreviation => 'ጠዋት';

  @override
  String get backButtonTooltip => 'ተመለስ';

  @override
  String get bottomSheetLabel => 'ትሕቲ ወረቐት';

  @override
  String get calendarModeButtonLabel => 'ናብ ዕለት ዳይለይ ቀይር';

  @override
  String get cancelButtonLabel => 'ኣቋርጽ';

  @override
  String get clearButtonTooltip => 'ጽሑፍ ኣጽርይ';

  @override
  String get closeButtonLabel => 'ዕጸዋ';

  @override
  String get closeButtonTooltip => 'ዕጸዋ';

  @override
  String get collapsedHint => 'ተጠቒኡ';

  @override
  String get collapsedIconTapHint => 'ኣስፍሕ';

  @override
  String get continueButtonLabel => 'ቀፃሊ';

  @override
  String get copyButtonLabel => 'ቅዳ';

  @override
  String get currentDateLabel => 'ሎሚ';

  @override
  String get cutButtonLabel => 'ቁርጽ';

  @override
  String get dateHelpText => 'ወወ/ቀቀ/ዓዓዓ';

  @override
  String get dateInputLabel => 'ዕለት ኣእትው';

  @override
  String get dateOutOfRangeLabel => 'ካብ ወሰን ወጻኢ።';

  @override
  String get datePickerHelpText => 'ዕለት ምረጽ';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'መወዳእታዊ ዕለት $fullDate';

  @override
  String get dateRangeEndLabel => 'መወዳእታዊ ዕለት';

  @override
  String get dateRangePickerHelpText => 'ክልል ምረጽ';

  @override
  String get dateRangeStartDateSemanticLabelRaw => r'መጀመርታዊ ዕለት $fullDate';

  @override
  String get dateRangeStartLabel => 'መጀመርታዊ ዕለት';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'ሰርዝ';

  @override
  String get dialModeButtonLabel => 'ናብ ዳይል ምውሳእ ቀይር';

  @override
  String get dialogLabel => 'ምዕራፍ';

  @override
  String get drawerLabel => 'ዳሰሳ ምናሌ';

  @override
  String get expandedHint => 'ተጸቢቑ';

  @override
  String get expandedIconTapHint => 'ጽባት';

  @override
  String get expansionTileCollapsedHint => 'ንምስፍሓሕ ክልተ ግዜ ጠውቕ';

  @override
  String get expansionTileCollapsedTapHint => 'ንዝያዳ ዝርዝር ኣስፍሕ';

  @override
  String get expansionTileExpandedHint => 'ንምጽባት ክልተ ግዜ ጠውቕ';

  @override
  String get expansionTileExpandedTapHint => 'ጽባት';

  @override
  String get firstPageTooltip => 'መጀመርታዊ ገጽ';

  @override
  String get hideAccountsLabel => 'መለያታት ሕባእ';

  @override
  String get inputDateModeButtonLabel => 'ናብ ግብዒ ቀይር';

  @override
  String get inputTimeModeButtonLabel => 'ናብ ጽሑፍ ግብዒ ቀይር';

  @override
  String get invalidDateFormatLabel => 'ዘይቅኑዕ ቅርጺ።';

  @override
  String get invalidDateRangeLabel => 'ዘይቅኑዕ ክልል።';

  @override
  String get invalidTimeLabel => 'ቅኑዕ ሰዓት ኣእትው';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'ናብ ድሕሪ ደምስሲ';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeyChannelDown => 'ቻነል ታሕቲ';

  @override
  String get keyboardKeyChannelUp => 'ቻነል ላዕሊ';

  @override
  String get keyboardKeyControl => 'Ctrl';

  @override
  String get keyboardKeyDelete => 'Del';

  @override
  String get keyboardKeyEject => 'ኣውጽእ';

  @override
  String get keyboardKeyEnd => 'ፍጻሜ';

  @override
  String get keyboardKeyEscape => 'Esc';

  @override
  String get keyboardKeyFn => 'Fn';

  @override
  String get keyboardKeyHome => 'መእተዊ';

  @override
  String get keyboardKeyInsert => 'ኣእትው';

  @override
  String get keyboardKeyMeta => 'ሜታ';

  @override
  String get keyboardKeyMetaMacOs => 'ትእዛዝ';

  @override
  String get keyboardKeyMetaWindows => 'Win';

  @override
  String get keyboardKeyNumLock => 'Num Lock';

  @override
  String get keyboardKeyNumpad0 => 'Num 0';

  @override
  String get keyboardKeyNumpad1 => 'Num 1';

  @override
  String get keyboardKeyNumpad2 => 'Num 2';

  @override
  String get keyboardKeyNumpad3 => 'Num 3';

  @override
  String get keyboardKeyNumpad4 => 'Num 4';

  @override
  String get keyboardKeyNumpad5 => 'Num 5';

  @override
  String get keyboardKeyNumpad6 => 'Num 6';

  @override
  String get keyboardKeyNumpad7 => 'Num 7';

  @override
  String get keyboardKeyNumpad8 => 'Num 8';

  @override
  String get keyboardKeyNumpad9 => 'Num 9';

  @override
  String get keyboardKeyNumpadAdd => 'Num +';

  @override
  String get keyboardKeyNumpadComma => 'Num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'Num .';

  @override
  String get keyboardKeyNumpadDivide => '+NUM';

  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';

  @override
  String get keyboardKeyNumpadEqual => 'Num =';

  @override
  String get keyboardKeyNumpadMultiply => 'Num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';

  @override
  String get keyboardKeyNumpadParenRight => 'Num )';

  @override
  String get keyboardKeyNumpadSubtract => 'Num -';

  @override
  String get keyboardKeyPageDown => 'PgDown';

  @override
  String get keyboardKeyPageUp => 'PgUp';

  @override
  String get keyboardKeyPower => 'ሓይሊ';

  @override
  String get keyboardKeyPowerOff => 'ሓይሊ ኣጥፍእ';

  @override
  String get keyboardKeyPrintScreen => 'Print Screen';

  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';

  @override
  String get keyboardKeySelect => 'ምረጽ';

  @override
  String get keyboardKeyShift => 'Shift';

  @override
  String get keyboardKeySpace => 'ክፍቲ';

  @override
  String get lastPageTooltip => 'መወዳእታዊ ገጽ';

  @override
  String? get licensesPackageDetailTextFew => null;

  @override
  String? get licensesPackageDetailTextMany => null;

  @override
  String? get licensesPackageDetailTextOne => '1 ፍቓድ';

  @override
  String get licensesPackageDetailTextOther => r'$licenseCount ፍቓዳት';

  @override
  String? get licensesPackageDetailTextTwo => null;

  @override
  String? get licensesPackageDetailTextZero => 'ፍቓድ የለን';

  @override
  String get licensesPageTitle => 'ፍቓዳት';

  @override
  String get lookUpButtonLabel => 'ርአ';

  @override
  String get menuBarMenuLabel => 'ናይ ምናሌ ባር ምናሌ';

  @override
  String get menuDismissLabel => 'ምናሌ ኣሰናቕት';

  @override
  String get modalBarrierDismissLabel => 'ኣሰናቕት';

  @override
  String get moreButtonTooltip => 'ዝያዳ';

  @override
  String get nextMonthTooltip => 'ዝቕጽል ወርሒ';

  @override
  String get nextPageTooltip => 'ዝቕጽል ገጽ';

  @override
  String get okButtonLabel => 'እወ';

  @override
  String get openAppDrawerTooltip => 'ዳሰሳ ምናሌ ክፈት';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow ካብ $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      r'$firstRow–$lastRow ካብ $rowCount ግደብ';

  @override
  String get pasteButtonLabel => 'ኣንጥፍ';

  @override
  String get popupMenuLabel => 'ብቅ-ባይ ምናሌ';

  @override
  String get postMeridiemAbbreviation => 'ድሕሪ ቐትሪ';

  @override
  String get previousMonthTooltip => 'ዝሓለፈ ወርሒ';

  @override
  String get previousPageTooltip => 'ዝሓለፈ ገጽ';

  @override
  String get refreshIndicatorSemanticLabel => 'ኣሐድስ';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String? get remainingTextFieldCharacterCountOne => '1 ፊደል ይተረፍ';

  @override
  String get remainingTextFieldCharacterCountOther =>
      r'$remainingCount ፊደላት ይተረፉ';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String? get remainingTextFieldCharacterCountZero => null;

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

  @override
  String get rowsPerPageTitle => 'ረድፍ ኣብ ገጽ፦';

  @override
  String get saveButtonLabel => 'ኣቐምጥ';

  @override
  String get scanTextButtonLabel => 'ጽሑፍ ድህስስ';

  @override
  String get scrimLabel => 'ዳሓዊ';

  @override
  String get scrimOnTapHintRaw => r'$modalRouteContentName ዕጸዋ';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'ድለይ';

  @override
  String get searchWebButtonLabel => 'ኣብ ኢንተርነት ድለይ';

  @override
  String get selectAllButtonLabel => 'ኩሉ ምረጽ';

  @override
  String get selectYearSemanticsLabel => 'ዓመት ምረጽ';

  @override
  String get selectedDateLabel => 'ተመሪጹ';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String? get selectedRowCountTitleOne => '1 ንጥል ተመሪጹ';

  @override
  String get selectedRowCountTitleOther => r'$selectedRowCount ንጥላት ተመሪጾም';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String? get selectedRowCountTitleZero => null;

  @override
  String get shareButtonLabel => 'ኣካፍል';

  @override
  String get showAccountsLabel => 'መለያታት ኣርኢ';

  @override
  String get showMenuTooltip => 'ምናሌ ኣርኢ';

  @override
  String get signedInLabel => 'ብመንነት ተኣቲዩ';

  @override
  String get tabLabelRaw => r'ትም $tabIndex ካብ $tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.H_colon_mm;

  @override
  String get timePickerDialHelpText => 'ሰዓት ምረጽ';

  @override
  String get timePickerHourLabel => 'ሰዓት';

  @override
  String get timePickerHourModeAnnouncement => 'ሰዓታት ምረጽ';

  @override
  String get timePickerInputHelpText => 'ሰዓት ኣእትው';

  @override
  String get timePickerMinuteLabel => 'ደቒቓ';

  @override
  String get timePickerMinuteModeAnnouncement => 'ደቒቓ ምረጽ';

  @override
  String get unspecifiedDate => 'ዕለት';

  @override
  String get unspecifiedDateRange => 'ክልል ዕለታት';

  @override
  String get viewLicensesButtonLabel => 'ፍቓዳት ርአ';

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _TiMaterialLocalizationsDelegate();
}

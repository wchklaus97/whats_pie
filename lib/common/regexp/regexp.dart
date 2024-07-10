import 'package:collection/collection.dart';
import 'package:whats_pie/common/enum.dart';

class WhatsAppRegex {
  final RegExp msgRegExp;
  final RegExp dateTimeRegExp;
  final RegExp attachmentRegExp;
  final WhatsAppPlatform platform;
  final MobileLocale locale;

  WhatsAppRegex._({
    required this.msgRegExp,
    required this.dateTimeRegExp,
    required this.attachmentRegExp,
    required this.platform,
    required this.locale,
  });

  static final _aosZhHantHK = WhatsAppRegex._(
      platform: WhatsAppPlatform.android,
      locale: MobileLocale.zhHantHK,
      msgRegExp:
          RegExp(r'^(\d{1,2})\/(\d{1,2})\/(\d{4})\s(\d{2}):(\d{2})\s-\s(.*)'),
      dateTimeRegExp: RegExp(r'^(\d{1,2}/\d{1,2}/\d{4}) (\d{2}:\d{2}) - '),
      attachmentRegExp: RegExp(r'\b(.*?)\s\(附件檔案\)'));

  static final _aosEN = WhatsAppRegex._(
      platform: WhatsAppPlatform.android,
      locale: MobileLocale.enUS,
      msgRegExp:
          RegExp(r'^(\d{1,2})\/(\d{1,2})\/(\d{4})\s(\d{2}):(\d{2})\s-\s(.*)'),
      dateTimeRegExp: RegExp(r'^(\d{1,2}/\d{1,2}/\d{4}) (\d{2}:\d{2}) - '),
      attachmentRegExp: RegExp(r'\b(.*?)\s\(附件檔案\)'));

  static final _iosZhHantHK = WhatsAppRegex._(
      platform: WhatsAppPlatform.iOS,
      locale: MobileLocale.zhHantHK,
      msgRegExp: RegExp(
          r'\[(\d{1,2}/\d{1,2}/\d{4})\s*(上午|下午)?(\d{1,2}):(\d{2}):(\d{2})\]\s*(\w+(?:\s\w+)*)\s*:\s*(.*)'),
      dateTimeRegExp: RegExp(
          r'\[(\d{1,2}/\d{1,2}/\d{4})\s*(上午|下午)?(\d{1,2}:\d{2}:\d{2})\]'),
      attachmentRegExp: RegExp(r'<附件：(.*?)>'));

  static final _iosEN = WhatsAppRegex._(
      platform: WhatsAppPlatform.iOS,
      locale: MobileLocale.enUS,
      msgRegExp: RegExp(
          r'\[(\d{1,2}/\d{1,2}/\d{4}),\s*(\d{1,2}):(\d{2}):(\d{2})\s*(AM|PM)?\]\s*(\w+(?:\s\w+)*)\s*:\s*(.*)'),
      dateTimeRegExp: RegExp(
          r'\[(\d{1,2}/\d{1,2}/\d{4}),\s*(\d{1,2}:\d{2}:\d{2})\s*(AM|PM)?\]'),
      attachmentRegExp: RegExp(r'<attached:\s*(.*?)>'));

  static final Map<MobileLocale, String> supportLocales = {
    MobileLocale.zhHantHK: "zh-hant-hk",
    MobileLocale.enUS: "en-us",
  };

  static final Map<WhatsAppPlatform, String> supportPlatforms = {
    WhatsAppPlatform.android: "Android",
    WhatsAppPlatform.iOS: "iOS",
  };

  static final List<WhatsAppRegex> _regexs = [
    _aosZhHantHK,
    _aosEN,
    _iosZhHantHK,
    _iosEN
  ];

  static String getPlatformName(WhatsAppPlatform platform) =>
      supportPlatforms[platform]!;

  static String getLocaleName(MobileLocale locale) => supportLocales[locale]!;

  static WhatsAppRegex get(
      {required WhatsAppPlatform platform, required MobileLocale locale}) {
    final regex = _regexs
        .firstWhereOrNull((v) => v.platform == platform && v.locale == locale);
    if (regex == null) return _aosZhHantHK;
    return regex;
  }

  WhatsAppRegex copyWith({WhatsAppPlatform? platform, MobileLocale? locale}) =>
      get(platform: platform ?? this.platform, locale: locale ?? this.locale);
}

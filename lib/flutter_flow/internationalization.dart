import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'gu'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? guText = '',
  }) =>
      [enText, hiText, guText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '98zk6tdj': {
      'en': 'rivinsight',
      'gu': 'રિવિન્સાઈટ',
      'hi': 'rivinsight',
    },
    '357vmj3h': {
      'en': 'Sabarmati River Information ',
      'gu': 'સાબરમતી નદીની માહિતી',
      'hi': 'साबरमती नदी की जानकारी',
    },
    '1ehx5v3g': {
      'en': 'Water Quality',
      'gu': 'પાણીની ગુણવત્તા',
      'hi': 'पानी की गुणवत्ता',
    },
    '33knysio': {
      'en': 'Water FLow',
      'gu': 'જળપ્રવાહ',
      'hi': 'पानी का प्रवाह',
    },
    '82vw2k1x': {
      'en': 'Minarals',
      'gu': 'મિનરલ્સ',
      'hi': 'खनिज पदार्थ',
    },
    '5a2sx184': {
      'en': 'Water Level',
      'gu': 'પાણીનું સ્તર',
      'hi': 'पानी की सतह',
    },
    'sbxlfo8s': {
      'en': 'Temperature ',
      'gu': 'તાપમાન',
      'hi': 'तापमान',
    },
    'eauki6hy': {
      'en': 'Weather Information',
      'gu': 'હવામાન માહિતી',
      'hi': 'मौसम की जानकारी',
    },
    'rec08qpn': {
      'en': 'Weather ',
      'gu': 'હવામાન',
      'hi': 'मौसम',
    },
    '7a8jk8zo': {
      'en': 'Flood Risk',
      'gu': 'પૂરનું જોખમ',
      'hi': 'बाढ़ का खतरा',
    },
    'yky71ogq': {
      'en': '12%',
      'gu': '12%',
      'hi': '12%',
    },
    '39wzbbyu': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // Auth1
  {
    'reelhfm7': {
      'en': 'Sign In',
      'gu': 'સાઇન ઇન કરો',
      'hi': 'दाखिल करना',
    },
    'ha3f4y04': {
      'en': 'Sign Up',
      'gu': 'સાઇન અપ કરો',
      'hi': 'साइन अप करें',
    },
    '76losvwu': {
      'en': 'Let\'s get started by filling out the form below.',
      'gu': 'ચાલો નીચેનું ફોર્મ ભરીને શરૂઆત કરીએ.',
      'hi': 'आइए नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
    },
    's2d7cblr': {
      'en': 'Email',
      'gu': 'ઈમેલ',
      'hi': 'ईमेल',
    },
    'wll360xx': {
      'en': 'Password',
      'gu': 'પાસવર્ડ',
      'hi': 'पासवर्ड',
    },
    'xh7cweam': {
      'en': 'Sign In',
      'gu': 'સાઇન ઇન કરો',
      'hi': 'दाखिल करना',
    },
    'jws0hxzb': {
      'en': 'Forgot Password',
      'gu': 'પાસવર્ડ ભૂલી ગયા છો',
      'hi': 'पासवर्ड भूल गए',
    },
    'ihch3ioy': {
      'en': 'Or sign up with',
      'gu': 'અથવા સાથે સાઇન અપ કરો',
      'hi': 'या इसके साथ साइन अप करें',
    },
    'x9jsx3ei': {
      'en': 'Continue with Google',
      'gu': 'Google સાથે ચાલુ રાખો',
      'hi': 'Google के साथ जारी रखें',
    },
    '5hp9afvv': {
      'en': 'Continue with Apple',
      'gu': 'Apple સાથે ચાલુ રાખો',
      'hi': 'एप्पल के साथ जारी रखें',
    },
    'r5glt34a': {
      'en': 'Email',
      'gu': 'ઈમેલ',
      'hi': 'ईमेल',
    },
    'euck9wr5': {
      'en': 'Password',
      'gu': 'પાસવર્ડ',
      'hi': 'पासवर्ड',
    },
    'aocof8sm': {
      'en': 'Confirm Password',
      'gu': 'પાસવર્ડની પુષ્ટિ કરો',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
    },
    'tbcal48s': {
      'en': 'Create Account',
      'gu': 'ખાતું બનાવો',
      'hi': 'खाता बनाएं',
    },
    'r19isetu': {
      'en': 'Or sign up with',
      'gu': 'અથવા સાથે સાઇન અપ કરો',
      'hi': 'या इसके साथ साइन अप करें',
    },
    'kg6amz43': {
      'en': 'Continue with Google',
      'gu': 'Google સાથે ચાલુ રાખો',
      'hi': 'Google के साथ जारी रखें',
    },
    '6kh73lhv': {
      'en': 'Continue with Apple',
      'gu': 'Apple સાથે ચાલુ રાખો',
      'hi': 'एप्पल के साथ जारी रखें',
    },
    'z7f5g0cm': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // ProfilePage
  {
    'edma6tmv': {
      'en': 'Edit Profile',
      'gu': '',
      'hi': '',
    },
    'mi1305l1': {
      'en': 'Change Password',
      'gu': '',
      'hi': '',
    },
    'bq0euvek': {
      'en': 'Notification Settings',
      'gu': '',
      'hi': '',
    },
    '5hwjrmgs': {
      'en': 'Terms of Services',
      'gu': '',
      'hi': '',
    },
    '3icpcb3r': {
      'en': 'Log Out',
      'gu': '',
      'hi': '',
    },
    'bnqrbi6x': {
      'en': 'Profile',
      'gu': '',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'pu7akcbu': {
      'en': 'Allow rivinsight to send Notifications?',
      'gu': 'rivinsight ને સૂચનાઓ મોકલવાની મંજૂરી આપીએ?',
      'hi': 'रिविंसाइट को सूचनाएं भेजने की अनुमति दें?',
    },
    'hailxhv1': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '54t7jfmw': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'jdewea0a': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'bqpdsbvh': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'i8gxwif9': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'qpr496tw': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'rxit8a70': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'c7l6wolw': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '0ill99x8': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'ptykwnz7': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'zkd9fu7n': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'x230qjae': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '4ktrlw19': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '9budqwwe': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '9zloapmk': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'syc5fsdm': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'qqpo4yav': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'ygtr0f8x': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'lmt3bdgz': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '59mqyhf4': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'rhbl5jjp': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '4kdvovj6': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'j0vjj7gt': {
      'en': '',
      'gu': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));

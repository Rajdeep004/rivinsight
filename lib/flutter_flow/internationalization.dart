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
    'tfelqbqu': {
      'en': 'rivinsight',
      'gu': '',
      'hi': '',
    },
    '162h702h': {
      'en': 'Sabarmati River Information ',
      'gu': '',
      'hi': '',
    },
    'i14fj6eg': {
      'en': 'Water Quality',
      'gu': '',
      'hi': '',
    },
    '9tenxqud': {
      'en': 'Water FLow',
      'gu': '',
      'hi': '',
    },
    'hg40cr3s': {
      'en': 'Minarals',
      'gu': '',
      'hi': '',
    },
    'a5h1epli': {
      'en': 'Water Level',
      'gu': '',
      'hi': '',
    },
    'lg92ibsu': {
      'en': 'Temperature ',
      'gu': '',
      'hi': '',
    },
    'zw4xnmwj': {
      'en': 'Weather Information',
      'gu': '',
      'hi': '',
    },
    'cfa8vgrd': {
      'en': 'Weather ',
      'gu': '',
      'hi': '',
    },
    '5arfr7dk': {
      'en': 'Flood Risk',
      'gu': '',
      'hi': '',
    },
    'pq46lcqh': {
      'en': '12%',
      'gu': '',
      'hi': '',
    },
    'u0xsk1xv': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // Auth1
  {
    'uv4wi7s2': {
      'en': 'Sign In',
      'gu': '',
      'hi': '',
    },
    'yprtkq3o': {
      'en': 'Sign Up',
      'gu': '',
      'hi': '',
    },
    'nl7f7sp3': {
      'en': 'Let\'s get started by filling out the form below.',
      'gu': '',
      'hi': '',
    },
    'hgfukbsn': {
      'en': 'Email',
      'gu': '',
      'hi': '',
    },
    'xp6hco6f': {
      'en': 'Password',
      'gu': '',
      'hi': '',
    },
    '3l5khidi': {
      'en': 'Sign In',
      'gu': '',
      'hi': '',
    },
    'u7kafb0o': {
      'en': 'Forgot Password',
      'gu': '',
      'hi': '',
    },
    'ktm2sgg8': {
      'en': 'Or sign up with',
      'gu': '',
      'hi': '',
    },
    'yv6uxdlh': {
      'en': 'Continue with Google',
      'gu': '',
      'hi': '',
    },
    'dtup9035': {
      'en': 'Continue with Apple',
      'gu': '',
      'hi': '',
    },
    'n89h5qw8': {
      'en': 'Email',
      'gu': '',
      'hi': '',
    },
    'suyzgv60': {
      'en': 'Password',
      'gu': '',
      'hi': '',
    },
    'ip9holjf': {
      'en': 'Confirm Password',
      'gu': '',
      'hi': '',
    },
    'allrkeef': {
      'en': 'Create Account',
      'gu': '',
      'hi': '',
    },
    'hltbh0hc': {
      'en': 'Or sign up with',
      'gu': '',
      'hi': '',
    },
    'jdy20o18': {
      'en': 'Continue with Google',
      'gu': '',
      'hi': '',
    },
    'w1fy4kc3': {
      'en': 'Continue with Apple',
      'gu': '',
      'hi': '',
    },
    '4ybsfs6l': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // profile
  {
    'v1ooe6yy': {
      'en': 'Andrew D.',
      'gu': '',
      'hi': '',
    },
    'ksx9p1u3': {
      'en': 'andrew@domainname.com',
      'gu': '',
      'hi': '',
    },
    'qykwxueb': {
      'en': 'Your Account',
      'gu': '',
      'hi': '',
    },
    'j65f7yws': {
      'en': 'Edit Profile',
      'gu': '',
      'hi': '',
    },
    'oq97oluq': {
      'en': 'Notification Settings',
      'gu': '',
      'hi': '',
    },
    '6gqj800m': {
      'en': 'App Settings',
      'gu': '',
      'hi': '',
    },
    'g1q83gri': {
      'en': 'Support',
      'gu': '',
      'hi': '',
    },
    'q4c5spqh': {
      'en': 'Terms of Service',
      'gu': '',
      'hi': '',
    },
    '1s0y2rmq': {
      'en': 'Log Out',
      'gu': '',
      'hi': '',
    },
    '92rqt4jf': {
      'en': 'Profile',
      'gu': '',
      'hi': '',
    },
  },
  // explore
  {
    'ggxpgxcx': {
      'en': 'Search listings...',
      'gu': '',
      'hi': '',
    },
    'ofxgr9ny': {
      'en': 'Rivers',
      'gu': '',
      'hi': '',
    },
    'hyiv5s8j': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': '',
      'hi': '',
    },
    'r0zjienl': {
      'en': '\$210/night',
      'gu': '',
      'hi': '',
    },
    'hvn2cx10': {
      'en': '32 miles away',
      'gu': '',
      'hi': '',
    },
    'jxbech65': {
      'en': '4.25',
      'gu': '',
      'hi': '',
    },
    '5a5f60m2': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': '',
      'hi': '',
    },
    'kmyfwqk8': {
      'en': '\$210/night',
      'gu': '',
      'hi': '',
    },
    'nltlkcpg': {
      'en': '32 miles away',
      'gu': '',
      'hi': '',
    },
    '4rj5n7jh': {
      'en': '4.25',
      'gu': '',
      'hi': '',
    },
    'k1meix2o': {
      'en': 'Tourism',
      'gu': '',
      'hi': '',
    },
    'qo1sln2e': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': '',
      'hi': '',
    },
    'hy6gcqte': {
      'en': '\$210/night',
      'gu': '',
      'hi': '',
    },
    '3uflvw0g': {
      'en': '32 miles away',
      'gu': '',
      'hi': '',
    },
    '5x01epbn': {
      'en': '4.25',
      'gu': '',
      'hi': '',
    },
    'rd46hg6q': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': '',
      'hi': '',
    },
    'p6bn021d': {
      'en': '\$210/night',
      'gu': '',
      'hi': '',
    },
    'emrpvgkl': {
      'en': '32 miles away',
      'gu': '',
      'hi': '',
    },
    'cbjmn9wv': {
      'en': '4.25',
      'gu': '',
      'hi': '',
    },
    '8xloo0e1': {
      'en': 'Explore',
      'gu': '',
      'hi': '',
    },
  },
  // community
  {
    '48gcyz5b': {
      'en': 'NEWS',
      'gu': '',
      'hi': '',
    },
    '8r1kfzay': {
      'en': 'COMMUNITY',
      'gu': '',
      'hi': '',
    },
    'r3w6ry2c': {
      'en': 'FORUMS',
      'gu': '',
      'hi': '',
    },
    'dtp8usnm': {
      'en': 'GROUPS',
      'gu': '',
      'hi': '',
    },
    'siy24osb': {
      'en': 'Breaking News',
      'gu': '',
      'hi': '',
    },
    'y0mf45ac': {
      'en':
          'This is the desscription of the above news field of text csdgvuisfishciosdhcodhidsvhosvhdjvu.',
      'gu': '',
      'hi': '',
    },
    'u86ub34l': {
      'en': 'Breaking News',
      'gu': '',
      'hi': '',
    },
    '609kjm3c': {
      'en':
          'This is the desscription of the above news field of text csdgvuisfishciosdhcodhidsvhosvhdjvu.',
      'gu': '',
      'hi': '',
    },
    'xxwhcqla': {
      'en': 'Breaking News',
      'gu': '',
      'hi': '',
    },
    'cplsgswq': {
      'en':
          'This is the desscription of the above news field of text csdgvuisfishciosdhcodhidsvhosvhdjvu.',
      'gu': '',
      'hi': '',
    },
    '0gc1jrpb': {
      'en': 'Breaking News',
      'gu': '',
      'hi': '',
    },
    'adftxliy': {
      'en':
          'This is the desscription of the above news field of text csdgvuisfishciosdhcodhidsvhosvhdjvu.',
      'gu': '',
      'hi': '',
    },
    'y0nfwpsx': {
      'en': 'Breaking News',
      'gu': '',
      'hi': '',
    },
    '6h4ma2jr': {
      'en':
          'This is the desscription of the above news field of text csdgvuisfishciosdhcodhidsvhosvhdjvu.',
      'gu': '',
      'hi': '',
    },
    '8wxg75dj': {
      'en': 'Community ',
      'gu': '',
      'hi': '',
    },
  },
  // HomePageCopy
  {
    'pdtbe4i7': {
      'en': 'rivinsight',
      'gu': '',
      'hi': '',
    },
    '1fee4kkj': {
      'en': 'Water Quality',
      'gu': '',
      'hi': '',
    },
    's69a1v4v': {
      'en': 'Tab View 1',
      'gu': '',
      'hi': '',
    },
    '3apn0q9i': {
      'en': 'Example 2',
      'gu': '',
      'hi': '',
    },
    'nin8r7o8': {
      'en': 'Tab View 2',
      'gu': '',
      'hi': '',
    },
    'l4sl3el5': {
      'en': 'Example 3',
      'gu': '',
      'hi': '',
    },
    'rcajrz1a': {
      'en': 'Tab View 3',
      'gu': '',
      'hi': '',
    },
    'p7rds43f': {
      'en': 'Weather Information',
      'gu': '',
      'hi': '',
    },
    'pzdcbupw': {
      'en': 'Weather ',
      'gu': '',
      'hi': '',
    },
    'urn9jc74': {
      'en': 'Flood Risk',
      'gu': '',
      'hi': '',
    },
    'hvr6mswe': {
      'en': '12%',
      'gu': '',
      'hi': '',
    },
    'j4j13bx5': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'y74kna8q': {
      'en': 'Allow Us To Notofy You About Emergency ',
      'gu': '',
      'hi': '',
    },
    'lo0n27vf': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '9od5ploe': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'ngsvvz8c': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '0gwu0s5q': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'mgzm74bm': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'x88f4wlq': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '5odrdpnl': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '2slxlzji': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'vr9ka7qj': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '6mwrvmdh': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'ted6gbxi': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '6wz2m1cg': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '4in9rp2u': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'qouktosr': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'jqgw0qze': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '4pn1339s': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'r86kduwz': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'svytg9fg': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '6yv4nm4u': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    '09qsklbf': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'dnvcc4ye': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'eqx7fbkp': {
      'en': '',
      'gu': '',
      'hi': '',
    },
    'ji642dlj': {
      'en': '',
      'gu': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));

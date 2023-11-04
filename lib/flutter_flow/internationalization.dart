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
    'j2qk0er1': {
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
    '1s0y2rmq': {
      'en': 'Log Out',
      'gu': '',
      'hi': '',
    },
    'v1ooe6yy': {
      'en': 'Rajdeep Barot',
      'gu': '',
      'hi': '',
    },
    'ksx9p1u3': {
      'en': 'snnbarot23@gmail.com',
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
    '71eahuct': {
      'en': 'Water Conservation Tips',
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
      'en': 'News',
      'gu': '',
      'hi': '',
    },
    '8r1kfzay': {
      'en': 'Community',
      'gu': '',
      'hi': '',
    },
    'r3w6ry2c': {
      'en': 'Forum',
      'gu': '',
      'hi': '',
    },
    'dtp8usnm': {
      'en': 'Groups',
      'gu': '',
      'hi': '',
    },
    'lzoqodhs': {
      'en': 'Some Of trending News are here :',
      'gu': '',
      'hi': '',
    },
    '8wxg75dj': {
      'en': 'Community ',
      'gu': '',
      'hi': '',
    },
  },
  // HomePage
  {
    'y207e01w': {
      'en': 'Sabaramati River',
      'gu': '',
      'hi': '',
    },
    's9mhygz1': {
      'en': 'Water Use',
      'gu': '',
      'hi': '',
    },
    'ep1r75y5': {
      'en': 'Agri..Irrigation',
      'gu': '',
      'hi': '',
    },
    'uxrdm04v': {
      'en': 'Water Flow and Availability',
      'gu': '',
      'hi': '',
    },
    'ap4fipkx': {
      'en': 'Water Quality',
      'gu': '',
      'hi': '',
    },
    'qcvfsjdc': {
      'en': 'Soil Moisture Data',
      'gu': '',
      'hi': '',
    },
    '25qzujml': {
      'en': 'Crop Water Requiremen',
      'gu': '',
      'hi': '',
    },
    '9sh3qid9': {
      'en': 'Local Regulations and Water Rights',
      'gu': '',
      'hi': '',
    },
    'bfd243w2': {
      'en': 'Remote Sensing and GIS Data',
      'gu': '',
      'hi': '',
    },
    'z06ld80g': {
      'en': 'All',
      'gu': '',
      'hi': '',
    },
    '2p38ce9f': {
      'en': 'More',
      'gu': '',
      'hi': '',
    },
    'qixcrufc': {
      'en': 'Weather Information',
      'gu': '',
      'hi': '',
    },
    '61p972pa': {
      'en': 'Flood Risk',
      'gu': '',
      'hi': '',
    },
    'zwsdnnqw': {
      'en': '12%',
      'gu': '',
      'hi': '',
    },
    'jndwnoso': {
      'en': 'History',
      'gu': '',
      'hi': '',
    },
    'ok68adwq': {
      'en': 'Gallery',
      'gu': '',
      'hi': '',
    },
    'm9uokg3n': {
      'en': 'Tourism',
      'gu': '',
      'hi': '',
    },
    'vigjusgr': {
      'en': 'More...',
      'gu': '',
      'hi': '',
    },
    'j4j13bx5': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // newsfeed
  {
    'y3fpkpki': {
      'en': 'List Item Title',
      'gu': '',
      'hi': '',
    },
    'nntyxa51': {
      'en': 'Secondary text',
      'gu': '',
      'hi': '',
    },
    'iadwm424': {
      'en': 'List Item Title',
      'gu': '',
      'hi': '',
    },
    'jpbseaog': {
      'en': 'Secondary text',
      'gu': '',
      'hi': '',
    },
    'kgvpryl5': {
      'en': 'List Item Title',
      'gu': '',
      'hi': '',
    },
    'hw7vx06m': {
      'en': 'Secondary text',
      'gu': '',
      'hi': '',
    },
    'lc65fwcl': {
      'en': 'List Item Title',
      'gu': '',
      'hi': '',
    },
    'u1itt6zj': {
      'en': 'Secondary text',
      'gu': '',
      'hi': '',
    },
    '670ymebt': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // detailspage
  {
    'q7pdtke3': {
      'en': 'Water Resource Management',
      'gu': '',
      'hi': '',
    },
    'v8nowfta': {
      'en': 'Biodiversity Consrvation',
      'gu': '',
      'hi': '',
    },
    'y93wtdq9': {
      'en': 'Navigation Safety',
      'gu': '',
      'hi': '',
    },
    '8cwb72lj': {
      'en': 'Infrastructure Planning',
      'gu': '',
      'hi': '',
    },
    'z7itkzz9': {
      'en': 'Agricultural Irrigation Management',
      'gu': '',
      'hi': '',
    },
    '5h73p39q': {
      'en': 'Scientific Research Support',
      'gu': '',
      'hi': '',
    },
    'jjt200dt': {
      'en': 'Land Use Guidance',
      'gu': '',
      'hi': '',
    },
    's2g3dbgh': {
      'en': 'Climate Impact Monitoring',
      'gu': '',
      'hi': '',
    },
    'jv0idkkc': {
      'en': 'Recreation and Tourism',
      'gu': '',
      'hi': '',
    },
  },
  // photogallery
  {
    '4tst1nx1': {
      'en': 'Gallery',
      'gu': '',
      'hi': '',
    },
    '5tj27qgo': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // news
  {
    'x7vfjai2': {
      'en': 'BREAKING NEWS',
      'gu': '',
      'hi': '',
    },
    'tjz0jakw': {
      'en':
          'India\'s New Delhi blanketed by toxic haze, world\'s most polluted city again',
      'gu': '',
      'hi': '',
    },
  },
  // historydetail
  {
    'yopjgo5l': {
      'en': 'History Of River',
      'gu': '',
      'hi': '',
    },
    'igs7rxz3': {
      'en':
          'Rajashekhara\'s Kavya-mimamsa (10th century) calls the river Shvabhravati (IAST: Śvabhravatī). The 11th century text Shringara-manjari-katha calls it \"Sambhramavati\" (literally, \"full of fickleness\"). Jain Acharya Buddhisagarsuri has written many poems about the Sabarmati River. During India\'s independence struggle, Mahatma Gandhi established the Sabarmati Ashram as his home on the banks of this river. In 2018, an assessment by the Central Pollution Control Board (CPCB) named the Kheroj-Vautha stretch of the Sabarmati among the most polluted river stretches in India.',
      'gu': '',
      'hi': '',
    },
    'fg2h1dld': {
      'en':
          'Significance in Hinduism\nIn Rajasthan, it is believed that the Sabarmati River originated due to the penance of ascetic Kashyapa on Mount Abu. His penance had pleased Shiva and in return, Shiva gave ascetic Kashyapa the Ganges River. The Ganges River flowed from Shiva\'s hair onto Mount Abu and became the Sabarmati River. In another legend surrounding the origin of the river, Shiva brought the goddess Ganga to Gujarat and that caused the Sabarmati to come into being.',
      'gu': '',
      'hi': '',
    },
    'jzaevzy0': {
      'en': 'Close',
      'gu': '',
      'hi': '',
    },
  },
  // weatherinfo
  {
    'g3lk0ihn': {
      'en': 'Weather Information',
      'gu': '',
      'hi': '',
    },
    'aq4uckf5': {
      'en': 'Near Sabaramati River',
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

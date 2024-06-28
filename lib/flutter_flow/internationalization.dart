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
  // ProfilePage
  {
    'ljdqcuv1': {
      'en': 'App Language',
      'gu': 'એપ્લિકેશન ભાષા',
      'hi': 'ऐप भाषा',
    },
    'cckzjiln': {
      'en': 'Your Account',
      'gu': 'તમારું ખાતું',
      'hi': 'आपका खाता',
    },
    'w37fk098': {
      'en': 'Edit Profile',
      'gu': 'પ્રોફાઇલ સંપાદિત કરો',
      'hi': 'प्रोफ़ाइल संपादित करें',
    },
    'el8b9k28': {
      'en': 'Water Conservation Tips',
      'gu': 'જળ સંરક્ષણ ટિપ્સ',
      'hi': 'जल संरक्षण युक्तियाँ',
    },
    '9t5ley2z': {
      'en': 'App Settings',
      'gu': 'એપ્લિકેશન સેટિંગ્સ',
      'hi': 'एप्लिकेशन सेटिंग',
    },
    'mog6jzqh': {
      'en': 'Support',
      'gu': 'આધાર',
      'hi': 'सहायता',
    },
    'eapwy0ah': {
      'en': 'Terms of Service',
      'gu': 'સેવાની શરતો',
      'hi': 'सेवा की शर्तें',
    },
    '5llfl7gp': {
      'en': 'Log Out',
      'gu': 'લૉગ આઉટ',
      'hi': 'लॉग आउट',
    },
    '92rqt4jf': {
      'en': 'Profile',
      'gu': 'પ્રોફાઇલ',
      'hi': 'प्रोफ़ाइल',
    },
  },
  // ExplorePage
  {
    'ggxpgxcx': {
      'en': 'Search listings...',
      'gu': 'સૂચિઓ શોધો...',
      'hi': 'सूचियाँ खोजें...',
    },
    '5btnkyx1': {
      'en': 'Tourism',
      'gu': 'પ્રવાસન',
      'hi': 'पर्यटन',
    },
    'hylzhra9': {
      'en': 'Address :',
      'gu': '',
      'hi': '',
    },
    'mkzvjhdh': {
      'en': 'Timing :',
      'gu': '',
      'hi': '',
    },
    'k1meix2o': {
      'en': 'Event',
      'gu': 'પ્રવાસન',
      'hi': 'पर्यटन',
    },
    'qjluefny': {
      'en': 'Address :',
      'gu': '',
      'hi': '',
    },
    'wi53wz9j': {
      'en': 'Dates :',
      'gu': '',
      'hi': '',
    },
    'irhxnv31': {
      'en': 'Timing :',
      'gu': '',
      'hi': '',
    },
    '8xloo0e1': {
      'en': 'Explore',
      'gu': 'અન્વેષણ કરો',
      'hi': 'अन्वेषण करना',
    },
  },
  // HomePage
  {
    'tj4h619v': {
      'en': 'About',
      'gu': 'વિશે',
      'hi': 'के बारे में',
    },
    'qyr7wk20': {
      'en': 'Sabaramati River',
      'gu': 'સાબરમતી નદી',
      'hi': 'साबरमती नदी',
    },
    'efdnesfl': {
      'en': 'History',
      'gu': 'ઇતિહાસ',
      'hi': 'इतिहास',
    },
    't9ofw4bd': {
      'en': 'Gallery',
      'gu': 'ગેલેરી',
      'hi': 'गैलरी',
    },
    'i8bakxo0': {
      'en': 'Weather Information',
      'gu': 'હવામાન માહિતી',
      'hi': 'मौसम की जानकारी',
    },
    '61p972pa': {
      'en': 'Flood Risk',
      'gu': 'પૂરનું જોખમ',
      'hi': 'बाढ़ का खतरा',
    },
    'r0uej90b': {
      'en': 'All Clear!',
      'gu': 'ગ્રીન એલર્ટ છે',
      'hi': 'ग्रीन अलर्ट है',
    },
    '2alv2crl': {
      'en':
          'The river is currently in the Green zone, signifying low flood risk. Enjoy your time by the river with peace of mind, and stay informed for any updates on our app.',
      'gu': 'ઓલસેટ ચિંતા કરવાની જરૂર નથી',
      'hi': 'ऑलसेट चिंता करने की कोई जरूरत नहीं है',
    },
    'yddrjcsh': {
      'en': 'Urgent Warning! ',
      'gu': 'રેડ એલર્ટ છે',
      'hi': 'रेड अलर्ट है',
    },
    '5agebjt9': {
      'en':
          'The river has reached the Red zone, signalling a high flood risk. Prioritize safety, avoid river areas, and follow emergency guidelines. Our app will provide real-time updates to guide you through this situation.',
      'gu': 'જો જરૂરી હોય તો સ્થળાંતર કરવા માટે કૃપા કરીને સાવચેત રહો',
      'hi': 'कृपया सावधान रहें यदि आवश्यक हो तो प्रवास करें',
    },
    '5pr08m59': {
      'en': 'Caution!',
      'gu': 'યલો એલર્ટ છે',
      'hi': 'येलो अलर्ट है',
    },
    'xlfkpoz8': {
      'en':
          'The river has entered the Yellow zone, indicating a moderate flood risk. Stay aware of changing conditions, and receive timely updates through our app to make informed decision',
      'gu': 'પૂરની શક્યતા છે',
      'hi': 'बाढ़ की आशंका है',
    },
    'sdobbi1u': {
      'en': 'Water Management',
      'gu': 'પાણી વ્યવસ્થાપન',
      'hi': 'जल प्रबंधन',
    },
    'kl8k8837': {
      'en': '45%  Irrigation',
      'gu': '45% સિંચાઈ',
      'hi': '45% सिंचाई',
    },
    'xde9oyre': {
      'en': '25% Industrial Use',
      'gu': '25% ઔદ્યોગિક ઉપયોગ',
      'hi': '25% औद्योगिक उपयोग',
    },
    '7cya6iop': {
      'en': '20% Drinking ',
      'gu': '20% પીવું',
      'hi': '20% शराब पीना',
    },
    'ye1su6q5': {
      'en': '10% Others',
      'gu': '10% અન્ય',
      'hi': '10% अन्य',
    },
    'xu6se6kd': {
      'en': 'More Information',
      'gu': 'વધુ મહિતી',
      'hi': 'अधिक जानकारी',
    },
    'j4j13bx5': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // DetailedView
  {
    'q7pdtke3': {
      'en': 'Water Resource Management',
      'gu': 'જળ સંસાધન વ્યવસ્થાપન',
      'hi': 'जल संसाधन प्रबंधन',
    },
    'v8nowfta': {
      'en': 'Biodiversity Consrvation',
      'gu': 'જૈવવિવિધતા સંરક્ષણ',
      'hi': 'जैव विविधता संरक्षण',
    },
    'y93wtdq9': {
      'en': 'Navigation Safety',
      'gu': 'નેવિગેશન સલામતી',
      'hi': 'नेविगेशन सुरक्षा',
    },
    '8cwb72lj': {
      'en': 'Infrastructure Planning',
      'gu': 'ઈન્ફ્રાસ્ટ્રક્ચર પ્લાનિંગ',
      'hi': 'बुनियादी ढाँचा योजना',
    },
    'z7itkzz9': {
      'en': 'Agricultural Irrigation Management',
      'gu': 'કૃષિ સિંચાઈ વ્યવસ્થાપન',
      'hi': 'कृषि सिंचाई प्रबंधन',
    },
    '5h73p39q': {
      'en': 'Scientific Research Support',
      'gu': 'વૈજ્ઞાનિક સંશોધન આધાર',
      'hi': 'वैज्ञानिक अनुसंधान सहायता',
    },
    'jjt200dt': {
      'en': 'Land Use Guidance',
      'gu': 'જમીન ઉપયોગ માર્ગદર્શન',
      'hi': 'भूमि उपयोग मार्गदर्शन',
    },
    's2g3dbgh': {
      'en': 'Climate Impact Monitoring',
      'gu': 'ક્લાઈમેટ ઈમ્પેક્ટ મોનિટરિંગ',
      'hi': 'जलवायु प्रभाव की निगरानी',
    },
    'jv0idkkc': {
      'en': 'Recreation and Tourism',
      'gu': 'મનોરંજન અને પ્રવાસન',
      'hi': 'मनोरंजन एवं पर्यटन',
    },
  },
  // PhotoGallery
  {
    '8iho4kf1': {
      'en': 'Gallery',
      'gu': '',
      'hi': '',
    },
    '5tj27qgo': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // AuthPage
  {
    'a1f7pxqd': {
      'en': 'Sign In',
      'gu': 'સાઇન ઇન કરો',
      'hi': 'दाखिल करना',
    },
    'ico5bypf': {
      'en': 'Email',
      'gu': 'ઈમેલ',
      'hi': 'ईमेल',
    },
    '7nnwutqv': {
      'en': 'Password',
      'gu': 'પાસવર્ડ',
      'hi': 'पासवर्ड',
    },
    'akttre34': {
      'en': 'Sign In',
      'gu': 'સાઇન ઇન કરો',
      'hi': 'दाखिल करना',
    },
    '6i5q0rhl': {
      'en': 'Forgot Password',
      'gu': 'પાસવર્ડ ભૂલી ગયા છો',
      'hi': 'पासवर्ड भूल गए',
    },
    'bo2hiksw': {
      'en': 'Or sign up with',
      'gu': 'અથવા સાથે સાઇન અપ કરો',
      'hi': 'या इसके साथ साइन अप करें',
    },
    'id912ne2': {
      'en': 'Continue with Google',
      'gu': 'Google સાથે ચાલુ રાખો',
      'hi': 'Google के साथ जारी रखें',
    },
    'i98cknw8': {
      'en': 'Sign Up',
      'gu': 'સાઇન અપ કરો',
      'hi': 'साइन अप करें',
    },
    'vzns9vyv': {
      'en': 'Name',
      'gu': 'નામ',
      'hi': 'नाम',
    },
    'malou8tp': {
      'en': 'Email',
      'gu': 'ઈમેલ',
      'hi': 'ईमेल',
    },
    'dpjic4e6': {
      'en': 'Password',
      'gu': 'પાસવર્ડ',
      'hi': 'पासवर्ड',
    },
    'q5fnq4bl': {
      'en': 'Confirm Password',
      'gu': 'પાસવર્ડની પુષ્ટિ કરો',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
    },
    '6hlmsg63': {
      'en': 'Create Account',
      'gu': 'ખાતું બનાવો',
      'hi': 'खाता बनाएं',
    },
    'xdwl8v6z': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // HistoryDetails
  {
    'nchnm27c': {
      'en': 'History Of River',
      'gu': '',
      'hi': '',
    },
    '88hwn89q': {
      'en':
          'Rajashekhara\'s Kavya-mimamsa (10th century) calls the river Shvabhravati (IAST: Śvabhravatī). The 11th century text Shringara-manjari-katha calls it \"Sambhramavati\" (literally, \"full of fickleness\"). Jain Acharya Buddhisagarsuri has written many poems about the Sabarmati River. During India\'s independence struggle, Mahatma Gandhi established the Sabarmati Ashram as his home on the banks of this river. In 2018, an assessment by the Central Pollution Control Board (CPCB) named the Kheroj-Vautha stretch of the Sabarmati among the most polluted river stretches in India.',
      'gu': '',
      'hi': '',
    },
    '78upjfhd': {
      'en':
          'Significance in Hinduism\nIn Rajasthan, it is believed that the Sabarmati River originated due to the penance of ascetic Kashyapa on Mount Abu. His penance had pleased Shiva and in return, Shiva gave ascetic Kashyapa the Ganges River. The Ganges River flowed from Shiva\'s hair onto Mount Abu and became the Sabarmati River. In another legend surrounding the origin of the river, Shiva brought the goddess Ganga to Gujarat and that caused the Sabarmati to come into being.',
      'gu': '',
      'hi': '',
    },
    '1a9hgp7l': {
      'en': 'Back to home page',
      'gu': '',
      'hi': '',
    },
    'csjvw37t': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // MoreInfo
  {
    'ymgrpmok': {
      'en': 'Water Management',
      'gu': '',
      'hi': '',
    },
    'zqzw5umq': {
      'en': '45%  Irrigation',
      'gu': '',
      'hi': '',
    },
    'qyqcrldr': {
      'en': '25% Industrial Use',
      'gu': '',
      'hi': '',
    },
    'zxfb8jpu': {
      'en': '20% Drinking ',
      'gu': '',
      'hi': '',
    },
    'jf40ytzp': {
      'en': '10% Others',
      'gu': '',
      'hi': '',
    },
    'c3mfp6xe': {
      'en': 'Climate Chnage Impact',
      'gu': '',
      'hi': '',
    },
    '8mwxp7su': {
      'en': 'Biodiversity Conservation',
      'gu': '',
      'hi': '',
    },
    'bxvncu0x': {
      'en': 'Navigation & Transportation',
      'gu': '',
      'hi': '',
    },
    't1m7abdp': {
      'en': 'Land Use Guidance',
      'gu': '',
      'hi': '',
    },
    '3eitic8a': {
      'en': 'Scientific Research',
      'gu': '',
      'hi': '',
    },
    'u1pqo02s': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // NewsFeed
  {
    'c20q1otz': {
      'en': 'News',
      'gu': 'સમાચાર',
      'hi': 'समाचार',
    },
  },
  // WaterTips
  {
    'y0x5ytnr': {
      'en': 'Water Conservation Tips',
      'gu': 'જળ સંરક્ષણ ટિપ્સ',
      'hi': 'जल संरक्षण युक्तियाँ',
    },
    '0nqnbzhn': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // PrivacyPolicy
  {
    'tamh4pl6': {
      'en': 'Privacy Policy',
      'gu': '',
      'hi': '',
    },
  },
  // WeatherPage
  {
    'scxljd9n': {
      'en': 'Sabaramati River',
      'gu': '',
      'hi': '',
    },
    'gqld5hfm': {
      'en': 'Temp',
      'gu': '',
      'hi': '',
    },
    'syvo4cnw': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    'a529f87c': {
      'en': 'Feels Like ',
      'gu': '',
      'hi': '',
    },
    'hntms0ay': {
      'en': ' kmph',
      'gu': '',
      'hi': '',
    },
    'bgz2td77': {
      'en': 'Wind',
      'gu': '',
      'hi': '',
    },
    'a05yhq0w': {
      'en': 'hpa',
      'gu': '',
      'hi': '',
    },
    'cdw2ej3l': {
      'en': 'Pressure',
      'gu': '',
      'hi': '',
    },
    'yljo17d8': {
      'en': '120',
      'gu': '',
      'hi': '',
    },
    'jp6rons8': {
      'en': 'aqi/Poor',
      'gu': '',
      'hi': '',
    },
    'r258r82m': {
      'en': 'Air Quality',
      'gu': '',
      'hi': '',
    },
    'w6tu52hy': {
      'en': '%',
      'gu': '',
      'hi': '',
    },
    'vn9zr05e': {
      'en': 'Humidity',
      'gu': '',
      'hi': '',
    },
    '0m8m72io': {
      'en': 'Today\'s Forecast',
      'gu': '',
      'hi': '',
    },
    '0yq3j6ak': {
      'en': 'Low Temperature',
      'gu': '',
      'hi': '',
    },
    'dr1rqtsu': {
      'en': 'High Temperature',
      'gu': '',
      'hi': '',
    },
    'sen00ow3': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    'atgctwfs': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    'hqx5hwds': {
      'en': 'Sunrise & Sunset',
      'gu': '',
      'hi': '',
    },
    'pmoju7kb': {
      'en': 'Sunrise',
      'gu': '',
      'hi': '',
    },
    'b148dvm6': {
      'en': '6:59 AM',
      'gu': '',
      'hi': '',
    },
    '17ur9e59': {
      'en': 'Sunset',
      'gu': '',
      'hi': '',
    },
    'aj3wf5zg': {
      'en': '5:53 PM',
      'gu': '',
      'hi': '',
    },
    '9329g0ml': {
      'en': 'Upcoming Days Forecast',
      'gu': '',
      'hi': '',
    },
    '7zuyso4w': {
      'en': 'Tomorrow\'s Forecast',
      'gu': '',
      'hi': '',
    },
    'wjoaqsc6': {
      'en': '29',
      'gu': '',
      'hi': '',
    },
    '01gfdvo4': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    'okjzz8gb': {
      'en': '/',
      'gu': '',
      'hi': '',
    },
    'un2t1dwu': {
      'en': '26',
      'gu': '',
      'hi': '',
    },
    'rzaqrgk0': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    'zslrx0sb': {
      'en': 'Day 3',
      'gu': '',
      'hi': '',
    },
    '3ydt01lh': {
      'en': '29',
      'gu': '',
      'hi': '',
    },
    'sd734qmf': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    'wckear3v': {
      'en': '/',
      'gu': '',
      'hi': '',
    },
    '565orn10': {
      'en': '29',
      'gu': '',
      'hi': '',
    },
    'k0672gu0': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    'yaxf1qre': {
      'en': 'Day 4',
      'gu': '',
      'hi': '',
    },
    'k8qs7zst': {
      'en': '29',
      'gu': '',
      'hi': '',
    },
    'aan8u0zt': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    '76lh4334': {
      'en': '/',
      'gu': '',
      'hi': '',
    },
    'yw66byhk': {
      'en': '29',
      'gu': '',
      'hi': '',
    },
    'h9kb2oi3': {
      'en': '°C',
      'gu': '',
      'hi': '',
    },
    '4tbswzxt': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // ClimateChangePage
  {
    '2uycku8b': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // BiodiversityPage
  {
    '9pcc4mn6': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // LandUsePage
  {
    '3ax76c7s': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // TnSPage
  {
    '1nhmt01s': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // HistoryCompo
  {
    'yopjgo5l': {
      'en': 'History Of River',
      'gu': 'નદીનો ઇતિહાસ',
      'hi': 'नदी का इतिहास',
    },
    'igs7rxz3': {
      'en':
          'Rajashekhara\'s Kavya-mimamsa (10th century) calls the river Shvabhravati (IAST: Śvabhravatī). The 11th century text Shringara-manjari-katha calls it \"Sambhramavati\" (literally, \"full of fickleness\"). Jain Acharya Buddhisagarsuri has written many poems about the Sabarmati River. During India\'s independence struggle, Mahatma Gandhi established the Sabarmati Ashram as his home on the banks of this river. In 2018, an assessment by the Central Pollution Control Board (CPCB) named the Kheroj-Vautha stretch of the Sabarmati among the most polluted river stretches in India.',
      'gu':
          'રાજશેખરની કાવ્ય-મીમાંસા (10મી સદી) શ્વભરાવતી નદીને (IAST: Śvabhravatī) કહે છે. 11મી સદીના લખાણ શ્રૃંગારા-મંજરી-કથા તેને \"સંભ્રમાવતી\" (શાબ્દિક રીતે, \"ચંચળતાથી ભરેલી\") કહે છે. જૈન આચાર્ય બુદ્ધિસાગરસૂરિએ સાબરમતી નદી વિશે ઘણી કવિતાઓ લખી છે. ભારતની સ્વતંત્રતા સંગ્રામ દરમિયાન, મહાત્મા ગાંધીએ આ નદીના કિનારે સાબરમતી આશ્રમની સ્થાપના કરી હતી. 2018 માં, સેન્ટ્રલ પોલ્યુશન કંટ્રોલ બોર્ડ (CPCB) દ્વારા કરવામાં આવેલા મૂલ્યાંકનમાં સાબરમતીના ખેરોજ-વૌથા વિસ્તારને ભારતમાં સૌથી વધુ પ્રદૂષિત નદીના પટમાં નામ આપવામાં આવ્યું હતું.',
      'hi':
          'राजशेखर की काव्य-मीमांसा (10वीं शताब्दी) में नदी को श्वभ्रावती (IAST: श्वभ्रावती) कहा गया है। 11वीं शताब्दी का पाठ श्रृंगार-मंजरी-कथा इसे \"संभ्रमवती\" (शाब्दिक रूप से, \"चंचलता से भरा\") कहता है। जैन आचार्य बुद्धिसागरसूरि ने साबरमती नदी के बारे में कई कविताएँ लिखी हैं। भारत के स्वतंत्रता संग्राम के दौरान, महात्मा गांधी ने इस नदी के तट पर अपने घर के रूप में साबरमती आश्रम की स्थापना की। 2018 में, केंद्रीय प्रदूषण नियंत्रण बोर्ड (सीपीसीबी) के एक आकलन ने साबरमती के खेरोज-वुथा खंड को भारत में सबसे प्रदूषित नदी खंडों में से एक बताया।',
    },
    'fg2h1dld': {
      'en':
          'Significance in Hinduism\nIn Rajasthan, it is believed that the Sabarmati River originated due to the penance of ascetic Kashyapa on Mount Abu. His penance had pleased Shiva and in return, Shiva gave ascetic Kashyapa the Ganges River. The Ganges River flowed from Shiva\'s hair onto Mount Abu and became the Sabarmati River. In another legend surrounding the origin of the river, Shiva brought the goddess Ganga to Gujarat and that caused the Sabarmati to come into being.',
      'gu':
          'હિન્દુ ધર્મમાં મહત્વ\nરાજસ્થાનમાં, એવું માનવામાં આવે છે કે માઉન્ટ આબુ પર તપસ્વી કશ્યપની તપસ્યાને કારણે સાબરમતી નદીની ઉત્પત્તિ થઈ હતી. તેમની તપસ્યાથી શિવ પ્રસન્ન થયા અને બદલામાં શિવે તપસ્વી કશ્યપને ગંગા નદી આપી. ગંગા નદી શિવના વાળમાંથી માઉન્ટ આબુ પર વહેતી થઈ અને સાબરમતી નદી બની. નદીની ઉત્પત્તિની આસપાસના અન્ય દંતકથામાં, શિવ દેવી ગંગાને ગુજરાતમાં લાવ્યા અને તેના કારણે સાબરમતી અસ્તિત્વમાં આવી.',
      'hi':
          'हिंदू धर्म में महत्व\nराजस्थान में ऐसा माना जाता है कि साबरमती नदी का उद्गम माउंट आबू पर तपस्वी कश्यप की तपस्या से हुआ था। उनकी तपस्या से शिव प्रसन्न हुए और बदले में शिव ने तपस्वी कश्यप को गंगा नदी दी। गंगा नदी शिव की जटाओं से निकलकर माउंट आबू तक पहुंची और साबरमती नदी बन गई। नदी की उत्पत्ति के बारे में एक अन्य किंवदंती के अनुसार, शिव देवी गंगा को गुजरात ले आए और इससे साबरमती अस्तित्व में आई।',
    },
    'jzaevzy0': {
      'en': 'Close',
      'gu': 'બંધ',
      'hi': 'बंद करना',
    },
  },
  // weatherinfo
  {
    'g3lk0ihn': {
      'en': 'Weather Information',
      'gu': 'હવામાન માહિતી',
      'hi': 'मौसम की जानकारी',
    },
    'aq4uckf5': {
      'en': 'Near Sabaramati River',
      'gu': 'સાબરમતી નદી પાસે',
      'hi': 'साबरमती नदी के पास',
    },
  },
  // ProfileEdit
  {
    'o09vbelc': {
      'en': 'Profile',
      'gu': 'પ્રોફાઇલ',
      'hi': 'प्रोफ़ाइल',
    },
    'ym9dag40': {
      'en': 'Name',
      'gu': 'નામ',
      'hi': 'नाम',
    },
    'a0s012q9': {
      'en': 'Save',
      'gu': 'સાચવો',
      'hi': 'बचाना',
    },
  },
  // PrivacyPlicy
  {
    '1lnjwgrv': {
      'en': 'Main Header',
      'gu': '',
      'hi': '',
    },
    '1zmoqkyc': {
      'en':
          'I’ll be working on a few different proposals, let me know when you’ve got time to go over them before the weekend.',
      'gu': '',
      'hi': '',
    },
  },
  // AlertCompo
  {
    'w0opizvc': {
      'en': 'Cancel',
      'gu': '',
      'hi': '',
    },
    '5nhkly50': {
      'en': 'More Details',
      'gu': '',
      'hi': '',
    },
  },
  // weatherinfoCopy
  {
    '7lth9hrt': {
      'en': '147',
      'gu': '',
      'hi': '',
    },
    'wv4ux6ga': {
      'en': ' kmph',
      'gu': '',
      'hi': '',
    },
    'x01t8b9z': {
      'en': 'Wind',
      'gu': '',
      'hi': '',
    },
  },
  // ClimateCompo
  {
    'nqrnic5l': {
      'en': '\"Effect of climate on Sabarmati River\"',
      'gu': '',
      'hi': '',
    },
    'nvbawtaa': {
      'en':
          '\"It originates in the Aravalli Range of the Udaipur District of Rajasthan and meets the Gulf of Khambhat of Arabian Sea after travelling 371 km (231 mi) in a south-westerly direction across Rajasthan and Gujarat\"',
      'gu': '',
      'hi': '',
    },
    'xsuakaiy': {
      'en': 'caption',
      'gu': '',
      'hi': '',
    },
    'lfqmfykk': {
      'en':
          '\"It originates in the Aravalli Range of the Udaipur District of Rajasthan and meets the Gulf of Khambhat of Arabian Sea after travelling 371 km (231 mi) in a south-westerly direction across Rajasthan and Gujarat\"',
      'gu': '',
      'hi': '',
    },
    '8syz9mm6': {
      'en': 'caption',
      'gu': '',
      'hi': '',
    },
  },
  // BiodiversityCompo
  {
    '0mbnaofq': {
      'en': '•\tTrees',
      'gu': '',
      'hi': '',
    },
    'pw2046m2': {
      'en':
          'The Sabarmati River Basin is home to a variety of trees, including teak, sandalwood, and mango. These trees provide important habitat for wildlife and help to regulate the local climate.',
      'gu': '',
      'hi': '',
    },
    'no7rq5ou': {
      'en': 'Sandalwood tree, Sabarmati River Basin',
      'gu': '',
      'hi': '',
    },
  },
  // BiodiversityTips
  {
    'ym29kqpi': {
      'en': '\"Effect of climate on Sabarmati River\"',
      'gu': '',
      'hi': '',
    },
    '630vewyi': {
      'en':
          '\"It originates in the Aravalli Range of the Udaipur District of Rajasthan and meets the Gulf of Khambhat of Arabian Sea after travelling 371 km (231 mi) in a south-westerly direction across Rajasthan and Gujarat\"',
      'gu': '',
      'hi': '',
    },
  },
  // TnSCompo
  {
    'jimzmjmn': {
      'en': '\"Effect of climate on Sabarmati River\"',
      'gu': '',
      'hi': '',
    },
    'mx9ucea6': {
      'en':
          '\"It originates in the Aravalli Range of the Udaipur District of Rajasthan and meets the Gulf of Khambhat of Arabian Sea after travelling 371 km (231 mi) in a south-westerly direction across Rajasthan and Gujarat\"',
      'gu': '',
      'hi': '',
    },
  },
  // LandUseCompeCompo
  {
    'jg41ewr9': {
      'en': '\"Effect of climate on Sabarmati River\"',
      'gu': '',
      'hi': '',
    },
    'ekq1wzbm': {
      'en':
          '\"It originates in the Aravalli Range of the Udaipur District of Rajasthan and meets the Gulf of Khambhat of Arabian Sea after travelling 371 km (231 mi) in a south-westerly direction across Rajasthan and Gujarat\"',
      'gu': '',
      'hi': '',
    },
  },
  // LandUseImpactCompo
  {
    'yx76hqit': {
      'en': '\"Effect of climate on Sabarmati River\"',
      'gu': '',
      'hi': '',
    },
    'egs0f6h8': {
      'en':
          '\"It originates in the Aravalli Range of the Udaipur District of Rajasthan and meets the Gulf of Khambhat of Arabian Sea after travelling 371 km (231 mi) in a south-westerly direction across Rajasthan and Gujarat\"',
      'gu': '',
      'hi': '',
    },
  },
  // LandUseDataCompo
  {
    'rok1x5y2': {
      'en': '\"Effect of climate on Sabarmati River\"',
      'gu': '',
      'hi': '',
    },
    '7n49aihf': {
      'en':
          '\"It originates in the Aravalli Range of the Udaipur District of Rajasthan and meets the Gulf of Khambhat of Arabian Sea after travelling 371 km (231 mi) in a south-westerly direction across Rajasthan and Gujarat\"',
      'gu': '',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'hdxy2rb3': {
      'en': '{FieldName}',
      'gu': 'નામ',
      'hi': 'नाम',
    },
    'y74kna8q': {
      'en': 'Allow Us To Notify You About Emergency ',
      'gu': '',
      'hi': '',
    },
    'uzb8dkm4': {
      'en': 'Allow us to call API',
      'gu': '',
      'hi': '',
    },
    '2w47oma9': {
      'en': 'Allow us to locate youu',
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

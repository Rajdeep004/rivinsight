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
    'zukk0ph6': {
      'en': 'App Language',
      'gu': '',
      'hi': '',
    },
    'r8x1hvh4': {
      'en': 'Your Account',
      'gu': 'તમારું ખાતું',
      'hi': 'आपका खाता',
    },
    'd813h2iy': {
      'en': 'Edit Profile',
      'gu': 'પ્રોફાઇલ સંપાદિત કરો',
      'hi': 'प्रोफ़ाइल संपादित करें',
    },
    '8jcjcomm': {
      'en': 'Water Conservation Tips',
      'gu': 'જળ સંરક્ષણ ટિપ્સ',
      'hi': 'जल संरक्षण युक्तियाँ',
    },
    'k0lmh35f': {
      'en': 'App Settings',
      'gu': 'એપ્લિકેશન સેટિંગ્સ',
      'hi': 'एप्लिकेशन सेटिंग',
    },
    'ubb3dnxo': {
      'en': 'Support',
      'gu': 'આધાર',
      'hi': 'सहायता',
    },
    '8mks96mg': {
      'en': 'Terms of Service',
      'gu': 'સેવાની શરતો',
      'hi': 'सेवा की शर्तें',
    },
    'jseulhdo': {
      'en': 'Privacy Policy ',
      'gu': 'ગોપનીયતા નીતિ',
      'hi': 'गोपनीयता नीति',
    },
    '43tq2u9g': {
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
    'ofxgr9ny': {
      'en': 'Rivers',
      'gu': 'નદીઓ',
      'hi': 'नदियों',
    },
    'hyiv5s8j': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': 'મેઇડસ્ટોન, સાન એન્ટોનિયો, Tx.',
      'hi': 'मेडस्टोन, सैन एंटोनियो, टीएक्स।',
    },
    'r0zjienl': {
      'en': '\$210/night',
      'gu': '\$210/રાત',
      'hi': '\$210/रात',
    },
    'hvn2cx10': {
      'en': '32 miles away',
      'gu': '32 માઇલ દૂર',
      'hi': '32 मील दूर',
    },
    'jxbech65': {
      'en': '4.25',
      'gu': '4.25',
      'hi': '4.25',
    },
    '5a5f60m2': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': 'મેઇડસ્ટોન, સાન એન્ટોનિયો, Tx.',
      'hi': 'मेडस्टोन, सैन एंटोनियो, टीएक्स।',
    },
    'kmyfwqk8': {
      'en': '\$210/night',
      'gu': '\$210/રાત',
      'hi': '\$210/रात',
    },
    'nltlkcpg': {
      'en': '32 miles away',
      'gu': '32 માઇલ દૂર',
      'hi': '32 मील दूर',
    },
    '4rj5n7jh': {
      'en': '4.25',
      'gu': '4.25',
      'hi': '4.25',
    },
    'k1meix2o': {
      'en': 'Tourism',
      'gu': 'પ્રવાસન',
      'hi': 'पर्यटन',
    },
    'qo1sln2e': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': 'મેઇડસ્ટોન, સાન એન્ટોનિયો, Tx.',
      'hi': 'मेडस्टोन, सैन एंटोनियो, टीएक्स।',
    },
    'hy6gcqte': {
      'en': '\$210/night',
      'gu': '\$210/રાત',
      'hi': '\$210/रात',
    },
    '3uflvw0g': {
      'en': '32 miles away',
      'gu': '32 માઇલ દૂર',
      'hi': '32 मील दूर',
    },
    '5x01epbn': {
      'en': '4.25',
      'gu': '4.25',
      'hi': '4.25',
    },
    'rd46hg6q': {
      'en': 'Maidstone, San Antonio, Tx.',
      'gu': 'મેઇડસ્ટોન, સાન એન્ટોનિયો, Tx.',
      'hi': 'मेडस्टोन, सैन एंटोनियो, टीएक्स।',
    },
    'p6bn021d': {
      'en': '\$210/night',
      'gu': '\$210/રાત',
      'hi': '\$210/रात',
    },
    'emrpvgkl': {
      'en': '32 miles away',
      'gu': '32 માઇલ દૂર',
      'hi': '32 मील दूर',
    },
    'cbjmn9wv': {
      'en': '4.25',
      'gu': '4.25',
      'hi': '4.25',
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
    '7ne2bc9f': {
      'en': 'Gallery',
      'gu': 'ગેલેરી',
      'hi': 'गैलरी',
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
    'hdxy2rb3': {
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
    '8qwn5qm2': {
      'en': 'History Of River',
      'gu': 'નદીનો ઇતિહાસ',
      'hi': 'नदी का इतिहास',
    },
    'd9356a8n': {
      'en':
          'Rajashekhara\'s Kavya-mimamsa (10th century) calls the river Shvabhravati (IAST: Śvabhravatī). The 11th century text Shringara-manjari-katha calls it \"Sambhramavati\" (literally, \"full of fickleness\"). Jain Acharya Buddhisagarsuri has written many poems about the Sabarmati River. During India\'s independence struggle, Mahatma Gandhi established the Sabarmati Ashram as his home on the banks of this river. In 2018, an assessment by the Central Pollution Control Board (CPCB) named the Kheroj-Vautha stretch of the Sabarmati among the most polluted river stretches in India.',
      'gu':
          'રાજશેખરની કાવ્ય-મીમાંસા (10મી સદી) શ્વભરાવતી નદીને (IAST: Śvabhravatī) કહે છે. 11મી સદીના લખાણ શ્રૃંગારા-મંજરી-કથા તેને \"સંભ્રમાવતી\" (શાબ્દિક રીતે, \"ચંચળતાથી ભરેલી\") કહે છે. જૈન આચાર્ય બુદ્ધિસાગરસૂરિએ સાબરમતી નદી વિશે ઘણી કવિતાઓ લખી છે. ભારતની સ્વતંત્રતા સંગ્રામ દરમિયાન, મહાત્મા ગાંધીએ આ નદીના કિનારે સાબરમતી આશ્રમની સ્થાપના કરી હતી. 2018 માં, સેન્ટ્રલ પોલ્યુશન કંટ્રોલ બોર્ડ (CPCB) દ્વારા કરવામાં આવેલા મૂલ્યાંકનમાં સાબરમતીના ખેરોજ-વૌથા વિસ્તારને ભારતમાં સૌથી વધુ પ્રદૂષિત નદીના પટમાં નામ આપવામાં આવ્યું હતું.',
      'hi':
          'राजशेखर की काव्य-मीमांसा (10वीं शताब्दी) में नदी को श्वभ्रावती (IAST: श्वभ्रावती) कहा गया है। 11वीं शताब्दी का पाठ श्रृंगार-मंजरी-कथा इसे \"संभ्रमवती\" (शाब्दिक रूप से, \"चंचलता से भरा\") कहता है। जैन आचार्य बुद्धिसागरसूरि ने साबरमती नदी के बारे में कई कविताएँ लिखी हैं। भारत के स्वतंत्रता संग्राम के दौरान, महात्मा गांधी ने इस नदी के तट पर अपने घर के रूप में साबरमती आश्रम की स्थापना की। 2018 में, केंद्रीय प्रदूषण नियंत्रण बोर्ड (सीपीसीबी) के एक आकलन ने साबरमती के खेरोज-वुथा खंड को भारत में सबसे प्रदूषित नदी खंडों में से एक बताया।',
    },
    '1vxyoo35': {
      'en':
          'Significance in Hinduism\nIn Rajasthan, it is believed that the Sabarmati River originated due to the penance of ascetic Kashyapa on Mount Abu. His penance had pleased Shiva and in return, Shiva gave ascetic Kashyapa the Ganges River. The Ganges River flowed from Shiva\'s hair onto Mount Abu and became the Sabarmati River. In another legend surrounding the origin of the river, Shiva brought the goddess Ganga to Gujarat and that caused the Sabarmati to come into being.',
      'gu':
          'હિંદુ ધર્મમાં મહત્વ\nરાજસ્થાનમાં, એવું માનવામાં આવે છે કે માઉન્ટ આબુ પર તપસ્વી કશ્યપની તપસ્યાને કારણે સાબરમતી નદીની ઉત્પત્તિ થઈ હતી. તેમની તપસ્યાથી શિવ પ્રસન્ન થયા અને બદલામાં શિવે તપસ્વી કશ્યપને ગંગા નદી આપી. ગંગા નદી શિવના વાળમાંથી માઉન્ટ આબુ પર વહેતી થઈ અને સાબરમતી નદી બની. નદીની ઉત્પત્તિની આસપાસના અન્ય દંતકથામાં, શિવ દેવી ગંગાને ગુજરાતમાં લાવ્યા અને તેના કારણે સાબરમતી અસ્તિત્વમાં આવી.',
      'hi':
          'हिंदू धर्म में महत्व\nराजस्थान में यह माना जाता है कि साबरमती नदी का उद्गम माउंट आबू पर तपस्वी कश्यप की तपस्या से हुआ था। उनकी तपस्या से शिव प्रसन्न हुए और बदले में शिव ने तपस्वी कश्यप को गंगा नदी दी। गंगा नदी शिव की जटाओं से निकलकर माउंट आबू तक पहुंची और साबरमती नदी बन गई। नदी की उत्पत्ति के बारे में एक अन्य किंवदंती के अनुसार, शिव देवी गंगा को गुजरात ले आए और इससे साबरमती अस्तित्व में आई।',
    },
    '8mk8lv06': {
      'en': 'Back to home page',
      'gu': 'હોમ પેજ પર પાછા ફરો',
      'hi': 'मुखपृष्ठ पर वापस',
    },
    'csjvw37t': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
    },
  },
  // MoreInfo
  {
    'a4rz768d': {
      'en': 'Water Management',
      'gu': 'પાણી વ્યવસ્થાપન',
      'hi': 'जल प्रबंधन',
    },
    'w5o9eqnz': {
      'en': '45%  Irrigation',
      'gu': '45% સિંચાઈ',
      'hi': '45% सिंचाई',
    },
    'n2eler13': {
      'en': '25% Industrial Use',
      'gu': '25% ઔદ્યોગિક ઉપયોગ',
      'hi': '25% औद्योगिक उपयोग',
    },
    'v18n52q9': {
      'en': '20% Drinking ',
      'gu': '20% પીવું',
      'hi': '20% शराब पीना',
    },
    'apxhgae9': {
      'en': '10% Others',
      'gu': '10% અન્ય',
      'hi': '10% अन्य',
    },
    '74nwg18g': {
      'en': 'Climate Chnage Impact',
      'gu': 'ક્લાઈમેટ ચેન્જ ઈમ્પેક્ટ',
      'hi': 'जलवायु परिवर्तन का प्रभाव',
    },
    'v4kp6fbj': {
      'en': 'Biodiversity Conservation',
      'gu': 'જૈવવિવિધતા સંરક્ષણ',
      'hi': 'जैव विविधता संरक्षण',
    },
    'wfq9yc6q': {
      'en': 'Navigation & Transportation',
      'gu': 'નેવિગેશન અને ટ્રાન્સપોર્ટેશન',
      'hi': 'नेविगेशन एवं परिवहन',
    },
    '6a0ls7pb': {
      'en': 'Land Use Guidance',
      'gu': 'જમીન ઉપયોગ માર્ગદર્શન',
      'hi': 'भूमि उपयोग मार्गदर्शन',
    },
    'jyhlof26': {
      'en': 'Scientific Research',
      'gu': 'વૈજ્ઞાનિક સંશોધન',
      'hi': 'वैज्ञानिक अनुसंधान',
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
  // AlertPage
  {
    '98gvuz3d': {
      'en': 'Page Title',
      'gu': 'પૃષ્ઠ શીર્ષક',
      'hi': 'पृष्ठ का शीर्षक',
    },
    'dsbto680': {
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
    '4tbswzxt': {
      'en': 'Home',
      'gu': '',
      'hi': '',
    },
  },
  // HISTORY
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
          'હિંદુ ધર્મમાં મહત્વ\nરાજસ્થાનમાં, એવું માનવામાં આવે છે કે માઉન્ટ આબુ પર તપસ્વી કશ્યપની તપસ્યાને કારણે સાબરમતી નદીની ઉત્પત્તિ થઈ હતી. તેમની તપસ્યાથી શિવ પ્રસન્ન થયા અને બદલામાં શિવે તપસ્વી કશ્યપને ગંગા નદી આપી. ગંગા નદી શિવના વાળમાંથી માઉન્ટ આબુ પર વહેતી થઈ અને સાબરમતી નદી બની. નદીની ઉત્પત્તિની આસપાસના અન્ય દંતકથામાં, શિવ દેવી ગંગાને ગુજરાતમાં લાવ્યા અને તેના કારણે સાબરમતી અસ્તિત્વમાં આવી.',
      'hi':
          'हिंदू धर्म में महत्व\nराजस्थान में यह माना जाता है कि साबरमती नदी का उद्गम माउंट आबू पर तपस्वी कश्यप की तपस्या से हुआ था। उनकी तपस्या से शिव प्रसन्न हुए और बदले में शिव ने तपस्वी कश्यप को गंगा नदी दी। गंगा नदी शिव की जटाओं से निकलकर माउंट आबू तक पहुंची और साबरमती नदी बन गई। नदी की उत्पत्ति के बारे में एक अन्य किंवदंती के अनुसार, शिव देवी गंगा को गुजरात ले आए और इससे साबरमती अस्तित्व में आई।',
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
  // Biodiversity
  {
    '6e8s8ub6': {
      'en': 'Biodiversity Conservation',
      'gu': 'જૈવવિવિધતા સંરક્ષણ',
      'hi': 'जैव विविधता संरक्षण',
    },
    'sbi6aous': {
      'en': 'Here we add all info about Bio Con',
      'gu': 'અહીં અમે Bio Con વિશે તમામ માહિતી ઉમેરીએ છીએ',
      'hi': 'यहां हम बायो कॉन के बारे में सारी जानकारी जोड़ते हैं',
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
  // PrivacyPOlicy
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
  // Miscellaneous
  {
    'y74kna8q': {
      'en': 'Allow Us To Notify You About Emergency ',
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

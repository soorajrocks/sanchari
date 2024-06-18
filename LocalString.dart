import 'package:get/get.dart';
@override
class LocalString extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
  'en_US':{//for English language
    'title':'Search for Buses',
    'from':'From',
    'to':'To',
    'search':'Search Bus',
    'menu':'Task Menu',
    'home':'Home',
    'language':'Language',
    'history':'History',
    'select-lang':'Select the language'





  },
  'hi_IN':{//for hindi language
    'title':'बसें खोजें',
    'from':'कहां से',
    'to':'गंतव्य',
    'search':'बस खोजें',
    'menu':'कार्य मेनू',
    'home':'होमपेज',
    'language':'भाषा',
    'history':'हिस्ट्री',
    'select-lang':'भाषा चुनें'

  },
    'ml_IN':{//for malayalam language
      'title':'ബസുകൾക്കായി തിരയുക',
      'from':'എവിടെനിന്ന്',
      'to':'എവിടേക്ക്',
      'search':'ബസ് തിരയുക',
      'menu':'ടാസ്ക് മെനു',
      'home':'ഹോംപേജ്',
      'language':'ഭാഷ',
      'history':'ഹിസ്റ്ററി',
      'select-lang':'ഭാഷ തിരഞ്ഞെടുക്കുക'

    }
  };

}
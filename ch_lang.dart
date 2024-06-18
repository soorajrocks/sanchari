import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp( const ch_lang());
}

class ch_lang extends StatelessWidget {
  const ch_lang({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('select-lang'.tr),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  var locale=Locale('en','US');
                  Get.updateLocale(locale);
                  Navigator.pop(context);

                },
                child: const Text('English_US'),
              ),
              TextButton(
                onPressed: () {
                  var locale=Locale('hi','IN');
                  Get.updateLocale(locale);
                  Navigator.pop(context);
                  // Action for Hindi button

                },
                child: const Text('Hindi'),
              ),
              TextButton(
                onPressed: () {
                  var locale=Locale('ml','IN');
                  Get.updateLocale(locale);
                  Navigator.pop(context);
                  // Action for Malayalam button

                },
                child: const Text('Malayalam'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
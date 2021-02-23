import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void ss_test(){
  group('E-commerce:', () {
    final btnSplash = find.byValueKey('btnSplash');
    FlutterDriver driver;

      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });

    group('Splash screen-',(){
          test('Continue Button',() async{
            await Future.delayed(Duration(milliseconds: 1000));
            await driver.tap(btnSplash);
          });
        });//Splash screen
  });
}
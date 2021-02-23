import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void sin()
{

   final btnSignUp = find.byValueKey('btnSignUp');
   int delayDuration = 3;
  group('E-commerce:', () {
  
    FlutterDriver driver;

      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });
      group('Sign in screen',(){
      test('Sign up button',()async{
        await Future.delayed(Duration(milliseconds: delayDuration));
        await driver.tap(btnSignUp);
        await Future.delayed(Duration(seconds: delayDuration));
      });
    });//Sign in screen 
  });
}
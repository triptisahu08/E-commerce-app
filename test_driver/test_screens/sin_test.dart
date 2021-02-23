import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void sin()
{

   final btnSignUp = find.byValueKey('btnSignUp');
  group('E-commerce:', () {
    //final btnSplash = find.byValueKey('btnSplash');
    FlutterDriver driver;

      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });
      group('Sign in screen-',(){
      test('Sign up button',()async{
        await Future.delayed(Duration(milliseconds: 1000));
        await driver.tap(btnSignUp);
      });
    });//Sign in screen 
  });
}
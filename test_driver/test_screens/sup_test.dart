import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void supTest(){
    
    group('E-commerce', (){
      final SerializableFinder txtSignUp = find.byValueKey('txtSignUp');
      final SerializableFinder emailField = find.byValueKey('inpRegEmail');
      final SerializableFinder passField = find.byValueKey('inpRegPass');
      final SerializableFinder confirmpassField = find.byValueKey('inpRegPass2');
      final SerializableFinder btnRegister = find.byValueKey('btnRegister');
      final SerializableFinder txtCompleteProfile = find.byValueKey('txtCompleteP');
      final SerializableFinder error = find.byValueKey('errorSignUp');
      
      String testEmail = 'tsahu08@gmail.com';
      String testInvalidEmail = 'test@mail';
      String testPass = '12345678';
      String testDiffPass = '00000000';
      String txtSignUpSUP_01_01 = "Register Account";

      int delayDuration = 3; 
      FlutterDriver driver;

      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });

    group('SUP_01', ()
    {
    test('SUP_01_01', ()async{
    //verifying the SignUp screen
    await Future.delayed(Duration(seconds: delayDuration));
    await driver.getText(txtSignUp);
    expect(await driver.getText(txtSignUp),txtSignUpSUP_01_01);
    await Future.delayed(Duration(seconds:delayDuration ));
    });
    });

    group('SUP_02', (){
      test('SUP_02_01', ()async { 
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(emailField);
        await driver.enterText(testEmail);
        await Future.delayed(Duration(seconds: delayDuration));
        
        await driver.tap(passField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        expect(await driver.getText(txtCompleteProfile), 'Complete Profile');
        await Future.delayed(Duration(seconds: delayDuration));
      });
    test('SUP_02_02', ()async { 
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(find.pageBack());
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText(testEmail);
        await Future.delayed(Duration(seconds: delayDuration));
        
        await driver.tap(passField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testDiffPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);

        expect(await driver.getText(error), "Passwords don't match");
        await Future.delayed(Duration(seconds: delayDuration));
      });

      test('SUP_02_03', ()async { 
        await Future.delayed(Duration(seconds: delayDuration));
        //await driver.tap(find.pageBack());
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText(testEmail);
        await Future.delayed(Duration(seconds: delayDuration));
        
        await driver.tap(passField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testDiffPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);

        expect(await driver.getText(error), "Passwords don't match");
        await Future.delayed(Duration(seconds: delayDuration));
      });


    });
    });
}

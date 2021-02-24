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
     // final SerializableFinder error = find.byValueKey('errorSignUp');
      
      String testEmail = 'tsahu08@gmail.com';
      String testInvalidEmail = 'test@mail';
      String testPass = '12345678';
      String testDiffPass = '00000000';
      String testShortPass = '123456';
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
      },timeout: Timeout.none);

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

        expect(await driver.getText(find.byValueKey('item_0_text')), "Passwords don't match");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);

      test('SUP_02_03', ()async { 
        await Future.delayed(Duration(seconds: delayDuration));
        //await driver.tap(find.pageBack());
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText(testInvalidEmail);
        await Future.delayed(Duration(seconds: delayDuration));
        
        await driver.tap(passField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        expect(await driver.getText(find.byValueKey('item_0_text')), "Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter Valid Email");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);
        
      test('SUP_02_04', ()async { 
        await Future.delayed(Duration(seconds: delayDuration));
        //await driver.tap(find.pageBack());
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText(testEmail);
        await Future.delayed(Duration(seconds: delayDuration));
        
        await driver.tap(passField);
        await driver.enterText(testShortPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testShortPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
       // await driver.waitFor(error);
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')),"Password is too short");

        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);

      test('SUP_02_05', ()async { 
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
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(txtSignUp), txtSignUpSUP_01_01);
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);

      test('SUP_02_06', ()async { 
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));
        
        await driver.tap(passField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')), "Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')), "Password is too short");
        expect(await driver.getText(find.byValueKey('item_3_text')), "Please Enter your email");
        expect(await driver.getText(find.byValueKey('item_4_text')), "Please Enter your password");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);

      test('SUP_02_07', ()async {
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText(testEmail);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(passField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')), "Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')), "Password is too short");
        expect(await driver.getText(find.byValueKey('item_3_text')), "Please Enter your password");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);

      test('SUP_02_08', ()async {
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText(testEmail);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(passField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')), "Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')), "Password is too short");
        expect(await driver.getText(find.byValueKey('item_3_text')), "Please Enter your password");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);


      test('SUP_02_09', ()async {
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(passField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')), "Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')), "Password is too short");
        expect(await driver.getText(find.byValueKey('item_3_text')), "Please Enter your email");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);



      test('SUP_02_10', ()async {
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText(testEmail);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(passField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')), "Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')), "Password is too short");
        expect(await driver.getText(find.byValueKey('item_3_text')), "Please Enter your password");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);



      test('SUP_02_11', ()async {
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(passField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')), "Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')), "Password is too short");
        expect(await driver.getText(find.byValueKey('item_3_text')), "Please Enter your email");
        expect(await driver.getText(find.byValueKey('item_4_text')), "Please Enter your password");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);



      test('SUP_02_12', ()async {
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(emailField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(passField);
        await driver.enterText('');
        await Future.delayed(Duration(seconds: delayDuration));

        await driver.tap(confirmpassField);
        await driver.enterText(testPass);
        await Future.delayed(Duration(seconds: delayDuration));
        await driver.tap(btnRegister);
        await Future.delayed(Duration(seconds: delayDuration));
        expect(await driver.getText(find.byValueKey('item_0_text')),"Passwords don't match");
        expect(await driver.getText(find.byValueKey('item_1_text')), "Please Enter Valid Email");
        expect(await driver.getText(find.byValueKey('item_2_text')), "Password is too short");
        expect(await driver.getText(find.byValueKey('item_3_text')), "Please Enter your email");
        expect(await driver.getText(find.byValueKey('item_4_text')), "Please Enter your password");
        await Future.delayed(Duration(seconds: delayDuration));
      },timeout: Timeout.none);









    });
    });
}

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('E-commerce:', () {
    final btnSplash = find.byValueKey('btnSplash');
    final btnSignUp = find.byValueKey('btnSignUp');
    final inpRegEmail = find.byValueKey('inpRegEmail');
    final inpRegPass = find.byValueKey('inpRegPass');
    final inpRegPass2 = find.byValueKey('inpRegPass2');
    final btnRegister = find.byValueKey('btnRegister');
    final inpFName = find.byValueKey('inpFName');
    final inpLName = find.byValueKey('inpLName');
    final inpPNumber = find.byValueKey('inpPNumber');
    final inpAddress = find.byValueKey('inpAddress');
    final btnProfile = find.byValueKey('btnProfile');
    final btnOTP = find.byValueKey('btnOTP');
    final btnForgot = find.byValueKey('btnForgot');
    final inpFEmail = find.byValueKey('inpFEmail');
    final btnForgotContd = find.byValueKey('btnForgotContd');
    final inpEmail = find.byValueKey('inpEmail');
    final inpPass = find.byValueKey('inpPass');
    final btnRemember = find.byValueKey('btnRemember');
    final btnSignIn = find.byValueKey('btnSignIn');
    final btnToHome = find.byValueKey('btnToHome');
    final btnCart = find.byValueKey('btnCart');
    final btnCheckOut = find.byValueKey('btnCheckOut');
    final btnProfileView = find.byValueKey('btnProfileView');
    final scrollSOffer = find.byValueKey('scrollSOffer');
    //final cardFashion1 = find.byValueKey('cardFashion1');
    final cardFashion2 = find.byValueKey('cardFashion2');
    final scrollV1 = find.byValueKey('scrollV1');
    final scrollV2 = find.byValueKey('scrollV2');
    final btnProduct = find.byValueKey('btnProduct');
    final btnDetails = find.byValueKey('btnDetails');
    final scrollDetails = find.byValueKey('scrollDetails');

    //Reused Variable
    final int timeDelay = 600;//In milliseconds
    final String userEmail = 'testuser@gmail.com';
    final String userPassword = 'testUser123';

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
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnSplash);
      });
    });//Splash screen

    group('Sign in screen-',(){
      test('Sign up button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnSignUp);
      });
    });//Sign in screen

    group('User registration-',(){
      test('Input user email',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpRegEmail);
        await driver.enterText(userEmail);
      });
      test('Input user password',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpRegPass);
        await driver.enterText(userPassword);
      });
      test('Input user password',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpRegPass2);
        await driver.enterText(userPassword);
      });
      test('Continue button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnRegister);
      });
    });//User registration

    group('Complete profile-',(){
      test('Input first name',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpFName);
        await driver.enterText('Tom');
      });
      test('Input last name',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpLName);
        await driver.enterText('Jerry');
      });
      test('Input phone number',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpPNumber);
        await driver.enterText('9876543210');
      });
      test('Input address',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpAddress);
        await driver.enterText('India');
      });
      test('Continue button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnProfile);
      });
    });//Complete profile

    group('OTP verification-',(){
      test('Continue button',()async{
        //await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnOTP);
      });
    });//OTP verification

    group('Sign in screen-',(){
      test('Forgot button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnForgot);
      });
    });//Sign in screen

    group('Forgot password screen-',(){
      test('Input email',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpFEmail);
        await driver.enterText(userEmail);
      });
      test('Continue button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnForgotContd);
      });
    });//Forgot password screen

    group('Sign in screen-',(){
      test('Input email',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpEmail);
        await driver.enterText(userEmail);
      });
      test('Input password',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(inpPass);
        await driver.enterText(userPassword);
      });
      test('Check remember-me',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnRemember);
      });
      test('Uncheck remember-me',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnRemember);
      });
      test('Sign in button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnSignIn);
      });
    });//Sign in screen

    group('Login success-',(){
      test('Continue button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnToHome);
      });
    });//Login success

    group('Home screen-',(){
      test('Cart button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnCart);
      });
      test('Cart button checkout',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnCheckOut);
      });
      test('Vertical scroll down',()async{
        await Future.delayed(Duration(milliseconds: 1000));
        await driver.scrollUntilVisible(scrollV1, scrollV2, dyScroll: -300.0,);
      });
      test('Horizontal scroll left',()async{
        await Future.delayed(Duration(milliseconds: 1000));
        await driver.scrollUntilVisible(scrollSOffer, cardFashion2, dxScroll: -300.0,);
      });
      test('Product details',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnProduct);
      });
      test('Product details- Vertical scroll down',()async{
        await Future.delayed(Duration(milliseconds: 2000));
        await driver.scrollUntilVisible(scrollDetails, btnDetails, dyScroll: -300.0,);
      });
      test('Product details- Add to cart button',()async{
        await Future.delayed(Duration(milliseconds: 2000));
        await driver.tap(btnDetails);
      });
      test('Profile button',()async{
        await Future.delayed(Duration(milliseconds: timeDelay));
        await driver.tap(btnProfileView);
        await Future.delayed(Duration(milliseconds: 2000));
      });
    });//Home screen

  },timeout: Timeout(Duration(minutes: 5)));//E-commerce
}
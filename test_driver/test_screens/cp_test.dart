import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


void cpTest()
{
  group('E-commerce', (){
   final SerializableFinder txtCP = find.byValueKey('txtCompleteP');
   final SerializableFinder inpFName = find.byValueKey('inpFName');
   final SerializableFinder inpLName = find.byValueKey('inpLName');
   final SerializableFinder inpAddress = find.byValueKey('inpAddress');
   final SerializableFinder inpPNumber = find.byValueKey('inpPNumber');
   final SerializableFinder btnCP = find.byValueKey('btnCProfile');

   String fName = 'Ian';
   String lName = 'Somerhalder';
   String address = 'Random';
   String pNumber = '7485968596';
   String txtCP_01_01 = 'Complete Profile';

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

  group('CP_01', (){

    test('CP_01_01',()async {
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.getText(txtCP);
      expect(await driver.getText(txtCP),txtCP_01_01);
      await Future.delayed(Duration(seconds:delayDuration ));
    },timeout: Timeout.none);
  });

  group('CP_02', (){
    test('CP_02_01', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText(fName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText(pNumber);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.text('Welcome Back')), 'Welcome Back');
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);


    test('CP_02_02', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText(fName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText(pNumber);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));


      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Registration Success" );
      expect(await driver.getText(find.byValueKey('item_1_text')), 'Please Enter your address');
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_03', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
     // await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText(fName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),'Please Enter your phone number');
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);


    test('CP_02_04', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText(fName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText(pNumber);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Registration Success" );
      expect(await driver.getText(find.text('Welcome Back')),'Welcome Back');
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_05', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText(pNumber);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your name");
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_06', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText(fName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your phone number");
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your address");

      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    //empty last name and phone number

    test('CP_02_07', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText(fName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your phone number");
      //expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your address");

      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_08', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText(pNumber);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),'Please Enter your name');
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your address");

      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);


    test('CP_02_09', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),'Please Enter your name');
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your phone number");

      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_10', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText(pNumber);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your name");
      //expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your address");

      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_11', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText(fName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your phone number");
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your address");

      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_12', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
     // await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText(lName);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your name");
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your phone number");
      expect(await driver.getText(find.byValueKey('item_2_text')),"Please Enter your address");

      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_13', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
     // await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText(pNumber);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your name");
     // expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your phone number");
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your address");
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

    test('CP_02_14', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      //await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText(address);
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your name");
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your phone number");
      //expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your address");
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);


    test('CP_02_15', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
     // await driver.tap(find.pageBack());
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.tap(inpFName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpLName);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpPNumber);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(inpAddress);
      await driver.enterText('');
      await Future.delayed(Duration(seconds: delayDuration));

      await driver.tap(btnCP);
      // await Future.delayed(Duration(seconds: delayDuration));
      expect(await driver.getText(find.byValueKey('item_0_text')),"Please Enter your name");
      expect(await driver.getText(find.byValueKey('item_1_text')),"Please Enter your phone number");
      expect(await driver.getText(find.byValueKey('item_2_text')),"Please Enter your address");
      await Future.delayed(Duration(seconds: delayDuration));
    },timeout: Timeout.none);

  });
  });
}
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void ssTest(){
  group('E-commerce:', () {
    final SerializableFinder  btnSplash = find.byValueKey('btnSplash');
    final SerializableFinder txtSplash = find.byValueKey('txtSplash');
    final SerializableFinder subTxtSplash = find.byValueKey('subTxtSplash');
    final SerializableFinder pageVSplash = find.byValueKey('pageViewSplash');
    int delayDuration = 3; 
    String commonText = "Shoppers Store";
    String subTextSS_01_02 = "Welcome to Shoppers Store, Let’s shop!";
    String subTextSS_01_03 =  "We help people connect with store \naround United State of America";
    String subTextSS_01_04 =  "We show the easy way to shop. \nJust stay at home with us";

    FlutterDriver driver;

      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });
     

    group('SS_01', (){
      test('SS_01_01', ()async{
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.getText(txtSplash);
      expect(await driver.getText(txtSplash),commonText);      
      });

      test('SS_01_02', ()async {
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.waitFor(pageVSplash);
      //await driver.scroll(pageVSplash, -400, 0,Duration(seconds: delayDuration));
      await driver.tap(subTxtSplash);
      await driver.getText(find.text(subTextSS_01_02));
      expect(await driver.getText(subTxtSplash),subTextSS_01_02);
      },timeout: Timeout.none);

      test('SS_01_03', ()async {
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.waitFor(pageVSplash);
      await driver.scroll(pageVSplash,-400,0,Duration(seconds:delayDuration));
      await driver.tap(subTxtSplash);
      await driver.getText(find.text(subTextSS_01_03));
      expect(await driver.getText(subTxtSplash),subTextSS_01_03);
      },timeout: Timeout.none);
     
      test('SS_01_04', ()async {
      await Future.delayed(Duration(seconds: delayDuration));
      await driver.waitFor(pageVSplash);
      await driver.scroll(pageVSplash,-400,0,Duration(seconds:delayDuration));
      await driver.tap(subTxtSplash);
      await driver.getText(find.text(subTextSS_01_04));
      expect(await driver.getText(subTxtSplash),subTextSS_01_04);
      },timeout: Timeout.none);
    });

    group('SS_02', (){
      test('SS_02_01',() async{
        await driver.scroll(pageVSplash, 400, 0, Duration(milliseconds: 500));
        await driver.getText(find.text(subTextSS_01_03));
        await driver.scroll(pageVSplash, 400, 0, Duration(milliseconds: 500));
        await driver.getText(find.text(subTextSS_01_02));
      });
    });
    group('SS_03',(){
          test('SS_03_01',() async{
            await Future.delayed(Duration(milliseconds: delayDuration));
            await driver.tap(btnSplash);
            await Future.delayed(Duration(seconds:delayDuration));
          });
        });//Splash screen
  });
}
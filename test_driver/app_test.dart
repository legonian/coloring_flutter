import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Coloring App', () {
    final gestureDetector = find.byValueKey('GestureDetector');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test('record the performance and save to disk', () async {
      final timeline = await driver.traceAction(() async {
        await driver.tap(gestureDetector);
        await driver.tap(gestureDetector);
      });

      final summary = new TimelineSummary.summarize(timeline);
      await summary.writeSummaryToFile('coloring_summary', pretty: true);
      await summary.writeTimelineToFile('coloring_timeline', pretty: true);
    });

    test('check flutter driver health again', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
  });
}

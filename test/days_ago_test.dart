import 'package:flutter_test/flutter_test.dart';
import 'package:days_ago/src/days_ago.dart';


void main() {
  test('getPlatformVersion', () async {
    DaysAgo daysAgoPlugin = DaysAgo(DateTime.now());
    expect(daysAgoPlugin.getString, 'Just now');
  });
}

import 'package:ct_online_report/settings/application/settings_event.dart';
import 'package:flutter_test/flutter_test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of load events', () {
    expect(LoadSettingsEvent(), LoadSettingsEvent());
  });

  test('the equality of report url change events', () {
    expect(
      ReportUrlSettingsChangedEvent('a'),
      ReportUrlSettingsChangedEvent('a'),
    );

    expect(
      ReportUrlSettingsChangedEvent('a'),
      isNot(ReportUrlSettingsChangedEvent('b')),
    );
  });

  test('the equality of report id change events', () {
    expect(
      ReportIdSettingsChangedEvent('a'),
      ReportIdSettingsChangedEvent('a'),
    );
    expect(
      ReportIdSettingsChangedEvent('a'),
      isNot(ReportIdSettingsChangedEvent('b')),
    );
  });
}

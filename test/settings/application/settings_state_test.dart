import 'package:ctonlinereport/settings/application/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of settings states', () {
    expect(SettingsState('a', 'b'), SettingsState('a', 'b'));
    expect(SettingsState('a', 'b'), isNot(SettingsState('aa', 'bb')));
  });

  test('the equality of settings states - copyWith', () {
    const state1 = SettingsState('a', 'b');
    final state2 = state1.copyWith(reportUrl: 'URL');
    expect(state1.reportId, state2.reportId);
    expect(state1.reportUrl, isNot(state2.reportUrl));
    expect(state2.reportUrl, 'URL');

    final state3 = state2.copyWith(reportId: 'ID');
    expect(state3.reportId, 'ID');
    expect(state3.reportUrl, state2.reportUrl);
  });
}

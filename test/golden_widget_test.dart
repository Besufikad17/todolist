import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/main.dart';

import 'mocks.dart';

void main() {
  initHive();

  testGoldens(
    'My home page test',
    (tester) async {
        await loadAppFonts();
        final builder = DeviceBuilder()
          ..addScenario(
            widget: const MyApp(currentTheme: MyAppTheme.lightGruvBox,),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'my_home_page');
    },
  );
}
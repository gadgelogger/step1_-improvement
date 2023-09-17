import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:step1/main.dart' as app;

void main() {
// これは必須で必要。IntegrationTest用に初期化する。
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // テストをいろいろ書くところ(まずは起動できているかをチェック)
  testWidgets(
    'failing test example',
    (tester) async {
      // 2. app.main();
      app.main();

      // 3. tester.pumpAndSettle();
      await tester.pumpAndSettle(); //描画処理を待つ

      // 4. find.text('0')
      // 5. findsOneWidgets
      // 6. expect
      expect(find.text('Posts'), findsOneWidget); //postsが見つかるかどうかをチェック

      // // 7. tester.tap
      // await tester.tap(find.byType(FloatingActionButton));
      // await tester.pumpAndSettle();

      // expect(find.text('1'), findsOneWidget);
    },
  );
}

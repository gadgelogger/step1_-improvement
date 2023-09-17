import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:step1/infrastructure/repository_api_client.dart';
import 'package:step1/main.dart';

// モックを生成するためのアノテーションを追加
import 'widget_test.mocks.dart';

@GenerateMocks([Dio, RepositoryApiClient])
void main() {
  group('WidgetTest', () {
    // RepositoryApiClientクラスとMockDioクラスのインスタンスを宣言
    late RepositoryApiClient repositoryApiClient;
    late MockDio mockDio;

    // テスト実行前に実行されるセットアップ
    setUp(() {
      // MockDioクラスのインスタンスを生成
      mockDio = MockDio();
      // RepositoryApiClientクラスのインスタンスを生成
      repositoryApiClient = RepositoryApiClient(mockDio);
    });

    testWidgets('MyApp should render correctly', (WidgetTester tester) async {
      // テストデータを定義
      const since = 0;
      const url = 'https://api.github.com/users?per_page=20&since=$since';
      final response = [
        {
          'login': 'user1',
          'html_url': 'https://github.com/user1',
          'avatar_url': 'https://avatars.githubusercontent.com/u/1?v=4',
          'id': 1,
        },
        {
          'login': 'user2',
          'html_url': 'https://github.com/user2',
          'avatar_url': 'https://avatars.githubusercontent.com/u/2?v=4',
          'id': 2,
        },
      ];
      // mockDio.getメソッドが呼び出された時に返す値を定義
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: url),
          data: response,
          statusCode: 200));

      // fetchListメソッドを実行し、結果を取得
      final result = await repositoryApiClient.fetchList(since);

      // MyAppをテスト
      await tester
          .pumpWidget(const MaterialApp(home: ProviderScope(child: MyApp())));
      await tester.pumpAndSettle();

      // アプリが正しく起動しているかを確認
      expect(find.text('Posts'), findsOneWidget);
      // リストが正しく表示されているかを確認
    });
  });
}

// Dioパッケージ、flutter_testパッケージ、mockitoパッケージ、RepositoryApiClientクラス、Postクラスをインポート
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:step1/infrastructure/repository_api_client.dart';
import 'package:step1/model/post_state.dart';

// モックを生成するためのアノテーションを追加
import 'repository_api_client_test.mocks.dart';

//https://zenn.dev/donchan922/articles/ac91b56a146583
//https://note.com/danchi_kun/n/n3585919e96b9
// テストグループを定義(DioとRepositoryApiClientクラスのモックを生成)
@GenerateMocks([Dio])
void main() {
  group('RepositoryApiClient', () {
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

    // fetchListメソッドが正常に動作するかをテスト
    test('fetchList returns a list of posts when the response is successful',
        () async {
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

      // 結果がPostクラスのリストであることを確認
      expect(result, isA<List<Post>>());
      // 結果の長さが2であることを確認
      expect(result.length, equals(2));
      // 結果の1つ目の要素のloginが'user1'であることを確認
      expect(result[0].login, equals('user1'));
      // 結果の1つ目の要素のurlが'https://github.com/user1'であることを確認
      expect(result[0].htmlUrl, equals('https://github.com/user1'));
      // 結果の1つ目の要素のavaterが'https://avatars.githubusercontent.com/u/1?v=4'であることを確認
      expect(result[0].avatarUrl,
          equals('https://avatars.githubusercontent.com/u/1?v=4'));
      // 結果の1つ目の要素のidが'1'であることを確認
      expect(result[0].id, 1);
      // 結果の2つ目の要素のloginが'user2'であることを確認
      expect(result[1].login, equals('user2'));
      // 結果の2つ目の要素のurlが'https://github.com/user2'であることを確認
      expect(result[1].htmlUrl, equals('https://github.com/user2'));
      // 結果の2つ目の要素のavaterが'https://avatars.githubusercontent.com/u/2?v=4'であることを確認
      expect(result[1].avatarUrl,
          equals('https://avatars.githubusercontent.com/u/2?v=4'));
      // 結果の2つ目の要素のidが'2'であることを確認
      expect(result[1].id, 2);
      //mockdioのGetが一回呼ばれていることを確認(verify.calledで)←ggrks
    });
    // fetchListメソッドが空のリストを返すかをテスト
    test('fetchList returns an empty list when the response is not successful',
        () async {
      // テストデータを定義
      const since = 0;
      const url = 'https://api.github.com/users?per_page=20&since=$since';
      // mockDio.getメソッドが呼び出された時に返す値を定義
      when(mockDio.get(url)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: url),
          data: [],
          statusCode: 404));

      // fetchListメソッドを実行し、結果を取得
      final result = await repositoryApiClient.fetchList(since);

      // 結果がPostクラスのリストであることを確認
      expect(result, isA<List<Post>>());
      // 結果の長さが0であることを確認
      expect(result.length, equals(0));
    });

    // fetchListメソッドが例外をスローするかをテスト
    //thenThrowでえらってた
    test('fetchList throws an exception when the response is not valid',
        () async {
      // テストデータを定義
      const since = 0;
      const url = 'https://api.github.com/users?per_page=20&since=$since';
      when(mockDio.get(url)).thenThrow(DioException(
          requestOptions: RequestOptions(path: url),
          response: Response(
            requestOptions: RequestOptions(path: url),
            data: [],
            statusCode: 404,
          )));
      expect(
          repositoryApiClient.fetchList(since), throwsA(isA<DioException>()));
      // fetchListメソッドを実行し、例外がスローされることを確認
    });
  });
}

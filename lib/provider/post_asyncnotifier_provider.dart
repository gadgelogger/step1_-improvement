import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:step1/infrastructure/repository_api_client.dart';
import 'package:step1/model/post_state.dart';

part 'post_asyncnotifier_provider.g.dart'; // このファイルはコード生成によって作成される

//これはRverpodを使用して非同期に投稿データを取得するロジックを実装している。
@Riverpod(
    keepAlive:
        true) // Riverpodアノテーションを使用し、ProviderのkeepAliveオプションを有効化。Trueにすると使わないプロパイダを破棄されなくなる
// コードジェネレーションを利用するための設定
//todo:コード生成しとく←した

class PostAsyncnotifierProvider extends _$PostAsyncnotifierProvider {
  // 初期状態を構築するメソッド
  @override
  FutureOr<PostState> build() async {
    final posts = await _initPosts(0); // 1ページ目の投稿を非同期に取得
    return PostState(posts: posts); // 初期状態を返す
  }
  // 初期ページの投稿を取得する非同期メソッド

  Future<List<Post>?> _initPosts(int initPage) async {
    final repositoryApiClient = RepositoryApiClient(Dio());
    final posts = await repositoryApiClient.fetchList(initPage);
    return posts;
  }
  // より多くの投稿を非同期にロードするメソッド

  Future<void> loadMorePost() async {
    final currentState = state.value; // 現在の状態を取得(20行目のやつ)
    final lastId = currentState?.posts?.lastOrNull?.id;
    if (currentState == null ||
        currentState.isLoadMoreError ||
        lastId == null) {
      //currentStateがnullかisLoadMoreErrorがtrueの場合に実行
      print('Loading failed or already loading.');
      return;
    }

    // ロード開始のログ出力
    print(
        'try to request loading ${currentState.isLoading} at ${currentState.since + 20}');

    // Freezedのファイルに新しい状態をセットしてロード開始
    state = AsyncValue.data(currentState.copyWith(
        isLoading: true, isLoadMoreDone: false, isLoadMoreError: false));
    final repositoryApiClient = RepositoryApiClient(Dio()); //APIクライアントをインスタンス化

    final posts = await repositoryApiClient.fetchList(lastId);

    // 次のページの投稿を非同期に取得(20件ずつ取得したいので+20してる)
    //todo:sinceは違うぞ！！！（実装ミス）←最後にidを入れる
    // エラー時の処理(また新しい状態をセット)
    state = AsyncValue.data(
        currentState.copyWith(isLoadMoreError: true, isLoading: false));

    // ロード完了のログ出力
    print('load more ${posts.length} posts at page ${currentState.since + 20}');
    if (posts.isNotEmpty) {
      // 48行目で実行したposts投稿が取得できた場合(postsが空でない時)、ページを増やして新しい状態をセット
      state = AsyncValue.data(currentState.copyWith(
          isLoading: false, //todo:ローディング関連はこっちに書くことを統一する(home.dartにあるやつは削除)
          isLoadMoreDone: false, //同じく
          posts: [...?currentState.posts, ...posts]));
    } else {
      // 投稿が空の場合、ページを増やさずに新しい状態をセット
      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        isLoadMoreDone: true, //Doneと表示
      ));
    }
  }
}

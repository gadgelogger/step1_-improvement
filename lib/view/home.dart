import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:step1/provider/post_asyncnotifier_provider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int oldLength = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final asyncTodos = ref.watch(postAsyncnotifierProviderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: asyncTodos.when(
        // 投稿のロード状態に応じて表示を変更
        data: (asyncTodos) => Consumer(
          builder: (ctx, watch, child) {
            //.notifierはインスタンへのアクセス許可・.stateはプロ杯だの現在の状態を取得
            //ref.watchはプロバイダーを監視するやつ(値も得るよ)
            oldLength = asyncTodos.posts?.length ?? 0; // ロード前の投稿数を取得
            //todo:この部分Freezedを使えばスッキリできるぞ！！！
            //そもそもこれいるか？
            //ロードはLoadingで表示してるし、Errorも表示してるし

            //上からひっぱた時に更新させるやつ
            return RefreshIndicator(
              //refresh()を実行
              onRefresh: () async {
                ref.invalidate(postAsyncnotifierProviderProvider);
              },
              child: NotificationListener<ScrollNotification>(
                //スクロールした際に実行するやつ
                onNotification: (ScrollNotification scrollNotification) {
                  // リストの最後までスクロールした場合
                  if (scrollNotification is ScrollEndNotification) {
                    final before = scrollNotification.metrics.extentBefore;
                    final max = scrollNotification.metrics.maxScrollExtent;

                    if (before == max) {
                      if (oldLength ==
                          ref
                              .read(postAsyncnotifierProviderProvider)
                              .value
                              ?.posts
                              ?.length) {
                        ref
                            .read(postAsyncnotifierProviderProvider.notifier)
                            .loadMorePost();
                      }
                      return true;
                    }
                  }
                  return false;
                },
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemCount: asyncTodos.posts!.length +
                        1, //LinearProgressIndicatorで必要
                    itemBuilder: (ctx, index) {
                      //最後の要素かどうかを判定する
                      final isLastItem = index == asyncTodos.posts!.length;

                      // 現在ビルドされているリストのアイテムの位置を示す番号らしい。
                      //ctxはcontextの略
                      // 最後の要素（プログレスバー、エラー、または最後の要素に到達した場合はDone!とする）

                      //todo:indexじゃなくてboolで判定した方がいいかも
                      //todo: isLoadingを[true]にするコードを追加する
                      //NotificationListener66行にtrueにするコードを追加する
                      //
                      if (isLastItem) {
                        //えらったらCenterにText
                        if (asyncTodos.isLoadMoreError) {
                          return const Center(
                            child: Text('Error'),
                          );
                        }
                        //最後の要素がなくなるとDone!と表示
                        if (asyncTodos.isLoadMoreDone) {
                          return const Center(
                            child: Text(
                              'Done!',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ),
                          );
                        }
                        return const LinearProgressIndicator();
                      }

                      //todo:！マークいらないようにする←いらないようにした
                      //todo:!asyncTodos.posts?[index]は定数化しようぜ。多すぎw
                      return ListTile(
                        title: Text(
                          asyncTodos.posts?[index].login ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(asyncTodos.posts?[index].html_url ?? ''),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                asyncTodos.posts?[index].avatar_url ?? '')),
                        trailing:
                            Text(asyncTodos.posts?[index].id.toString() ?? ''),
                        onTap: () {
                          context.go('/subpage',
                              extra: asyncTodos.posts?[index].html_url ?? '');
                        },
                      );
                    }),
              ),
            );
          },
        ),
        error: (err, stack) => const Text('error'),
        loading: () =>
            const _Loading(), //ローディング中はこいつを実行させてCircularProgressIndicatorを出す
      ),
    );
  }
}

//起動した時にローディング表示
class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

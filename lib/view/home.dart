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
        title: const Text('Github Users'),
      ),
      body: asyncTodos.when(
        data: (asyncTodos) => Consumer(
          builder: (ctx, watch, child) {
            oldLength = asyncTodos.posts?.length ?? 0;

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(postAsyncnotifierProviderProvider);
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
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
                    itemCount: asyncTodos.posts!.length,
                    itemBuilder: (ctx, index) {
                      final data = asyncTodos.posts?[index]; //todo:定数化した

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              data?.login ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(data?.html_url ?? ''),
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data?.avatar_url ?? '')),
                            trailing: Text(data?.id.toString() ?? ''),
                            onTap: () {
                              context.push(
                                '/subpage',
                                extra: (
                                  url: data?.html_url ?? '',
                                  login: data?.login ?? ''
                                ),
                              );
                            },
                          ),
                          if (index == asyncTodos.posts!.length - 1 &&
                              asyncTodos.isLoading)
                            const LinearProgressIndicator()
                        ],
                      );
                    }),
              ),
            );
          },
        ),
        error: (err, stack) => const Text('error'),
        loading: () => const _Loading(),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

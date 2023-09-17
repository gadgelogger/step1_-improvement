import 'package:dio/dio.dart';
import 'package:step1/model/post_state.dart'; //Dioパッケージをインポート

//APIの取得を行うファイル
//書き方はこのサイトを参考https://terupro.net/flutter-api-dio-sample/
class RepositoryApiClient {
  final Dio dio; //Dioクラスのインスタンスを定義

  RepositoryApiClient(this.dio); //コンストラクタ

  Future<List<Post>> fetchList(int since) async {
    //APIからデータを取得するメソッド
    final url =
        'https://api.github.com/users?per_page=20&since=$since'; //APIのURL

    final response = await dio.get(url); //APIからデータを取得
    //正常なリクエストの場合
    if (response.statusCode == 200) {
      final datas = response.data as List<dynamic>; //APIから取得したデータをリストに変換
      final list =
          datas.map((e) => Post.fromJson(e)).toList(); //Postモデルに変換してリストに格納
      return list; //リストを返す
    }

    return []; //エラーが発生した場合は空のリストを返す
  }
}

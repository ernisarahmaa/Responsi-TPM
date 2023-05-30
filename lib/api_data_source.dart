import 'package:responsi/model/list_news_model.dart';
import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadterbaru() {
    return BaseNetwork.get("terbaru");
  }

  Future<Map<String, dynamic>> loaddaerah() {
    return BaseNetwork.get("daerah");
  }

  Future<Map<String, dynamic>> loadinternasional() {
    return BaseNetwork.get("internasional");
  }

  Future<Map<String, dynamic>> loadislam() {
    return BaseNetwork.get("islam");
  }

  Future<Map<String, dynamic>> loadDetailNews(String idDiterima){
    String title = idDiterima.toString();
    return BaseNetwork.get("terbaru/$title");
  }
}

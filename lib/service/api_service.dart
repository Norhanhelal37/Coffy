import 'package:coffy/Networking/api_exceptions.dart';
import 'package:coffy/Networking/dio_config.dart';
import 'package:coffy/models/item_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  ApiService._();
  static final ApiService api = ApiService._();

  Future<List<ItemModel>> fetchAllItems() async {
    Dio dio = DioConfig.getDio();
    try {
      Response response = await dio.get("hot");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
      
        List<ItemModel> items =
            data.map((e) => ItemModel.fromjason(e)).toList();
        return items;
      } else {
        throw ApiException(response.statusMessage);
      }
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}

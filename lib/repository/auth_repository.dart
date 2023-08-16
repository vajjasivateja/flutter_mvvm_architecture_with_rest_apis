import 'package:flutter_mvvm_architecture_with_rest_apis/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm_architecture_with_rest_apis/res/urls.dart';

class AuthRepository {
  BaseApiService apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await apiService.getPostApiResponse(AppUrls.loginApi, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await apiService.getPostApiResponse(AppUrls.sigUpApi, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}

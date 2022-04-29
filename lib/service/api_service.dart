import 'package:cubit_rest_api/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try{
      return await _dio.get(baseUrl + posts);
    }catch(e){
      print('Error $e');
    }
  }
}

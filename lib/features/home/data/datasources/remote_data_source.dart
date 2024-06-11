import 'package:dio/dio.dart';
import 'package:weather_task/core/network/network.dart';

import '../exception.dart';
import '../models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final response = await NetworkHelper.instance.get(
        endPoint: EndPoints.WEATHER_BY_CITY_NAME,
        params: {'q': cityName},
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioError catch (dioError) {
      print('DioError: $dioError');
      throw ServerException();
    } catch (e) {
      print('Error: $e');
      throw ServerException();
    }
  }
}

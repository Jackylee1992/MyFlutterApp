import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:async';

typedef void CompletionBlock(Map result);
String doubanApikey = '0df993c66c0c636e29ecbb5344252a4a';

class HttpHelper {

  String movieInTheaterURL = 'https://api.douban.com/v2/movie/in_theaters?start=0&count=10&apikey=$doubanApikey';

// https://api.douban.com/v2/movie/in_theaters
// https://api.douban.com/v2/movie/top250?start=$_apiStartNum&count=15

Future<void> getMoivedsInTheaters(CompletionBlock completion) async {
  try {
      http.get(movieInTheaterURL)
          .then((http.Response response) {
            JsonDecoder decoder = JsonDecoder();
            final result = decoder.convert(response.body);
            completion(result);
          })
          .catchError((error) => print('error' + error.toString()))
          .whenComplete(() => print('complete'));
    } catch (e) {
      throw Exception(e.toString());
    }
}

Future<Map> loadMovieDataByDio() async {
  Dio dio = Dio();
  Response response = await dio.request(movieInTheaterURL);
  final result = response.data;
  return result;
}

  Future<Map> loadMovieDataByHttp() async {
    try {
      http
          .get(
              'https://api.douban.com/v2/movie/in_theaters?start=0&count=10&apikey=$doubanApikey')
          .then((http.Response response) {

            JsonDecoder decoder = JsonDecoder();
            final result = decoder.convert(response.body);
            return result;
          })
          .catchError((error) => print('error' + error.toString()))
          .whenComplete(() => print('complete'));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}


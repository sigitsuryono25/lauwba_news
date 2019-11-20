import 'package:dio/dio.dart';
import 'package:lauwba_news/datamodel/detail/ResponseDetail.dart';
import 'package:lauwba_news/datamodel/kelas/ResponseKelas.dart';
import 'package:lauwba_news/datamodel/listnews/ResponseNews.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.dart';

@RestApi(baseUrl: "https://www.lauwba.com/411/index.php/Webservices/")
abstract class ApiService {
  factory ApiService(Dio _dio, {String baseUrl}) = RestClient;

  @GET("get_latest_news")
  Future<ResponseNews> getNews();

  @GET("get_detail_news/{id}")
  Future<ResponseDetail> getDetail(@Path("id") String id);

  @GET("get_kelas")
  Future<ResponseKelas> getKelas();
}

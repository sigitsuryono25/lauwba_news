part of 'ApiService.dart';

class RestClient implements ApiService {
  final Dio _dio;
  String baseUrl;

  RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, baseUrl);
    this.baseUrl = "https://www.lauwba.com/411/index.php/Webservices/";
  }

  @override
  getDetail(String id) async {
    final _extra = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final qp = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        "get_detail_news/" + id,
        queryParameters: qp,
        options: RequestOptions(
            extra: _extra,
            method: "GET",
            baseUrl: baseUrl,
            headers: <String, dynamic>{}),
        data: _data);
    final values = ResponseDetail.fromJson(_result.data);
    return Future.value(values);
  }

  @override
  getNews() async{
    final qp = <String, dynamic>{};
    final Response _result =
    await _dio.get(
        "/get_latest_news",
        queryParameters: qp,
        options: RequestOptions(
            baseUrl: baseUrl)
    );
    var values = ResponseNews.fromJson(_result.data);
    return values;
  }

  @override
  getKelas() async{
    final Response _result = await _dio.get("get_kelas", options: RequestOptions(baseUrl: baseUrl));
    var values = ResponseKelas.fromJsonMap(_result.data);
    return values;
  }
}

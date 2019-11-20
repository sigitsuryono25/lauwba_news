import 'package:lauwba_news/datamodel/detail/data.dart';

class ResponseDetail {
	Data data;
	String message;
	int error;

	ResponseDetail({this.data, this.message, this.error});

	ResponseDetail.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
		message = json['message'];
		error = json['error'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
			data['data'] = this.data.toJson();
		}
		data['message'] = this.message;
		data['error'] = this.error;
		return data;
	}
}

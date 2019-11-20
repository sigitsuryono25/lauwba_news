import 'dart:convert';

import 'data.dart';

class ResponseNews {
	List<Data> data;
	String message;
	int error;

	ResponseNews({this.data, this.message, this.error});

	ResponseNews.fromJson(String json) {
		Map mapJson = jsonDecode(json);
		if (mapJson['data'] != null) {
			data = new List<Data>();
			mapJson['data'].forEach((v) {
				data.add(new Data.fromJson(v));
			});
		}
		message = mapJson['message'];
		error = mapJson['error'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
			data['data'] = this.data.map((v) => v.toJson()).toList();
		}
		data['message'] = this.message;
		data['error'] = this.error;
		return data;
	}
}

import 'dart:convert';

import 'package:lauwba_news/datamodel/kelas/data.dart';

class ResponseKelas {

  List<Data> data;
  String message;
  int error;

	ResponseKelas.fromJsonMap(String jsons){
		Map mapJson = jsonDecode(jsons);
		if (mapJson['data'] != null) {
			data = new List<Data>();
			mapJson['data'].forEach((v) {
				data.add(new Data.fromJsonMap(v));
			});
		}
		message = mapJson['message'];
		error = mapJson['error'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		data['message'] = message;
		data['error'] = error;
		return data;
	}
}

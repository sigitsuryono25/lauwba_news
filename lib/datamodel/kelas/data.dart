
class Data {

  String id_jenis;
  String judul;
  String gambar;
  String routes;
  String harga;

	Data.fromJsonMap(Map<String, dynamic> map): 
		id_jenis = map["id_jenis"],
		judul = map["judul"],
		gambar = map["gambar"],
		routes = map["routes"],
		harga = map["harga"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id_jenis'] = id_jenis;
		data['judul'] = judul;
		data['gambar'] = gambar;
		data['routes'] = routes;
		data['harga'] = harga;
		return data;
	}
}

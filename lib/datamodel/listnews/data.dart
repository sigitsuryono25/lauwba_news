class Data {
  String id;
  String jdlNews;
  String namaKategori;
  String fotoNews;
  String judulSeo;
  String postOn;

  Data(
      {this.id,
        this.jdlNews,
        this.namaKategori,
        this.fotoNews,
        this.judulSeo,
        this.postOn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jdlNews = json['jdl_news'];
    namaKategori = json['nama_kategori'];
    fotoNews = json['foto_news'];
    judulSeo = json['judul_seo'];
    postOn = json['post_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jdl_news'] = this.jdlNews;
    data['nama_kategori'] = this.namaKategori;
    data['foto_news'] = this.fotoNews;
    data['judul_seo'] = this.judulSeo;
    data['post_on'] = this.postOn;
    return data;
  }
}
//https://api.calil.jp/check?appkey=36708eb6fc106c4663fac79043e2eec5&isbn=4834000826&systemid=Aomori_Pref&format=json
//https://api.calil.jp/library?apikeyt=36708eb6fc106c4663fac79043e2eec5&format=json&pref=%E4%BA%AC%E9%83%BD%E5%BA%9C&city=%E4%BA%AC%E9%83%BD%E5%B8%82&limit=30

class Library {
  final String? formal;
  final String? url_pc;
  final String? address;
  final String? tel;

  Library({
    required this.formal,
    required this.url_pc,
    required this.address,
    required this.tel,
  });

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
      formal: json["formal"],
      url_pc: json["url_pc"],
      address: json["address"],
      tel: json["tel"],
    );
  }
}

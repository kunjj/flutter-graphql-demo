/// code : "ar"
/// name : "Arabic"
/// native : "العربية"
/// rtl : true

class Languages {
  Languages({
      String? code, 
      String? name, 
      String? native, 
      bool? rtl,}){
    _code = code;
    _name = name;
    _native = native;
    _rtl = rtl;
}

  Languages.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _native = json['native'];
    _rtl = json['rtl'];
  }
  String? _code;
  String? _name;
  String? _native;
  bool? _rtl;
Languages copyWith({  String? code,
  String? name,
  String? native,
  bool? rtl,
}) => Languages(  code: code ?? _code,
  name: name ?? _name,
  native: native ?? _native,
  rtl: rtl ?? _rtl,
);
  String? get code => _code;
  String? get name => _name;
  String? get native => _native;
  bool? get rtl => _rtl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['native'] = _native;
    map['rtl'] = _rtl;
    return map;
  }

}
/// code : "AS"
/// name : "Asia"

class Continent {
  Continent({
      String? code, 
      String? name,}){
    _code = code;
    _name = name;
}

  Continent.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
  }
  String? _code;
  String? _name;
Continent copyWith({  String? code,
  String? name,
}) => Continent(  code: code ?? _code,
  name: name ?? _name,
);
  String? get code => _code;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    return map;
  }

}
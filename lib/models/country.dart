import 'package:json_annotation/json_annotation.dart';

import 'Languages.dart';
import 'continent.dart';

/// awsRegion : "me-south-1"
/// capital : "Abu Dhabi"
/// code : "AE"
/// continent : {"code":"AS","name":"Asia"}
/// currencies : ["AED"]
/// currency : "AED"
/// emoji : "🇦🇪"
/// emojiU : "U+1F1E6 U+1F1EA"
/// languages : [{"code":"ar","name":"Arabic","native":"العربية","rtl":true}]
/// native : "دولة الإمارات العربية المتحدة"
/// phone : "971"
/// phones : ["971"]
/// states : []
/// subdivisions : []
/// name : "United Arab Emirates"

@JsonSerializable()
class Countries {
  Countries({
    String? awsRegion,
    String? capital,
    String? code,
    Continent? continent,
    List<String>? currencies,
    String? currency,
    String? emoji,
    String? emojiU,
    List<Languages>? languages,
    String? native,
    String? phone,
    List<String>? phones,
    List<dynamic>? states,
    List<dynamic>? subdivisions,
    String? name,
  }) {
    _awsRegion = awsRegion;
    _capital = capital;
    _code = code;
    _continent = continent;
    _currencies = currencies;
    _currency = currency;
    _emoji = emoji;
    _emojiU = emojiU;
    _languages = languages;
    _native = native;
    _phone = phone;
    _phones = phones;
    _states = states;
    _subdivisions = subdivisions;
    _name = name;
  }

  @JsonKey(name: 'awsRegion')
  String? awsRegion;
  @JsonKey(name: 'capital')
  String? capital;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'continent')
  Continent? continent;
  @JsonKey(name: 'currencies')
  List<String>? currencies;
  @JsonKey(name: 'currency')
  String? currency;
  @JsonKey(name: 'emoji')
  String? emoji;
  @JsonKey(name: 'emojiU')
  String? emojiU;
  @JsonKey(name: 'languages')
  List<Languages>? languages;
  @JsonKey(name: 'native')
  String? native;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'phones')
  List<String>? phones;
  @JsonKey(name: 'name')
  String? name;

  Countries copyWith({
    String? awsRegion,
    String? capital,
    String? code,
    Continent? continent,
    List<String>? currencies,
    String? currency,
    String? emoji,
    String? emojiU,
    List<Languages>? languages,
    String? native,
    String? phone,
    List<String>? phones,
    List<dynamic>? states,
    List<dynamic>? subdivisions,
    String? name,
  }) => Countries(
    awsRegion: awsRegion ?? _awsRegion,
    capital: capital ?? _capital,
    code: code ?? _code,
    continent: continent ?? _continent,
    currencies: currencies ?? _currencies,
    currency: currency ?? _currency,
    emoji: emoji ?? _emoji,
    emojiU: emojiU ?? _emojiU,
    languages: languages ?? _languages,
    native: native ?? _native,
    phone: phone ?? _phone,
    phones: phones ?? _phones,
    states: states ?? _states,
    subdivisions: subdivisions ?? _subdivisions,
    name: name ?? _name,
  );
}

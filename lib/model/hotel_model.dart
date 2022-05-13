import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';

@JsonSerializable()
class Hotels {
  final List<Hotel> hotelList;

  Hotels({required this.hotelList});

  factory Hotels.fromJson(Map<String, dynamic> json) => _$HotelsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelsToJson(this);
}

@JsonSerializable()
class Hotel {
  final String? hotelName;
  final String? hotelSpecial;
  final String? address2;
  final String? hotelImageUrl;

  Hotel({
    required this.hotelName,
    required this.hotelSpecial,
    required this.address2,
    required this.hotelImageUrl,
  });


  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotels _$HotelsFromJson(Map<String, dynamic> json) => Hotels(
      hotelList: (json['hotelList'] as List<dynamic>)
          .map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelsToJson(Hotels instance) => <String, dynamic>{
      'hotelList': instance.hotelList,
    };

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      hotelName: json['hotelName'] as String?,
      hotelSpecial: json['hotelSpecial'] as String?,
      address2: json['address2'] as String?,
      hotelImageUrl: json['hotelImageUrl'] as String?,
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'hotelName': instance.hotelName,
      'hotelSpecial': instance.hotelSpecial,
      'address2': instance.address2,
      'hotelImageUrl': instance.hotelImageUrl,
    };

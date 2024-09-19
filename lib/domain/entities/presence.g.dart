// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenceImpl _$$PresenceImplFromJson(Map<String, dynamic> json) =>
    _$PresenceImpl(
      date: json['date'] as String,
      checkIn: json['checkIn'] as String,
      checkOut: json['checkOut'] as String,
    );

Map<String, dynamic> _$$PresenceImplToJson(_$PresenceImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
    };

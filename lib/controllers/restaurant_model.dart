import 'dart:ffi';

class RestaurantModel{
  String? description;
  String? destination;
  String? placeId;
  String? placeName;
  Double? rate;
  String? thumbnailUrl;


  RestaurantModel({this.description,this.destination,this.placeId,
    this.placeName,this.rate,this.thumbnailUrl});

  factory RestaurantModel.fromMap(map){
    return RestaurantModel(
      description: map['description'],
      destination: map['destination'],
      placeId: map['placeId'],
      placeName: map['placeName'],
      rate: map['rate'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'description':description,
      'destination':destination,
      'placeId': placeId,
      'placeName' : placeName,
      'rate' : rate,
      'thumbnailUrl' : thumbnailUrl,
    };
  }
}
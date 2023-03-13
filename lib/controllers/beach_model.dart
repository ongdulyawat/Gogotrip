import 'dart:ffi';

class BeachModel{
  String? description;
  String? destination;
  String? placeId;
  String? placeName;
  Double? rate;
  String? thumbnailUrl;


  BeachModel({this.description,this.destination,this.placeId,
    this.placeName,this.rate,this.thumbnailUrl});

  factory BeachModel.fromMap(map){
    return BeachModel(
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
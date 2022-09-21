import 'dart:convert';

SongModel songModelFromJson(String str) => SongModel.fromJson(json.decode(str));

String songModelToJson(SongModel data) => json.encode(data.toJson());

class SongModel {
  SongModel({
    this.data,
    this.status,
    this.message,
    this.statusCode,
  });

  Data? data;
  String? status;
  String? message;
  int? statusCode;

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "message": message,
        "statusCode": statusCode,
      };
}

class Data {
  Data({
    required this.data,
    this.totalItems,
    this.pageNo,
    this.size,
    this.sortBy,
    this.direction,
  });

  List<Datum> data;
  int? totalItems;
  int? pageNo;
  int? size;
  String? sortBy;
  String? direction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalItems: json["totalItems"],
        pageNo: json["pageNo"],
        size: json["size"],
        sortBy: json["sortBy"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalItems": totalItems,
        "pageNo": pageNo,
        "size": size,
        "sortBy": sortBy,
        "direction": direction,
      };
}

class Datum {
  Datum({
    this.lastupdate,
    this.allowDelivery,
    this.isLive,
    this.ownerMobile,
    this.claimCode,
    this.restaurantId,
    this.imageUrl,
    this.pincode,
    this.address,
    this.city,
    this.allowReservations,
    this.isOnline,
    this.createdby,
    this.rating,
    required this.type,
    this.shortMessage,
    this.restaurantName,
    this.id,
    this.whatsappNumber,
    required this.pics,
    this.allowTakeaway,
    this.description,
    this.location,
    this.state,
    this.createdate,
    this.neighbourhood,
    this.updatedby,
    this.avgTime,
    required this.claimedEmails,
    this.ownerEmail,
    this.owner,
    this.gstPercent,
    this.online,
    this.isOpen,
    this.claimed,
    this.serviceChargePercent,
    this.geohash,
  });

  Date? lastupdate;
  bool? allowDelivery;
  bool? isLive;
  String? ownerMobile;
  String? claimCode;
  String? restaurantId;
  String? imageUrl;
  dynamic pincode;
  String? address;
  String? city;
  bool? allowReservations;
  bool? isOnline;
  String? createdby;
  double? rating;
  List<String> type;
  String? shortMessage;
  String? restaurantName;
  String? id;
  dynamic whatsappNumber;
  List<String> pics;
  bool? allowTakeaway;
  String? description;
  Location? location;
  String? state;
  Date? createdate;
  String? neighbourhood;
  String? updatedby;
  dynamic avgTime;
  List<ClaimedEmail> claimedEmails;
  String? ownerEmail;
  String? owner;
  double? gstPercent;
  bool? online;
  bool? isOpen;
  bool? claimed;
  int? serviceChargePercent;
  String? geohash;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        lastupdate: Date.fromJson(json["lastupdate"]),
        allowDelivery: json["allowDelivery"],
        isLive: json["isLive"],
        ownerMobile: json["ownerMobile"],
        claimCode: json["Claim Code"],
        restaurantId:
            json["restaurantId"] == null ? null : json["restaurantId"],
        imageUrl: json["imageUrl"],
        pincode: json["pincode"],
        address: json["address"],
        city: json["city"],
        allowReservations: json["allowReservations"],
        isOnline: json["isOnline"],
        createdby: json["createdby"] == null ? null : json["createdby"],
        rating: json["rating"].toDouble(),
        type: json["type"] == null
            ? []
            : List<String>.from(json["type"].map((x) => x)),
        shortMessage:
            json["shortMessage"] == null ? null : json["shortMessage"],
        restaurantName: json["restaurantName"],
        id: json["id"],
        whatsappNumber: json["whatsappNumber"],
        pics: List<String>.from(json["pics"].map((x) => x)),
        allowTakeaway: json["allowTakeaway"],
        description: json["description"],
        location: Location.fromJson(json["location"]),
        state: json["state"] == null ? null : json["state"],
        createdate: json["createdate"] == null
            ? null
            : Date.fromJson(json["createdate"]),
        neighbourhood:
            json["neighbourhood"] == null ? null : json["neighbourhood"],
        updatedby: json["updatedby"],
        avgTime: json["avgTime"],
        claimedEmails: json["claimedEmails"] == null
            ? []
            : List<ClaimedEmail>.from(
                json["claimedEmails"].map((x) => ClaimedEmail.fromJson(x))),
        ownerEmail: json["ownerEmail"] == null ? null : json["ownerEmail"],
        owner: json["owner"] == null ? null : json["owner"],
        gstPercent:
            json["gstPercent"] == null ? null : json["gstPercent"].toDouble(),
        online: json["online"] == null ? null : json["online"],
        isOpen: json["isOpen"] == null ? null : json["isOpen"],
        claimed: json["claimed"] == null ? null : json["claimed"],
        serviceChargePercent: json["serviceChargePercent"] == null
            ? null
            : json["serviceChargePercent"],
        geohash: json["geohash"] == null ? null : json["geohash"],
      );

  Map<String, dynamic> toJson() => {
        "lastupdate": lastupdate?.toJson(),
        "allowDelivery": allowDelivery,
        "isLive": isLive,
        "ownerMobile": ownerMobile,
        "Claim Code": claimCode,
        "restaurantId": restaurantId == null ? null : restaurantId,
        "imageUrl": imageUrl,
        "pincode": pincode,
        "address": address,
        "city": city,
        "allowReservations": allowReservations,
        "isOnline": isOnline,
        "createdby": createdby == null ? null : createdby,
        "rating": rating,
        "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
        "shortMessage": shortMessage == null ? null : shortMessage,
        "restaurantName": restaurantName,
        "id": id,
        "whatsappNumber": whatsappNumber,
        "pics": List<dynamic>.from(pics.map((x) => x)),
        "allowTakeaway": allowTakeaway,
        "description": description,
        "location": location?.toJson(),
        "state": state == null ? null : state,
        "createdate": createdate == null ? null : createdate?.toJson(),
        "neighbourhood": neighbourhood == null ? null : neighbourhood,
        "updatedby": updatedby,
        "avgTime": avgTime,
        "claimedEmails": claimedEmails == null
            ? null
            : List<dynamic>.from(claimedEmails.map((x) => x.toJson())),
        "ownerEmail": ownerEmail == null ? null : ownerEmail,
        "owner": owner == null ? null : owner,
        "gstPercent": gstPercent == null ? null : gstPercent,
        "online": online == null ? null : online,
        "isOpen": isOpen == null ? null : isOpen,
        "claimed": claimed == null ? null : claimed,
        "serviceChargePercent":
            serviceChargePercent == null ? null : serviceChargePercent,
        "geohash": geohash == null ? null : geohash,
      };
}

class ClaimedEmail {
  ClaimedEmail({
    this.uid,
    this.email,
  });

  String? uid;
  String? email;

  factory ClaimedEmail.fromJson(Map<String, dynamic> json) => ClaimedEmail(
        uid: json["uid"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
      };
}

class Date {
  Date({
    this.seconds,
    this.nanoseconds,
  });

  int? seconds;
  int? nanoseconds;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        seconds: json["_seconds"],
        nanoseconds: json["_nanoseconds"],
      );

  Map<String, dynamic> toJson() => {
        "_seconds": seconds,
        "_nanoseconds": nanoseconds,
      };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["_latitude"].toDouble(),
        longitude: json["_longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_latitude": latitude,
        "_longitude": longitude,
      };
}

class WhatsappNumberElement {
  WhatsappNumberElement({
    this.number,
  });

  String? number;

  factory WhatsappNumberElement.fromJson(Map<String, dynamic> json) =>
      WhatsappNumberElement(
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
      };
}

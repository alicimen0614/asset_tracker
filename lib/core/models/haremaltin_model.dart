// Ana Model Sınıfı
import 'package:asset_tracker/core/constants/const_app_texts.dart';

class HaremAltinData {
  final Meta meta;
  final Map<String, Item> data;

  HaremAltinData({required this.meta, required this.data});

  factory HaremAltinData.fromJson(Map<String, dynamic> json) {
    return HaremAltinData(
      meta: Meta.fromJson(json['meta']),
      data: Map<String, Item>.from(json['data']
          .map((key, value) => MapEntry(key, Item.fromJson(value)))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meta': meta.toJson(),
      'data': data.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

// Meta Verileri
class Meta {
  final int time;
  final String? tarih;

  Meta({required this.time, this.tarih});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      time: json['time'],
      tarih: json['tarih'] != null
          ? json['tarih'] as String
          : ConstAppTexts.unknownText,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'tarih': tarih,
    };
  }
}

//Öğe Modeli
class Item {
  final String code;
  final String alis;
  final String satis;
  final String tarih;
  final Direction dir;
  final double dusuk;
  final double yuksek;
  final double kapanis;

  Item({
    required this.code,
    required this.alis,
    required this.satis,
    required this.tarih,
    required this.dir,
    required this.dusuk,
    required this.yuksek,
    required this.kapanis,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      code: json['code'].toString(),
      alis: json['alis'].toString(),
      satis: json['satis'].toString(),
      tarih: json['tarih'].toString(),
      dir: Direction.fromJson(json['dir']),
      dusuk: json['dusuk'].toDouble(),
      yuksek: json['yuksek'].toDouble(),
      kapanis: json['kapanis'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'alis': alis,
      'satis': satis,
      'tarih': tarih,
      'dir': dir.toJson(),
      'dusuk': dusuk,
      'yuksek': yuksek,
      'kapanis': kapanis,
    };
  }
}

// Yön Modeli
class Direction {
  final String alisDir;
  final String satisDir;

  Direction({required this.alisDir, required this.satisDir});

  factory Direction.fromJson(Map<String, dynamic> json) {
    return Direction(
      alisDir: json['alis_dir'] ?? '',
      satisDir: json['satis_dir'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alis_dir': alisDir,
      'satis_dir': satisDir,
    };
  }
}

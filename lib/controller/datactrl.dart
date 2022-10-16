import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/skin.model.dart';

class DataControll {
  Future<List<SkinInfo>> getSkin() async {
    final String response =
        await rootBundle.loadString('assets/data/skinInfo.json');

    final items = await json.decode(response).cast<Map<String, dynamic>>();

    List<SkinInfo> skins = items.map<SkinInfo>((json) {
      return SkinInfo.fromJson(json);
    }).toList();

    return skins;
  }
}

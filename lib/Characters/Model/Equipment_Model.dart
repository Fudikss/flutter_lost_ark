import 'package:lost_ark_flutter/Util/Import_Package.dart';

class EquipmentModel{
  String equipment_name = ""; /// 장비명
  String equipment_level = ""; /// 장비레벨
  int equipment_quality = 0; /// 장비품질
  String equipment_img = ""; /// 장비이미지

  EquipmentModel({required this.equipment_name, required this.equipment_level, required this.equipment_quality, required this.equipment_img});


  factory EquipmentModel.fromJson(Map<String, dynamic> json){
    return EquipmentModel(
      equipment_name: json["equipment_name"],
      equipment_level: json["equipment_level"],
      equipment_quality: json["equipment_quality"],
      equipment_img: json["equipment_img"],
    );
  }
}





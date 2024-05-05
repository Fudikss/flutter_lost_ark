
class CardModel{
  String card_name = "";
  String card_image = "";
  int card_awake_count = 0;
  int card_awake_total = 0;


  CardModel({
    required this.card_name,
    required this.card_image,
    required this.card_awake_count,
    required this.card_awake_total,
  });

  factory CardModel.fromJson(Map<String, dynamic> json){
    return CardModel(
      card_name: json["card_name"], 
      card_image: json["card_image"],
      card_awake_count: json["card_awake_count"],
      card_awake_total: json["card_awake_total"],
    );
  }
}

class CardEffectModel{
  List card_effect = [];

  CardEffectModel({
    required this.card_effect
  });

}
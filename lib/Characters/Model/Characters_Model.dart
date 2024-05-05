
class CharactersModel{

  String characters_img = ""; // 캐릭터 이미지
  String characters_title = ""; // 캐릭터 칭호
  String characters_nickname = ""; // 캐릭터 닉네임
  String server_name = ""; // 캐릭터 소속 서버명
  String characters_class_name = ""; // 캐릭터 클래스
  String characters_guild_name = ""; // 캐릭터 가입 길드명
  String characters_guild_grade = ""; // 캐릭터 가입 길드 권한
  int expendtionlevel = 0; // 캐릭터 원정대 레벨
  List characters_stats = []; // 캐릭터 스탯
  String characters_item_level = ""; // 캐릭터 아이템 레벨
  List characters_tendencies = []; // 캐릭터 성향
  int characters_using_skill_point = 0; // 캐릭터 사용 스킬 포인트
  int characters_total_skill_point = 0; // 캐릭터 총 스킬 포인트

  

  CharactersModel({
    required this.characters_img, 
    required this.characters_title, 
    required this.characters_nickname, 
    required this.server_name, 
    required this.characters_class_name,
    required this.characters_guild_name,
    required this.characters_guild_grade,
    required this.expendtionlevel,
    required this.characters_stats,
    required this.characters_item_level,
    required this.characters_tendencies,
    required this.characters_using_skill_point,
    required this.characters_total_skill_point
    });


  factory CharactersModel.fromJson(Map<String, dynamic> json){
    return CharactersModel(
      characters_img: json["characters_img"], 
      characters_title: json["characters_title"], 
      characters_nickname: json["characters_nickname"], 
      server_name: json["server_name"], 
      characters_class_name: json["characters_class_name"],
      characters_guild_name: json["characters_guild_name"],
      characters_guild_grade: json["characters_guild_grade"],
      expendtionlevel: json["expendtionlevel"],
      characters_stats: json["characters_stats"],
      characters_item_level: json["characters_item_level"],
      characters_tendencies: json["characters_tendencies"],
      characters_using_skill_point: json["characters_using_skill_point"],
      characters_total_skill_point: json["characters_total_skill_point"],
    );
  }
}
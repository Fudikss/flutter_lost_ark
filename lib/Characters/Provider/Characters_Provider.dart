import 'package:lost_ark_flutter/Characters/Model/Card_Model.dart';
import 'package:lost_ark_flutter/Characters/Model/Characters_Model.dart';
import 'package:lost_ark_flutter/Util/Import_Package.dart';

class CharactersProvider extends ChangeNotifier{

  var dio = Dio();

  ///로스트아크 검색하려는 캐릭터 프로필 데이터 호출 함수
  Future get_Search_Characters_Profiles(String par_search_nick_name) async{
    

    try{

      var response = await dio.post("http://${ServerInfo().server_url}/characters/get_characters_profile/:data", data:{
        "nick_name" : par_search_nick_name,
      });

      if(response.data["result"].length != 0){

      

        Map<String, dynamic> equipment_map = {
          "characters_data" : [],
          "equipment_data" : [], 
          "card" : [], 
          "card_effect" : []};

        equipment_map["characters_data"].add(
          CharactersModel(
            characters_img: response.data["result"][0]["CharacterImage"], 
            characters_title: response.data["result"][0]["Title"], 
            characters_nickname: response.data["result"][0]["CharacterName"], 
            server_name: response.data["result"][0]["ServerName"], 
            characters_class_name: response.data["result"][0]["CharacterClassName"], 
            characters_guild_name: response.data["result"][0]["GuildName"], 
            characters_guild_grade: response.data["result"][0]["GuildMemberGrade"], 
            expendtionlevel: response.data["result"][0]["ExpeditionLevel"], 
            characters_stats: response.data["result"][0]["Stats"], 
            characters_item_level: response.data["result"][0]["ItemMaxLevel"], 
            characters_tendencies: response.data["result"][0]["Tendencies"], 
            characters_using_skill_point: response.data["result"][0]["UsingSkillPoint"], 
            characters_total_skill_point: response.data["result"][0]["TotalSkillPoint"]));

      
        for(var item in response.data["result"][1]){
          equipment_map["equipment_data"].add(
            EquipmentModel(
              equipment_name: item["Name"], 
              equipment_level: parse(item["Tooltip"]["Element_001"]["value"]["leftStr2"]).body!.text, 
              equipment_quality: item["Tooltip"]["Element_001"]["value"]["qualityValue"], 
              equipment_img: item["Icon"]));
        }

        for(var item in response.data["result"][2]["Cards"]){
          equipment_map["card"].add(
            CardModel(
              card_name: item["Name"], 
              card_image: item["Icon"], 
              card_awake_count: item["AwakeCount"], 
              card_awake_total: item["AwakeTotal"], 
          ));
        }
        
        equipment_map["card_effect"].addAll(response.data["result"][2]["Effects"][0]["Items"]);
        

        // for(var item in response.data["result"][2]["Effects"][0]["Items"]){
        //   equipment_map["card_effect"].add(
        //     CardEffectModel(card_effect: item));
        // }

        return equipment_map;
      
      }else{

        return "none";
      }

    }catch(e){
      print(e);
    }
  }

  
  /// 품질 수치에 따른 컬러값 반환 함수
  Color res_Quality_Color(int prev_quality){
    
    if(prev_quality == 100){

      return Color.fromARGB(255, 252, 155, 10);
    
    }else if(prev_quality >= 90){
    
      return const Color.fromARGB(255, 238, 57, 118);
    
    }else if(prev_quality >= 70){

      return Colors.blue;
    
    }else if(prev_quality >= 30){

      return Colors.greenAccent;

    }else if(prev_quality >= 10){

      return Colors.orange;

    }else if(prev_quality >= 1){

      return Colors.red;
    
    }else{

      return Colors.grey;

    }
  }

  /// 카드 각성 갯수에 따른 위젯 반환 함수
  Widget card_Awake_Count(int prev_awake_count){

    if(prev_awake_count == 5){

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );

    }else if(prev_awake_count == 4){

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );

    }else if(prev_awake_count == 3){

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );

    }else if(prev_awake_count == 2){

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );

    }else if(prev_awake_count == 1){

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
      
    }else{

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
             Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
  }
}
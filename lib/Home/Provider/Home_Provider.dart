import 'package:lost_ark_flutter/Util/Import_Package.dart';


class HomeProvider extends ChangeNotifier{

  var dio = Dio();

  /// 로스트아크 진행 이벤트 호출 함수
  Future get_Lost_Ark_Events() async{
    
    try{

      var response = await dio.get("http://${ServerInfo().server_url}/news/get_events");

      
      return response.data["result"];

    }catch(e){
      print(e);
    }
  }


  /// 로스트아크 공지사항 호출 함수
    Future get_Lost_Ark_Notice() async{
    
    try{

      var response = await dio.get("http://${ServerInfo().server_url}/news/get_notices");


      List noties_list = [];

      for(var item in response.data["result"]){
        noties_list.add(
          NewsModel(
            news_title: item["Title"],  
            news_date: item["Date"], 
            news_link: item["Link"], 
            news_type: item["Type"],));
      }

      
      return noties_list;

    }catch(e){
      print(e);
    }
  }
}
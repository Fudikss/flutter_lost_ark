import 'package:lost_ark_flutter/Util/Import_Package.dart';

class CharactersProfile extends StatefulWidget {
  final String prev_nick_name;
  const CharactersProfile({super.key, required this.prev_nick_name});

  @override
  State<CharactersProfile> createState() => _CharactersProfileState();
}

class _CharactersProfileState extends State<CharactersProfile> {

  CharactersProvider characters_provider = CharactersProvider();

  @override
  Widget build(BuildContext context) {
    characters_provider = Provider.of<CharactersProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFF15181D),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            leading: Container(),
            backgroundColor: Color(0xFF15181D),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: characters_provider.get_Search_Characters_Profiles(widget.prev_nick_name), 
              builder: (context, AsyncSnapshot snapshot){
                if(snapshot.hasError){
                  return Container();
                }else if(snapshot.connectionState == ConnectionState.waiting){
                  return Container();
                }else{

                  // return Container();

                  // var profile_data = snapshot.data;
          
                  // return Column(
                  //   children: [
                      
                  //     Container(
                  //       child: CachedNetworkImage(
                  //         imageUrl: profile_data["CharacterImage"],
                  //         fit: BoxFit.fill,
                  //         placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  //         errorWidget: (context, url, error) => Icon(Icons.error),
                  //       ),
                  //     ),

                  //     Padding(
                  //       padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.white, width: 1),
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [

                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text(" 칭호  ", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["Title"], style: const TextStyle(color: Color(0xFFFF9436))),
                  //                     ],
                  //                   ),

                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text("닉네임", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["CharacterName"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),

                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text("서버명", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["ServerName"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),

                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text("클래스", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["CharacterClassName"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),


                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text(" 레벨  ", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["ItemMaxLevel"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),


                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text("길드명", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["GuildName"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),



                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,

                  //                 children: [
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text(" 치명  ", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["Stats"][0]["Value"], style: const TextStyle(color: Color(0xFFFF9436))),
                  //                     ],
                  //                   ),

                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text(" 특화  ", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["Stats"][1]["Value"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),

                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text(" 신속  ", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["Stats"][3]["Value"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),

                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text("공격력", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["Stats"][7]["Value"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),


                  //                   const SizedBox(height: 10,),
                          
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.grey,
                  //                           borderRadius: BorderRadius.circular(10),
                  //                         ),
                  //                         child: const Center(
                  //                           child: Padding(
                  //                             padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                  //                             child: Text("생명력", style: TextStyle(color: Colors.white),))),
                  //                       ),
                          
                  //                       const SizedBox(width: 10,),
                          
                  //                       Text(profile_data["Stats"][6]["Value"], style: const TextStyle(color: Colors.grey)),
                  //                     ],
                  //                   ),

                  //                   const SizedBox(height: 25,)

                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // );

                  var profile_data = snapshot.data;
          
                  return profile_data == "none" ?
                  
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("검색한 캐릭터가 존재하지않습니다", style: TextStyle(color: Colors.white, fontSize: 18),)),
                  )

                  :

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                          Container(
                            child: CachedNetworkImage(
                              imageUrl: profile_data["characters_data"][0].characters_img,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text(" 칭호  ", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_title, style: const TextStyle(color: Color(0xFFFF9436))),
                                          ],
                                        ),

                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text("닉네임", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_nickname, style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),

                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text("서버명", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].server_name, style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),

                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text("클래스", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_class_name, style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),


                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text(" 레벨  ", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_item_level, style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),


                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text("길드명", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_guild_name, style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ],
                                    ),



                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text(" 치명  ", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_stats[0]["Value"], style: const TextStyle(color: Color(0xFFFF9436))),
                                          ],
                                        ),

                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text(" 특화  ", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_stats[1]["Value"], style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),

                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text(" 신속  ", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_stats[3]["Value"], style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),

                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text("공격력", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_stats[7]["Value"], style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),


                                        const SizedBox(height: 10,),
                              
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                  child: Text("생명력", style: TextStyle(color: Colors.white),))),
                                            ),
                              
                                            const SizedBox(width: 10,),
                              
                                            Text(profile_data["characters_data"][0].characters_stats[6]["Value"], style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),

                                        const SizedBox(height: 25,)

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                          
                                    Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: profile_data["equipment_data"][0].equipment_img,                       
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                          
                                        const SizedBox(width: 10,),
                          
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(profile_data["equipment_data"][0].equipment_name, style: const TextStyle(color: Colors.grey, fontSize: 18)),

                                            const SizedBox(height: 5,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: characters_provider.res_Quality_Color(profile_data["equipment_data"][0].equipment_quality),
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Center(child: Text(profile_data["equipment_data"][0].equipment_quality.toString(), style: const TextStyle(color: Colors.white, fontSize: 15))))),

                                                const SizedBox(width: 5,),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Text(profile_data["equipment_data"][0].equipment_level, style: const TextStyle(color: Colors.grey, fontSize: 15)))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10,),


                                    Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: profile_data["equipment_data"][1].equipment_img,                       
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                          
                                        const SizedBox(width: 10,),
                          
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(profile_data["equipment_data"][1].equipment_name, style: const TextStyle(color: Colors.grey, fontSize: 18)),

                                            const SizedBox(height: 5,), 

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: characters_provider.res_Quality_Color(profile_data["equipment_data"][1].equipment_quality),
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Center(child: Text(profile_data["equipment_data"][1].equipment_quality.toString(), style: const TextStyle(color: Colors.white, fontSize: 15,),)))),

                                                const SizedBox(width: 5,),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Text(profile_data["equipment_data"][1].equipment_level, style: const TextStyle(color: Colors.grey, fontSize: 15)))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),


                                    const SizedBox(height: 10,),


                                    Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: profile_data["equipment_data"][5].equipment_img,                       
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                          
                                        const SizedBox(width: 10,),
                          
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(profile_data["equipment_data"][5].equipment_name, style: const TextStyle(color: Colors.grey, fontSize: 18)),

                                            const SizedBox(height: 5,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: characters_provider.res_Quality_Color(profile_data["equipment_data"][5].equipment_quality),
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Center(child: Text(profile_data["equipment_data"][5].equipment_quality.toString(), style: const TextStyle(color: Colors.white, fontSize: 15))))),

                                                const SizedBox(width: 5,),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Text(profile_data["equipment_data"][5].equipment_level, style: const TextStyle(color: Colors.grey, fontSize: 15)))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10,),


                                    Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: profile_data["equipment_data"][2].equipment_img,                       
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                          
                                        const SizedBox(width: 10,),
                          
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(profile_data["equipment_data"][2].equipment_name, style: const TextStyle(color: Colors.grey, fontSize: 18)),

                                            const SizedBox(height: 5,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: characters_provider.res_Quality_Color(profile_data["equipment_data"][2].equipment_quality),
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Center(child: Text(profile_data["equipment_data"][2].equipment_quality.toString(), style: const TextStyle(color: Colors.white, fontSize: 15))))),

                                                const SizedBox(width: 5,),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Text(profile_data["equipment_data"][2].equipment_level, style: const TextStyle(color: Colors.grey, fontSize: 15)))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10,),


                                    Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: profile_data["equipment_data"][3].equipment_img,                       
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                          
                                        const SizedBox(width: 10,),
                          
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(profile_data["equipment_data"][3].equipment_name, style: const TextStyle(color: Colors.grey, fontSize: 18)),

                                            const SizedBox(height: 5,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: characters_provider.res_Quality_Color(profile_data["equipment_data"][3].equipment_quality),
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Center(child: Text(profile_data["equipment_data"][3].equipment_quality.toString(), style: const TextStyle(color: Colors.white, fontSize: 15))))),


                                                const SizedBox(width: 5,),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Text(profile_data["equipment_data"][3].equipment_level, style: const TextStyle(color: Colors.grey, fontSize: 15)))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10,),


                                    Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: profile_data["equipment_data"][4].equipment_img,                       
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                          
                                        const SizedBox(width: 10,),
                          
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(profile_data["equipment_data"][4].equipment_name, style: const TextStyle(color: Colors.grey, fontSize: 18)),

                                            const SizedBox(height: 5,),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: characters_provider.res_Quality_Color(profile_data["equipment_data"][4].equipment_quality),
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Center(child: Text(profile_data["equipment_data"][4].equipment_quality.toString(), style: const TextStyle(color: Colors.white, fontSize: 15))))),

                                                const SizedBox(width: 5,),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                    child: Text(profile_data["equipment_data"][4].equipment_level, style: const TextStyle(color: Colors.grey, fontSize: 15)))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                 ],
                                ),
                              ]
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: profile_data["card"][0].card_image,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: characters_provider.card_Awake_Count(profile_data["card"][0].card_awake_count),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 100,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: profile_data["card"][1].card_image,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: characters_provider.card_Awake_Count(profile_data["card"][1].card_awake_count),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 100,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: profile_data["card"][2].card_image,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: characters_provider.card_Awake_Count(profile_data["card"][2].card_awake_count),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: profile_data["card"][3].card_image,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: characters_provider.card_Awake_Count(profile_data["card"][3].card_awake_count),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 100,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: profile_data["card"][4].card_image,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: characters_provider.card_Awake_Count(profile_data["card"][4].card_awake_count),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 100,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: profile_data["card"][5].card_image,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: characters_provider.card_Awake_Count(profile_data["card"][5].card_awake_count),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),
          )
        ],
      ),
    );
  }
}
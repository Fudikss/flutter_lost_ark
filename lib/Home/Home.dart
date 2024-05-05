import 'package:lost_ark_flutter/Characters/Characters_Profile.dart';
import 'package:lost_ark_flutter/Util/Import_Package.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController();

  TextEditingController nick_name_controller = TextEditingController();

  HomeProvider home_provider = HomeProvider();


  final List<String> legion_raid = [
    'assets/GIF/Valtan.gif',
    'assets/GIF/Biackiss.gif',
  ];

  int _currentIndex = 0;

    @override
  void initState() {
    super.initState();
    // Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   if (pageController.hasClients) {
    //     int nextPage = pageController.page!.toInt() + 1;
    //     if (nextPage == legion_raid.length) {
    //       nextPage = 0;
    //     }
    //     pageController.animateToPage(
    //       nextPage,
    //       duration: Duration(milliseconds: 400),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    pageController.dispose();

    home_provider.dispose();

    nick_name_controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    home_provider = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: InkWell(
          onTap: () async{

            var dio = Dio();

            var response = await dio.post("http://${ServerInfo().server_url}/characters/get_characters_card/:data", data:{
              "nick_name" : "동태양",
            });


          },
          child: Image.asset('assets/PNG/Lost_Ark_logo.png', width: 100,)),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  FutureBuilder(
                    // future: home_provider.get_Lost_Ark_Events(), 
                    future : null,
                    builder: (context, AsyncSnapshot snapshot){
                      if(snapshot.hasError){

                        return Container(
                          color: Colors.red,
                        );
                        
                      }else if(snapshot.connectionState == ConnectionState.waiting){

                        return Text("데이터 가져오는 중");

                      }else{

                        return Container();

                        // var event_data = snapshot.data;

                        // List<String> event_img = [];
                        
                        // for(Map event_map_data in event_data){

                        //   event_img.add(event_map_data["Thumbnail"]);

                        // }

                        // return CarouselSlider.builder(
                        //     itemCount: event_img.length,
                        //     itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        //       return InkWell(
                        //         onTap: () async{

                        //             final  url = Uri.parse(event_data[itemIndex]["Link"]);

                        //             if(await canLaunchUrl(url)){
                        //               await launchUrl(url, webViewConfiguration: const WebViewConfiguration(
                        //                 enableDomStorage: false,
                        //                 enableJavaScript: true
                        //               ));
                        //             }

                        //         },
                        //         child: Container(
                        //           child: CachedNetworkImage(
                        //             imageUrl: event_img[itemIndex],
                        //             fit: BoxFit.fill,
                        //             placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        //             errorWidget: (context, url, error) => Icon(Icons.error),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     options: CarouselOptions(
                        //       autoPlay: true,
                              
                        //       enlargeCenterPage: false,
                        //       viewportFraction: 1.0,
                        //       aspectRatio: 2.0,
                        //       onPageChanged: (index, reason) {
                        //         // setState(() {
                        //         //   _currentIndex = index;
                        //         // });
                        //       }
                        //     ),
                        //   );
                      }
                    })
                ],
              ),
            ),
          ),


          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                  future: home_provider.get_Lost_Ark_Notice(),
                  builder: (context, AsyncSnapshot snapshot){
                    if(snapshot.hasError){
                      return Container();
                    }else if(snapshot.connectionState == ConnectionState.waiting){
                      return Container();
                    }else{

                      var notice_data = snapshot.data;



                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            GestureDetector(
                              onTap: () async{

                                final  url = Uri.parse(notice_data[0].news_link);

                                if(await canLaunchUrl(url)){
                                  await launchUrl(url, webViewConfiguration: const WebViewConfiguration(
                                    enableDomStorage: false,
                                    enableJavaScript: true
                                  ));
                                }

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Colors.grey),
                                      color: Colors.grey
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                                      child: Center(
                                        child: Text(notice_data[0].news_type),
                                      ),
                                    ),
                                  ),
                            
                                  const SizedBox(width: 5,),
                            
                                  Text(notice_data[0].news_title, style: const TextStyle(fontSize: 15, color: Colors.grey),),
                            
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Divider(height: 2, color: Colors.grey,),),


                            GestureDetector(
                              onTap: () async{

                                final  url = Uri.parse(notice_data[1].news_link);

                                if(await canLaunchUrl(url)){
                                  await launchUrl(url, webViewConfiguration: const WebViewConfiguration(
                                    enableDomStorage: false,
                                    enableJavaScript: true
                                  ));
                                }

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Colors.grey),
                                      color: Colors.grey
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                                      child: Center(
                                        child: Text(notice_data[1].news_type),
                                      ),
                                    ),
                                  ),
                            
                                  const SizedBox(width: 5,),
                            
                                  Text(notice_data[1].news_title, style: const TextStyle(fontSize: 15, color: Colors.grey),),
                            
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Divider(height: 2, color: Colors.grey,),),

                            
                            GestureDetector(
                              onTap: () async{

                                final  url = Uri.parse(notice_data[2].news_link);

                                if(await canLaunchUrl(url)){
                                  await launchUrl(url, webViewConfiguration: const WebViewConfiguration(
                                    enableDomStorage: false,
                                    enableJavaScript: true
                                  ));
                                }

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Colors.grey),
                                      color: Colors.grey
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                                      child: Center(
                                        child: Text(notice_data[2].news_type),
                                      ),
                                    ),
                                  ),
                            
                                  const SizedBox(width: 5,),
                            
                                  Text(notice_data[2].news_title, style: const TextStyle(fontSize: 15, color: Colors.grey),),
                            
                                ],
                              ),
                            ),
                          ],
                        ),  
                      );
                    }
                  },
                ),
              ),
            ),
          ),


          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            sliver: SliverToBoxAdapter(
              child: SearchBar(
                controller: nick_name_controller,
                hintText: "검색하려는 캐릭터명을 입력해주세요",
                backgroundColor: const MaterialStatePropertyAll(Colors.greenAccent),
                shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))),
                constraints: const BoxConstraints(maxHeight: 150),
                trailing: [
                  IconButton(onPressed: () async{

                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return CharactersProfile(prev_nick_name: nick_name_controller.text,);
                    }));
                  }, icon: const Icon(Icons.search)),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
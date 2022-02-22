import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';
import 'package:hostelfinder/hostlefinder/view/home/widget/MapUiPage.dart';

import '../../../select.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: const [
          MapUiBody(),
        ],
      );
    }
}

class HomeRecordView extends GetView<HomeController>{


   HomeRecordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getdata();
    drawer(){
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/Icon.png'),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/Icon.png'),
                )
              ],
              accountEmail: const Text('dev.yakkuza@gmail.com'),
              accountName: const Text('Dev Yakuza'),
              onDetailsPressed: () {
                // ignore: avoid_print
                print('press details');
              },
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            ListTile(
                title: const Text('HomePage'),
                onTap: () {
                  // ignore: avoid_print
                  print("homepage click");
                   Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
                }
            ),
            ListTile(
              title: const Text('Go to User Screen'),
              onTap: () {
                MaterialPageRoute(
                  builder: (BuildContext context) =>  PromptScreen(),
                );
                SystemNavigator.pop();
              },
            ),
            ListTile(
              title: const Text('Exit'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      );
    }
    body(){
      Size size = Get.size;
      return Scaffold(
        backgroundColor: AppColors.white.withOpacity(0.95),
        body: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.topCenter,
            child:
           FutureBuilder(
              future: controller.future(),
              builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.main),
                      ),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.data!.exists) {
                      if (snapshot.data?.value != null) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                SearchInput(),
                                const SizedBox(width: 4,),
                                Expanded(
                                  child:MapButton(
                                      title: "Map",
                                      icon: Icons.map_outlined,
                                      bgColor: Colors.blueGrey,
                                      onTap: () {
//                                    showMapDialog(context),

                                      }
                                  ),
                                ),
                                //   SizedBox(width: 4,),
                                //                             Spacer()
                              ],
                            ),
                            //const
                            Expanded(
                              child: Obx(
                                    () => ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: controller.records.length,
                                        padding:
                                        EdgeInsets.only(top: size.height * 0.01),
                                        itemBuilder: (BuildContext context, int index) {
                                          return HostelViewCard(
                                            model: controller.records[index],index: index,
                                          );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const NoDataWidget();
                      }
                    }
                    else {
                      return const NoDataWidget();
                    }
                }
              },
            )
          ),
        ),
        drawer: drawer(),
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: AppColors.main,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            AppSettings.name,
            style: GoogleFonts.asar(
              color: AppColors.white,
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color(0xFF51F6B1),
        //
        //   onPressed:(){
        //     print("Ask pressed");
        //   },
        //   tooltip: '',
        //   // child: Text("ASK"),
        //   child:  Container(
        //     width: 70,
        //     height: 70,
        //     child: Center(
        //       child:
        //       InkWell(
        //         child: Icon(Icons.location_city,
        //             color: Colors.white70,
        //             size: 30),
        //         onTap: () async {
        //           print('go to google map');
        //           showMapDialog(context);
        //          // Get.offAllNamed(AppRoutes.map);
        //           // Navigator.push(
        //           //   context,
        //           //   MaterialPageRoute(
        //           //     //     builder: (context)  => FindDistance(
        //           //     //         distanceMatrix:  dis() as DistanceMatrix,
        //           //     // ),
        //           //     //  builder: (context) => MapScreen()),
        //           //       builder: (context) => MapUiPage()),
        //           //   //builder: (context) => MapScreenWithSearch()),
        //           // );
        //         },
        //       ),
        //     ),
        //     decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         gradient: LinearGradient(colors: [Color(0xFF5AE8B0), Color(0xFF51F6B1)])
        //     ),
        //   ),
        // ),
      );
    }
    return body();
  }
  getdata()async{
    await HomeController().future();
  }
}
import 'package:get/get.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';
import 'package:hostelfinder/hostlefinder/view/home/widget/MapUiPage.dart';
import 'package:hostelfinder/hostlefinder/view/home/widget/single_hostle_card.dart';


class SingleView extends GetView<HomeController>{
  String? ownerNAme;
  String? city;
  String? contact;
  double? latitude;
  double? longitude;
  String? seatavilable;
  String? seatrent;
  String? bedsperroom;
  String? facilities;
  String? tag;
  String? hostelname;

  SingleView(this.ownerNAme, this.city, this.contact, this.latitude, this.longitude, this.seatavilable,
      this.seatrent, this.bedsperroom, this.facilities, this.tag, this.hostelname, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    drawer(){
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   child: Text('Drawer Header'),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
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
              title: const Text('Item 2'),
              onTap: () {
                //Navigator.pop(context);
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
                Column(
                  children: <Widget>[
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
                    SignleHostelViewCard(hostelname: hostelname!, facilities: facilities!, longitude: longitude!, bedsperroom:bedsperroom!,
                      tag: tag!, latitude: latitude, seatrent: seatrent, seatavilable: seatavilable, contact: contact,
                      ownerNAme:ownerNAme, city: city,),
                  ],
                ),
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
      );
    }
    return body();
  }
}
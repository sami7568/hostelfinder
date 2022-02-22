import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Manage Hostel Details"),
        actions: [
          IconButton(
            onPressed: () async {
              await StorageServices().logout();
              Get.offAllNamed(AppRoutes.login);
            },
            icon: const Icon(Icons.login_outlined),
            iconSize: size.height * 0.0325,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          child: Obx(
            () => controller.isRequsted.value
                ? controller.record.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.record.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HostelViewCard(
                              model: controller.record[index]);
                        },
                      )
                    : const Center(
                        child: Text("No record found"),
                      )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.clear();
          Get.toNamed(AppRoutes.addHostel);
        },
        label: const Text("Add Hostel"),
        icon: const Icon(Icons.location_city_outlined),
        backgroundColor: AppColors.main,
        elevation: 2.0,
        highlightElevation: 2.0,
      ),
    );
  }
}

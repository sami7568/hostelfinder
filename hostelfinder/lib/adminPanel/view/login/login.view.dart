import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    Size size = Get.size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Login Account"),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   "Account Access!",
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.openSans(
                //     fontWeight: FontWeight.w600,
                //     fontSize: size.height * 0.032,
                //     color: AppColors.black.withOpacity(0.65),
                //   ),
                // ),
                SizedBox(height: size.height * 0.045),
                CustomInput(
                  label: "Phone No",
                  hint: "Enter Phone Number",
                  controller: controller.phone,
                  icon: Icons.phone_android_outlined,
                  keyboard: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.02),
                CustomInputForPassword(
                  label: "Password",
                  hint: "Enter Password",
                  icon: Icons.lock_outline,
                  controller: controller.pass,

                    keyboard: TextInputType.visiblePassword,
                  maxLines: 1,

                ),
                SizedBox(height: size.height * 0.045),
                CustomButton(
                  title: "Login Account",
                  onTap: () => controller.login(),
                ),
                SizedBox(height: size.height * 0.045),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.signup),
                  child: Text(
                    "Don't have an account? Create one",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.018,
                      color: AppColors.black.withOpacity(0.65),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

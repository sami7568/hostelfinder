import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Create Account"),
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
                //   "Get Access!",
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
                CustomInput(
                  label: "Password",
                  hint: "Enter Password",
                  icon: Icons.lock_outline,
                  controller: controller.pass,
                ),
                SizedBox(height: size.height * 0.045),
                CustomButton(
                  title: "Create Account",
                  onTap: () => controller.signup(),
                ),
                SizedBox(height: size.height * 0.045),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    "Already have an account? login now",
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

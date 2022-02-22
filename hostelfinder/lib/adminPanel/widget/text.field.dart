import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:get/get.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final int? maxLines;
  final TextInputType? keyboard;

  final TextEditingController controller;
  const CustomInput({
    Key? key,
    required this.hint,
    required this.label,
    required this.controller,
    required this.icon,

    this.keyboard,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return SizedBox(
      width: size.width,
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboard ?? TextInputType.name,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(color: AppColors.black),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(icon),
          suffixIcon: const SizedBox.shrink(),
          hintText: hint,
          labelText: label,
          border: _border(),
          errorBorder: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
          disabledBorder: _border(),
          focusedErrorBorder: _border(),
        ),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Get.size.height * 0.01),
      borderSide: BorderSide(color: AppColors.black.withOpacity(0.6)),
    );
  }
}
class CustomCheckBox extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final int? maxLines;
  final TextInputType? keyboard;

  final TextEditingController controller;
  CustomCheckBox({
    Key? key,
    required this.hint,
    required this.label,
    required this.controller,
    required this.icon,

    this.keyboard,
    this.maxLines,
  }) : super(key: key);
  Map<String, bool> List = {
    'Wifi' : false,
    'Bath' : false,
    'Ups' : false,
    'Laundry' : false,
  };

  var holder_1 = [];

  getItems(){
    List.forEach((key, value) {
      if(value == true)
      {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Column (children: <Widget>[

      RaisedButton(
        child: Text(" $label "),
        onPressed: getItems,
        color: Colors.pink,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),

      Expanded(
        child :
        ListView(
          children: List.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: List[key],
              activeColor: Colors.deepPurple[400],
              checkColor: Colors.white,
              onChanged: (val) {

               // setState(() {
                  List[key] = val!;
               // });
              },
              // onChanged: (bool value) {
              //   setState(() {
              //     List[key] = value;
              //   });
              // },
            );
          }).toList(),
        ),
      ),]);
      // TextField(
      //   maxLines: maxLines,
      //   controller: controller,
      //   keyboardType: keyboard ?? TextInputType.name,
      //   textInputAction: TextInputAction.done,
      //   textAlign: TextAlign.center,
      //   style: GoogleFonts.openSans(color: AppColors.black),
      //   cursorColor: AppColors.black,
      //   decoration: InputDecoration(
      //     floatingLabelBehavior: FloatingLabelBehavior.always,
      //     prefixIcon: Icon(icon),
      //     suffixIcon: const SizedBox.shrink(),
      //     hintText: hint,
      //     labelText: label,
      //     border: _border(),
      //     errorBorder: _border(),
      //     enabledBorder: _border(),
      //     focusedBorder: _border(),
      //     disabledBorder: _border(),
      //     focusedErrorBorder: _border(),
      //   ),
      // ),

  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Get.size.height * 0.01),
      borderSide: BorderSide(color: AppColors.black.withOpacity(0.6)),
    );
  }
}
class CustomInputForPassword extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final int? maxLines;
  final TextInputType? keyboard;

  final TextEditingController controller;
  const CustomInputForPassword({
    Key? key,
    required this.hint,
    required this.label,
    required this.controller,
    required this.icon,

    this.keyboard,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return SizedBox(
      width: size.width,
      child: TextField(
        obscureText: true,
        maxLines: maxLines,
        obscuringCharacter: "*",
        controller: controller,
        keyboardType: keyboard ?? TextInputType.name,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(color: AppColors.black),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(icon),

          suffixIcon: const SizedBox.shrink(),
          hintText: hint,
          labelText: label,
          border: _border(),
          errorBorder: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
          disabledBorder: _border(),
          focusedErrorBorder: _border(),
        ),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Get.size.height * 0.01),
      borderSide: BorderSide(color: AppColors.black.withOpacity(0.6)),
    );
  }
}

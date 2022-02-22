// ignore: file_names
import 'package:hostelfinder/adminPanel/meta/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/horizontal_scrollbar.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';


class App{
  static List<String> value = [];
}
class CustomCheckboxWidget extends StatefulWidget {
   TextEditingController controller;
   final bool isUpdate;

   CustomCheckboxWidget({ required this.controller, required this.isUpdate});
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState(controller: controller,isUpdate: isUpdate);
}

class CheckboxWidgetState extends State<CustomCheckboxWidget> {
  final TextEditingController controller;
   bool isUpdate;

  CheckboxWidgetState({ required this.controller, required this.isUpdate});

  // Map<String, bool> values = {
  //   'Apple': false,
  //   'Banana': false,
  //   'Cherry': false,
  //   'Mango': false,
  //   'Orange': false,
  // };


 // List<Facality> facalitiesDropdownValue =  <Facality>[];
  List<Facality> industryDropdownValue =  <Facality>[];

   List<Facality> _facalities = <Facality>[] ;
   List<Facality> item = [
     Facality(id: 1, name: "Wi-fi"),
     Facality(id: 2, name: "Bath"),
     Facality(id: 3, name: "Ups"),
     Facality(id: 4, name: "Laundry"),
     Facality(id: 5, name: "Generator"),
     Facality(id: 6, name: "Meals"),
     Facality(id: 7, name: "Hot water"),
     Facality(id: 8, name: "Room Cleaning"),
     Facality(id: 9, name: "Gas in Rooms"),
     Facality(id: 10, name: "Kitchen with rooms"),];

   List<Facality> _facalities2 = <Facality>[] ;


@override
  void initState() {
    // TODO: implement initState
  print(controller.text);
  print(isUpdate);
  setState(() {

 // _facalities = isUpdate ? getValues()
 //     :  <Facality>[];

  });
  print(getValues().map((e) => e.name));
  print(getValues().map((e) => e.id));

  // if (isUpdate){
  //   setState(() {
  //   //  initialValue = [Facality(id: 1, name: "usama")];
  //   });
  // }else{}



  }
  List<Facality> getValues(){
  return [Facality(id: 1, name: "usama")];
  }
  @override
  Widget build(BuildContext context) {
    var _items = item.map((facality) => MultiSelectItem<Facality>(facality, facality.name)).toList();
    Size size = Get.size;

    return    Padding(
      padding: EdgeInsets.only(
          left: 0, top: 0, right: 0, bottom: 0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      Container(
      height: 120,
        width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        //color: Color(0xFFEBEBEB),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: AppColors.black.withOpacity(0.6),
          width: 1,
        ),
      ),
      child: MultiSelectDialogField(
        items: _items,
        //  initialValue: isUpdate ? getValues() : _facalities2,
        title:Container(
          height: 22,
          child: Text("Facilities",textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),),
        ),
        selectedColor: Colors.grey,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
        ),

        buttonIcon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        chipDisplay: MultiSelectChipDisplay(
          scrollBar: HorizontalScrollBar(isAlwaysShown: true),
          chipColor: Colors.grey.withOpacity(0.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          scroll: true,
          height: 44,
          textStyle: TextStyle(
            color: Colors.grey[800],
            fontSize: 11,
          ),
        ),
        buttonText: Text(
          "Facalities",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 11,
            fontFamily: 'Calibri',
            fontWeight: FontWeight.bold,
            color: Color(0xFF707070),
          ),
        ),
        onConfirm: ( values) {
          print(values.isEmpty);
          if (values.isEmpty) {
            industryDropdownValue.removeLast();
          } else {
            // setState(() {
            //   var mm = (values as List).map((e) => (e));
            //   print(mm);
            //
            //   mm.forEach((val) {
            //     // _selectedAnimals3.add(val);
            //    // var aa = val as Facality;
            //    //  print(aa.name);
            //    //  print(aa.id);
            //     industryDropdownValue.add(val);
            //   });
            //   print(industryDropdownValue.map((e) => e.id));
            //   print(industryDropdownValue.map((e) => e.name));
            //   App.value =  industryDropdownValue.map((e) => e.name).toList();
            //   controller.text = industryDropdownValue.map((e) => e.name).join(', ');
            //   // _selectedAnimals3 = [];
            //   // branchDropdownValue = [];
            //   //print("un selected $_selectedAnimals3");
            // });

            setState(() {
              var mm = (values as List).map((e) => (e));
              mm.forEach((val) {
                print(val);
                industryDropdownValue.add(val);
              });
              industryDropdownValue.toSet().toList();
              //facalitiesDropdownValue.toSet().toList();
              print("add");
              print( industryDropdownValue.toSet().toList());
              industryDropdownValue.toSet().toList();
              controller.text = industryDropdownValue.map((e) => e.name).join(', ');
            });
          }
        },
      ),
    ),]));
  }
}


class Facality {
  final int id;
  final String name;

  Facality({
    required this.id,
    required this.name,
  });
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/doctorsScreen/widget/doctor_cell_widget.dart';
import 'package:privilegecare/Ui/favorite/controller/favorite_doctors_controller.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/no_data_widget.dart';

class FavouriteDoctorsTap extends StatelessWidget {
  const FavouriteDoctorsTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<FavoriteDoctorsController>(
      init: FavoriteDoctorsController(),
      builder: (controller) => controller.isLoading?const Loader():controller.hasNoData?NoDataWidget(refreshedFunc: (){
        controller.getData();
      }, text: noDocFavData.tr, imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: true,height: Get.height*0.7,):SingleChildScrollView(
          child: Column(
            children: controller.doctorsData!.map((e){
              return DoctorCellWidget(doctorData: e, addingToFavorite: () {
              controller.addingOrRemovingFromFavorite("${e.id}", context, "${e.name}",e);
              },);
            }).toList(),
          )),
    );
  }
}

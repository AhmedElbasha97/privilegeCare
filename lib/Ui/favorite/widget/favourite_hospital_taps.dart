import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/favorite/controller/favorite_hospital_controlle.dart';
import 'package:privilegecare/Ui/hospital%20screen/widget/hospital_cell_widget.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:privilegecare/widgets/no_data_widget.dart';

class FavouriteHospitalTap extends StatelessWidget {
  const FavouriteHospitalTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<FavoriteHospitalController>(
      init: FavoriteHospitalController(),
      builder: (controller) => controller.isLoading?const Loader():controller.hasNoData?NoDataWidget(refreshedFunc: (){
        controller.getData();
      }, text: noHospFavData.tr, imgPath: "assets/images/No data-rafiki.png", hasRefreshButtonOrNot: true,height: Get.height*0.7,):SingleChildScrollView(
          child: Column(
            children: controller.hospitalsData!.map((e){
              return HospitalCellWidget(hospitalData: e, addOrRemoveFromFavorite: () {
                controller.addingOrRemovingFromFavorite("${e.id}", context, "${e.name}",e);
              },  );
            }).toList(),
          )),
    );
  }
}

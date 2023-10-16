import 'package:get/get.dart';
import 'package:privilegecare/Models/specialty_model.dart';
import 'package:privilegecare/Services/specialist_services.dart';

class SpecialtyController extends GetxController{
  bool isLoading = true;
  List<SpecialistModel>? specialtyListData = [];
  List<SpecialistModel>? mostChosenSpecialtyListData = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<SpecialtyController>();
  }
  getData() async{
    specialtyListData = await SpecialistServices.getAllSpecialist();
    mostChosenSpecialtyListData = await SpecialistServices.getMostChosenSpecialist();
    isLoading = false;
    update();
  }
}

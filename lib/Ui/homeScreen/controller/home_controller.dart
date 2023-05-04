import 'package:get/get.dart';
import 'package:privilegecare/Models/specialty_model.dart';
import 'package:privilegecare/Services/specialist_services.dart';

class HomeController extends GetxController{
  bool isLoading = true;
  List<SpecialistModel>? specialtyData = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  getData() async{
    specialtyData = await SpecialistServices.getAllSpecialist();
    isLoading = false;
    update();
  }
}

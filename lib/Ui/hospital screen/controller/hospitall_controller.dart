import 'package:get/get.dart';
import 'package:privilegecare/Models/specialty_model.dart';
import 'package:privilegecare/Services/specialist_services.dart';

class HospitalController extends GetxController{
  bool isLoading = true;
  List<SpecialistModel>? specialtyListData = [];
 int selectedIndex = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  getData() async{
    specialtyListData = await SpecialistServices.getAllSpecialist();
    isLoading = false;
    update();
  }
  selectingTag(int index){
    selectedIndex = index;
    update();
  }
}
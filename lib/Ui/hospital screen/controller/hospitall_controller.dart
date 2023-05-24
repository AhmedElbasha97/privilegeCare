import 'package:get/get.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Models/specialty_model.dart';
import 'package:privilegecare/Services/hospital_services.dart';
import 'package:privilegecare/Services/specialist_services.dart';

class HospitalController extends GetxController{
  bool isLoading = true;
  List<SpecialistModel>? specialtyListData = [];
  List<HospitalListModel>? hospitalListData = [];
 int selectedIndex = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  getData() async{
    specialtyListData = await SpecialistServices.getAllSpecialist();
    hospitalListData = await HospitalServices.getHospitalList();

    isLoading = false;
    update();
  }
  selectingTag(int index){
    selectedIndex = index;
    update();
  }
}
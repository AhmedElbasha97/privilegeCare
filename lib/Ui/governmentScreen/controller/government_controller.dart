import 'package:get/get.dart';
import 'package:privilegecare/Models/government_model.dart';
import 'package:privilegecare/Services/government_services.dart';

class GovernmentController extends GetxController{

bool isLoading = true;
List<GovernmentModel>? governmentData = [];
@override
void onInit() {
  // TODO: implement onInit
  super.onInit();
  getData();
}
getData() async{
  governmentData = await GovernmentServices.getGovernments();
  isLoading = false;
  update();
}
}
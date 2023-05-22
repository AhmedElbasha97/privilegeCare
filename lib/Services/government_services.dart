import 'package:privilegecare/Models/government_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class GovernmentServices {
  static ApiService api = ApiService();
  static Future<List<GovernmentModel>?> getGovernments() async {
    List<GovernmentModel>? governmentsList = [];
    var data = await api.request(Services.getGovernmentsEndPoint, "POST",);
    if (data != null) {
      for (var government in data){
        governmentsList.add(GovernmentModel.fromJson(government));
      }
      return governmentsList;
    }
    return null;
  }
}
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class ReservationServices {
  static ApiService api = ApiService();
  static Future<ResponseModel?> saveAppointment(String scheduleId,String memberId, String phoneNumber, String time,String name,String insuranceName,String reservationOtherPatient,String email) async {
    var data = await api.request(Services.saveAppointmentEndPoint, "POST",queryParamters: {
      "schedule_id":scheduleId,
      "member_id":memberId,
      "phone":phoneNumber,
      "time":time,
      "name": name,
      "insurance":insuranceName,
      "other_patient":reservationOtherPatient,

    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }


}
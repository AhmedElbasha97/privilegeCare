import 'package:privilegecare/Models/comment_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class ReviewingServices{
  static ApiService api = ApiService();
  static Future<List<CommentModel>?> getDoctorsInThisSpecialist(String doctorId) async {
    List<CommentModel>? commentsList = [];
    var data = await api.request(Services.commentsDoctorsProfileEndPoint, "POST",queryParamters: {
      "doctor_id":doctorId,
    });
    if (data != null) {
      for (var comment in data){
        commentsList.add(CommentModel.fromJson(comment));
      }
      return commentsList;
    }
    return null;
  }
  static Future<ResponseModel?> addReviewToDoctor(String appointmentId,String memberId, String review) async {
    var data = await api.request(Services.addReviewToDoctor, "POST",queryParamters: {
      "appointment_id":appointmentId,
      "member_id":memberId,
      "review":review,
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }

}
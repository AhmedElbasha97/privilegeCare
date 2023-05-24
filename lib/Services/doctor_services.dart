import 'package:privilegecare/Models/doctor_home_model.dart';
import 'package:privilegecare/Models/doctor_model.dart';
import 'package:privilegecare/Models/doctor_reservation_model.dart';
import 'package:privilegecare/Models/doctort_list_model.dart';

import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class DoctorServices {
  static ApiService api = ApiService();
  static Future<List<DoctorListModel>?> getDoctorsInThisSpecialist(String specialistId) async {
    List<DoctorListModel>? doctorsList = [];
    var data = await api.request(Services.doctorsSpecialistEndPoint, "POST",queryParamters: {
      "specialist_id":specialistId,
    });
    if (data != null) {
      for (var doctor in data){
        doctorsList.add(DoctorListModel.fromJson(doctor));
      }
      return doctorsList;
    }
    return null;
  }
  static Future<List<DoctorListModel>?> getDoctorsInThisFavoriteList(String memberId) async {
    List<DoctorListModel>? doctorsList = [];
    var data = await api.request(Services.doctorsFavoriteListEndPoint, "POST",queryParamters: {
      "member_id":memberId,
    });
    if (data != null) {
      for (var doctor in data){
        doctorsList.add(DoctorListModel.fromJson(doctor));
      }
      return doctorsList;
    }
    return null;
  }
  static Future<List<DoctorListModel>?> searchForDoctors(String doctorName,String specialtyId) async {
    List<DoctorListModel>? doctorsList = [];
    var data = await api.request(Services.searchForDoctorsEndPoint, "POST",queryParamters: {
      "name":doctorName,
      "spec":specialtyId,

    });
    if (data != null) {
      for (var doctor in data){
        doctorsList.add(DoctorListModel.fromJson(doctor));
      }
      return doctorsList;
    }
    return null;
  }
  static Future<List<DoctorListModel>?> searchForDoctorsWithArea(String doctorName,String specialtyId,String areaId) async {
    List<DoctorListModel>? doctorsList = [];
    var data = await api.request(Services.searchForDoctorsEndPoint, "POST",queryParamters: {
      "name":doctorName,
      "spec":specialtyId,
      "area":areaId,
    });
    if (data != null) {
      for (var doctor in data){
        doctorsList.add(DoctorListModel.fromJson(doctor));
      }
      return doctorsList;
    }
    return null;
  }
  static Future<List<String>?> getAppointment(String scheduleId) async {
    List<String>? appointmentList = [];
    var data = await api.request(Services.appointmentListEndPoint, "POST",queryParamters: {
      "schedule_id":scheduleId,
    });
    if (data != null) {
      for (var appointment in data){
        appointmentList.add(appointment);
      }
      return appointmentList;
    }
    return null;
  }

  static Future<DoctorProfile?> getDoctorProfiles(String doctorId) async {
    var data = await api.request(Services.getDoctorProfileEndPoint, "POST",queryParamters: {
      "doctor_id":doctorId
    });
    if (data != null) {


      return DoctorProfile.fromJson(data[0]);
    }
    return null;
  }

  static Future<List<DoctorHomeModelData>?> getHomeDoctors() async {
    List<DoctorHomeModelData>? homeDoctorList = [];
    var data = await api.request(Services.homeDoctorsEndPoint, "POST");
    if (data != null) {
      for (var homeDoctor in data){
        homeDoctorList.add(DoctorHomeModelData.fromJson(homeDoctor));
      }
      return homeDoctorList;
    }
    return null;
  }

  static Future<DoctorReservationData?> getDoctorReservationData(String doctorId) async {
    var data = await api.request(Services.getDoctorReservationDataEndPoint, "POST",queryParamters: {
      "doctor_id":doctorId
    });
    if (data != null) {


      return DoctorReservationData.fromJson(data[0]);
    }
    return null;
  }

}
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/reservationScreen/controller/reservation_controller.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/text_field_widget.dart';

class ReservationToNonRegestierUserWidget extends StatelessWidget {
  final String doctorId;
  const ReservationToNonRegestierUserWidget({Key? key, required this.doctorId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: GetBuilder<ReservationController>(
        init:  ReservationController(doctorId),
        builder: ( controller) => SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,

            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 80,
                      child: CustomInputField(
                        hasIntialValue: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: controller.nameWidgetController,
                        onchange: controller.onNameUpdate,
                        validator: controller.validateName,
                        icon: (controller.nameValidated)
                            ? (controller.nameState)
                            ? const Icon(Icons.check_rounded,
                            color: kGreenColor)
                            : const Icon(
                          Icons.close_outlined,
                          color: kErrorColor,
                        )
                            : null,
                        labelText: "الاسم",

                        hasGreenBorder: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 80,
                      child: CustomInputField(
                        hasIntialValue: false,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneWidgetController,
                        onchange: controller.onPhoneNumberUpdate,
                        validator: controller.validatePhoneNumber,
                        icon: (controller.phoneValidated)
                            ? (controller.phoneState)
                            ? const Icon(Icons.check_rounded,
                            color: kGreenColor)
                            : const Icon(
                          Icons.close_outlined,
                          color: kErrorColor,
                        )
                            : null,
                        labelText: "رقم الجوال",

                        hasGreenBorder: true,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      if(!controller.reservationIsRunning) {
                        controller.sendPressedFromDialogue(context);
                      }else{
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.loading,
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: Get.width*0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: controller.reservationIsRunning?kGrayColor:kBlueColor
                      ),
                      child: const Center(
                        child:  Text("تأكيد الحجز",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily:fontFamilyName,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
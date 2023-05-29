import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalDetailedController extends GetxController{
bool isLoading = true;
int currentIndex = 0;
int currentActivePage = 0;
final ScrollController sController = ScrollController();
CarouselController cController = CarouselController();
selectingPage(int index){

  currentIndex = index;
  update();
}
selectPage(int index){
  cController.jumpToPage(index);
  update();
}
selectingCategory(int index){
  currentActivePage = index;
  update();
}
}
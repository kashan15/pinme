import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:pinme/modules/navigation_service.dart'
as my_nav_service;

class MainViewModel extends BaseViewModel{
  var navigationService = my_nav_service.NavigationService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  int locationTap = 0;
  int shareTap = 1;

  int gridSelection = 0;
}
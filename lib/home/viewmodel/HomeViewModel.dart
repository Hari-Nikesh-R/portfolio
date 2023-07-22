import 'package:flutter/material.dart';

import '../repository/HomeRepository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.homeRepo});
  String url = "https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg";
  final HomeRepository homeRepo;
  fetchData(){

  }

}
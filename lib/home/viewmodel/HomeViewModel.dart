import 'package:flutter/material.dart';

import '../../data/repository/HomeRepository.dart';


class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.homeRepo});
  final HomeRepository homeRepo;

  fetchData(){

  }

}
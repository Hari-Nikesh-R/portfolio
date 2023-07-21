import 'package:flutter/material.dart';

import '../../data/repository/home_repository.dart';


class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.homeRepo});
  final HomeRepository homeRepo;

  fetchData(){
    homeRepo.fetchData();
  }

}
import 'package:flutter/cupertino.dart';

import '../../data/repository/project_repository.dart';

class ProjectViewModel extends ChangeNotifier{
  ProjectViewModel({required this.projectRepo});
  final ProjectRepository projectRepo;

  fetchData(){
    projectRepo.fetchProjectData();
  }
}
import 'package:flutter/foundation.dart';
import 'package:portfolio_hari_nikesh_r/data/repository/blog_repository.dart';

class BlogViewModel extends ChangeNotifier{
   BlogViewModel({required this.blogRepository});
   final BlogRepository blogRepository;

}
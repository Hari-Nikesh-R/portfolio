import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/HomeViewModel.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  late HomeViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<HomeViewModel>(context, listen:true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

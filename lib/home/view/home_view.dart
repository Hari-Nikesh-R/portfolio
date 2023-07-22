import 'package:dlwidgets/dlwidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_viewmodel.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  late HomeViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = Provider.of<HomeViewModel>(context, listen:true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(child: SizedBox(
            height:400,
            width:MediaQuery.of(context).size.width/1.1,
            child:
        DlCardView(
            child: DecoratedBox(decoration: BoxDecoration(
              image: DecorationImage(image:NetworkImage(viewModel.url))
            ),)
        )))
      ]),
    );
  }
}

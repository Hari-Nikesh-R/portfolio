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
      body:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Expanded(
                  child: Padding(padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 20), child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 60,
                    itemBuilder: (context, index) =>  const DlCardView(
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 530)),
                    ),
                  ))),
             Container( margin: const EdgeInsets.all(24), child: const DlCardView(
              child: Center(child: Text("New event"))),
            )
          ],
        ),
    );
  }
}

import 'package:app/core_widgets/pop_scope_navigator.dart';
import 'package:app/dialogs/app_exit_dialog.dart';
import 'package:app/extensions/number_ext.dart';
import 'package:app/library_widgets/lottie_loader.dart';
import 'package:app/utils/assets.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var viewModel = HomeViewModel();
  var modelData = HomeViewModel();
  var scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => viewModel.initViewModel());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    SizeConfig.initMediaQuery(context);
    viewModel = Provider.of<HomeViewModel>(context, listen: false);
    modelData = Provider.of<HomeViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PopScopeNavigator(
      canPop: false,
      onPop: appExitDialog,
      child: Scaffold(
        body: Container(
          width: SizeConfig.width,
          height: SizeConfig.height,
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(children: [_screenView(context), if (modelData.loader) LottieLoader(asset: Assets.loader, size: 70.width)]),
        ),
      ),
    );
  }

  Widget _screenView(BuildContext context) {
    var palestine = modelData.currentPalestine;
    var palestine_label = palestine?.text != null ? palestine!.text!.trim() : '';
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(palestine_label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
    );
    /*return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(palestine_label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text('Palestine Images', style: sl<TextStyles>().text18_700(black)),
        ),
        const SizedBox(height: 16),
        SizedBox(height: 100, child: PalestineImageList()),
      ],
    );*/
  }
}

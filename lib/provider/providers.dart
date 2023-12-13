import 'package:app/viewmodels/global_viewmodel.dart';
import 'package:app/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => GlobalViewModel()),
  ChangeNotifierProvider(create: (_) => HomeViewModel()),
];

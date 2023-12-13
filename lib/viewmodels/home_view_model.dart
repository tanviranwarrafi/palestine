import 'dart:async';

import 'package:app/di.dart';
import 'package:app/extensions/list_ext.dart';
import 'package:app/models/palestine/palestine.dart';
import 'package:app/repositories/palestine_repo.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  bool loader = true;
  Palestine? currentPalestine;
  List<Palestine> palestineList = [];

  void initViewModel() {
    getPalestineList();
    Timer.periodic(const Duration(seconds: 1), (t) => getCurrentPalestine());
  }

  Future<void> getPalestineList() async {
    var responseList = await sl<PalestineRepository>().getPalestineList();
    if (responseList.haveList) palestineList = responseList;
    loader = false;
    notifyListeners();
  }

  void getCurrentPalestine() {
    var startTimeInSeconds = DateTime.parse('2023-12-04T05:22:00').second;
    var currentTimeInSeconds = DateTime.now().second;
    var lastPalestine = palestineList.isNotEmpty ? palestineList.last : null;
    if (lastPalestine == null) {
      if (kDebugMode) print("Couldn't find any hetaf...");
      return;
    }
    final diff = currentTimeInSeconds - startTimeInSeconds;
    for (var palestine in palestineList) {
      if ((palestine.startTime ?? 0) <= diff && (palestine.endTime ?? 0) > diff) {
        currentPalestine = palestine;
        notifyListeners();
        break;
      }
    }
  }
}

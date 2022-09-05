import 'package:flutter/widgets.dart';

class AdvertisementViewModel with ChangeNotifier {
  bool isRequestPending = false;
  bool isRequestLoaded = false;
  bool isRequestError = false;

  void requestAdvertisement() {
    isRequestPending = true;
    isRequestLoaded = false;
    isRequestError = false;
    notifyListeners();
  }
}

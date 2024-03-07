import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/constant/imageAsset.dart';

class HandlingDataView extends StatelessWidget {
  final Statusrequest statusrequest;
  final widget;
  const HandlingDataView(
      {super.key, required this.statusrequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.lodaing
        ? Center(
            child: Center(
            child: Lottie.asset(AppimageAsset.loading, width: 100, height: 120),
          ))
        : statusrequest == Statusrequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppimageAsset.offline,
                    width: 250, height: 250, repeat: true),
              )
            : statusrequest == Statusrequest.serverfailure
                ? Center(child: Lottie.asset(AppimageAsset.server))
                : statusrequest == Statusrequest.failure
                    ? Center(
                        child: Lottie.asset(AppimageAsset.nodata),
                      )
                    : widget;
  }
}

// signUp =>  request No data
class HandlingDataViewRequest extends StatelessWidget {
  final Statusrequest statusrequest;
  final widget;
  const HandlingDataViewRequest(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.lodaing
        ? Center(
            child: Center(
            child:
                Lottie.asset(AppimageAsset.loadingtow, width: 150, height: 120),
          ))
        : statusrequest == Statusrequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppimageAsset.offline,
                    width: 250, height: 250, repeat: true),
              )
            : statusrequest == Statusrequest.serverfailure
                ? Center(child: Lottie.asset(AppimageAsset.server))
                : widget;
  }
}

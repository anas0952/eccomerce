import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:untitled/core/class/statusrequest.dart';
import 'package:untitled/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<Statusrequest, Map>> postdata(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var responce = await http.post(Uri.parse(linkurl), body: data);
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          Map responceBody = await jsonDecode(responce.body);
          print(responceBody);
          return Right(responceBody);
        } else {
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (_) {
      return const Left(Statusrequest.serverException);
    }
  }
}

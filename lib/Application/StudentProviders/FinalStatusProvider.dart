import 'dart:convert';
import 'dart:developer';
import 'package:essconnect/Domain/Student/RazorPayModel.dart';
import 'package:essconnect/Domain/Student/TransactionModel.dart';
import 'package:essconnect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FinalStatusProvider with ChangeNotifier {
///////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////            payment             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

  String? reponseCode;
  String? reponseMsg;
  Future transactionStatus(String orderID) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/online-payment/paytm/verify-status-app?orderid=$orderID"),
        headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        log(data.toString());

        PaytmFinalStatusModel att = PaytmFinalStatusModel.fromJson(data);
        reponseCode = att.reponseCode;
        reponseMsg = att.reponseMsg;

        notifyListeners();
      } else {
        print("Error in   Paytm final transaction  response");
      }
    } catch (e) {
      print(e);
    }
  }

  String? reponseMsgRazor;

  Future transactionStatusRazorPay(String orderID) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_pref.getString('accesstoken')}'
    };
    // print(headers);
    var response = await http.get(
        Uri.parse(
            "${UIGuide.baseURL}/online-payment/razor-pay/verify-status-app?orderid=$orderID"),
        headers: headers);
    print(
        "${UIGuide.baseURL}/online-payment/razor-pay/verify-status-app?orderid=$orderID");
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        log(data.toString());

        RazorpayFinalStatus raz = RazorpayFinalStatus.fromJson(data);
        reponseMsgRazor = raz.reponseMsg;

        notifyListeners();
      } else {
        print("Error in   Razor final transaction  response");
      }
    } catch (e) {
      print(e);
    }
  }
}

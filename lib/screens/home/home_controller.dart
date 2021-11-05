import 'dart:convert';

import 'package:flap_kap_project/models/order_model.dart';
import 'package:flap_kap_project/models/orders_data.dart';
import 'package:flap_kap_project/screens/home/home_widgets/order_widget.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    readOrdersJson();

    super.onInit();
  }

  List<dynamic> orders = [];

  Future<void> readOrdersJson() async {
    final String response =
        await rootBundle.loadString('assets/files/orders.json');
    final data = await json.decode(response);
    setOrderList(data);
    print("data is $data");
    updateNumberOfReturns();
    getAveragePrice();
    chartData = getChartData();
    // ...
  }

// set order list
  setOrderList(data) {
    orders = data;

    update();
  }

// loding event
  bool isLoading = false;

  changeLoadingEvent(bool loading) {
    isLoading = loading;
  }
  // get number of returns

  int numberOfReturns = 0;
  updateNumberOfReturns() {
    for (int i = 0; i < orders.length; i++) {
      if (orders[i]['status'] == "RETURNED") {
        numberOfReturns++;
      }
    }
    update();
  }

  // get average price
  double priceSum = 0;
  double averagePrice = 0;

  getAveragePrice() {
    for (int i = 0; i < orders.length; i++) {
      priceSum += double.parse(orders[i]['price']);

      print("$priceSum");
    }
    averagePrice = priceSum / orders.length;
    print("$averagePrice");
    update();
  }

  ////////////////////////// chart data ///////////////////////////////////
  List<OrdersData> chartData = [];

  List<OrdersData> getChartData() {
    List<OrdersData> chartData = [];
    for (int i = 0; i < orders.length; i++) {
      chartData += [
        OrdersData(
            numberOrder: i,
            dateOrder: int.parse(
              orders[i]['registered'].toString().substring(5, 6),
            ))
      ];
    }
    print("chart data is $chartData");

    return chartData;
  }
}

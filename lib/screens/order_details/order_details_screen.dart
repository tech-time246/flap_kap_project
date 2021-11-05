import 'package:flap_kap_project/models/orders_data.dart';
import 'package:flap_kap_project/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrderDetailsScreen extends StatelessWidget {
  final dynamic order;
  const OrderDetailsScreen({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (HomeController controller) => SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey.shade800,
                    centerTitle: true,
                    title: Text(
                      "${order['id']}",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  body: SfCartesianChart(
                    // primaryYAxis:
                    //     DateTimeAxis(intervalType: DateTimeIntervalType.auto),
                    series: <ChartSeries<OrdersData, dynamic>>[
                      LineSeries<OrdersData, dynamic>(
                          dataSource: controller.chartData,
                          xValueMapper: (OrdersData order, _) =>
                              order.numberOrder,
                          yValueMapper: (OrdersData order, _) =>
                              order.dateOrder)
                    ],
                  )),
            ));
  }
}

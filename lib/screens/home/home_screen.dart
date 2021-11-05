import 'package:flap_kap_project/screens/home/home_controller.dart';
import 'package:flap_kap_project/screens/home/home_widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade800,
              centerTitle: true,
              title: const Text(
                "home Screen",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Count : ${controller.orders.length}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Average Price : ${controller.averagePrice.roundToDouble()}" +
                            r" $ ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Number Of Returns : ${controller.numberOfReturns}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.orders.length,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: OrderCard(
                                order: controller.orders[index],
                              ));
                        }),
                  ),
                ],
              ),
            )));
  }
}

import 'package:flap_kap_project/models/order_model.dart';
import 'package:flap_kap_project/screens/order_details/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final dynamic order;
  const OrderCard({this.order});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => OrderDetailsScreen(
              order: order,
            ));
      },
      child: Card(
        shadowColor: Colors.grey[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height / 12,
                    width: Get.width / 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(order['picture']),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: Get.height / 20,
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor:
                        order['isActive'] == true ? Colors.green : Colors.red,
                  )
                ],
              ),
              Container(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "# ${order['id']}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Company : ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${order['company']}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Buyer : ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${order['buyer']}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Price : ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${order['price']}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

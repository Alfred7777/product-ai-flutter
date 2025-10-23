import 'package:flutter/material.dart';
import 'package:product_ai_flutter/models/order_item.dart';
import 'package:product_ai_flutter/resources/app_text_styles.dart';
import 'package:product_ai_flutter/widgets/order_item_card.dart';
import 'package:product_ai_flutter/widgets/order_item_header.dart';
import 'package:product_ai_flutter/widgets/order_prompt_field.dart';

class OrderTab extends StatelessWidget {
  final TextEditingController promptTextController;
  final List<OrderItem> orderList;
  final VoidCallback analyzeOrderCallback;

  const OrderTab({
    super.key, 
    required this.orderList,
    required this.promptTextController,
    required this.analyzeOrderCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderItemHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              final orderItem = orderList[index];
              return OrderItemCard(
                orderItem: orderItem,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: analyzeOrderCallback,
              child: Text('Analyze Order'),
            ),
            Text(
              'Razem: \$${orderList.fold(0.0, (sum, item) => item.price > 0 ? sum + (item.price * item.quantity) : sum).toStringAsFixed(2)}',
              style: AppTextStyles.kOrderItemHeaderTitleStyle,
            ),
          ],
        ),
        OrderPromptField(
          orderTextController: promptTextController,
        ),
      ],
    );
  }
}
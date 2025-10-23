import 'package:flutter/material.dart';
import 'package:product_ai_flutter/models/order_item.dart';
import 'package:product_ai_flutter/resources/app_text_styles.dart';

class OrderItemCard extends StatelessWidget {
  final OrderItem orderItem;

  const OrderItemCard({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 12.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              orderItem.title,
              textAlign: TextAlign.center,
              style: orderItem.isProduct ? AppTextStyles.kOrderItemCardTitleStyle : AppTextStyles.kWrongOrderItemCardTitleStyle,
            ),
          ),
          SizedBox(
            width: 32.0, 
            child: Text(
              orderItem.quantity.toString(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: orderItem.isProduct ? AppTextStyles.kOrderItemCardContentStyle : AppTextStyles.kWrongOrderItemCardContentStyle,
            ),
          ),
          SizedBox(
            width: 56.0,
            child: Text(
              orderItem.price > 0 ? '\$${orderItem.price.toStringAsFixed(2)}' : '?',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: orderItem.isProduct ? AppTextStyles.kOrderItemCardContentStyle : AppTextStyles.kWrongOrderItemCardContentStyle,
            ),
          ),
          SizedBox(
            width: 72.0,
            child: Text(
              orderItem.price > 0 ? '\$${(orderItem.price * orderItem.quantity).toStringAsFixed(2)}' : '???',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: orderItem.isProduct ? AppTextStyles.kOrderItemCardContentStyle : AppTextStyles.kWrongOrderItemCardContentStyle,
            ),
          ),
        ],
      ),
    );
  }
}
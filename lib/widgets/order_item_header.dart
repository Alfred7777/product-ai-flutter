import 'package:flutter/material.dart';
import 'package:product_ai_flutter/resources/app_text_styles.dart';

class OrderItemHeader extends StatelessWidget {
  const OrderItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        bottom: 6.0,
        left: 12.0,
        right: 12.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Nazwa',
              textAlign: TextAlign.center,
              style: AppTextStyles.kOrderItemHeaderTitleStyle,
            ),
          ),
          SizedBox(
            width: 32.0, 
            child: Text(
              'Ilość',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.kOrderItemHeaderTitleStyle,
            ),
          ),
          SizedBox(
            width: 56.0,
            child: Text(
              'Cena',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.kOrderItemHeaderTitleStyle,
            ),
          ),
          SizedBox(
            width: 72.0,
            child: Text(
              'Suma',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.kOrderItemHeaderTitleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:product_ai_flutter/resources/app_colors.dart';
import 'package:product_ai_flutter/resources/app_strings.dart';
import 'package:product_ai_flutter/resources/app_text_styles.dart';

class OrderPromptField extends StatelessWidget {
  final TextEditingController orderTextController;

  const OrderPromptField({super.key, required this.orderTextController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
          color: AppColors.kLightPrimaryColor.withAlpha(40),
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        child: TextField(
          minLines: 3,
          maxLines: 3,
          controller: orderTextController,
          style: AppTextStyles.kOrderPromptTextStyle,
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 12.0,
            ),
            hintText: AppStrings.kOrderPromptHint,
            hintStyle: AppTextStyles.kOrderPromptHintStyle,
          ),
        ),
      ),
    );
  }
}
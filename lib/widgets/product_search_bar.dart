import 'package:flutter/material.dart';
import 'package:product_ai_flutter/resources/app_colors.dart';
import 'package:product_ai_flutter/resources/app_strings.dart';
import 'package:product_ai_flutter/resources/app_text_styles.dart';

class ProductSearchBar extends StatelessWidget {
  final TextEditingController queryTextController;

  const ProductSearchBar({super.key, required this.queryTextController});

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0 * 2,
      ),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: AppColors.kLightPrimaryColor.withAlpha(40),
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 8.0 * 1.5,
                right: 8.0,
              ),
              child: Icon(
                Icons.search,
                color: AppColors.kLightPrimaryColor,
                size: 14,
              ),
            ),
            Flexible(
              child: TextField(
                controller: queryTextController,
                style: AppTextStyles.kSearchBarTextStyle,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: AppStrings.kSearchProductsHint,
                  hintStyle: AppTextStyles.kSearchBarHintStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:product_ai_flutter/resources/app_colors.dart';

class AppTextStyles {
  static const TextStyle kProductCardTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: AppColors.kPrimaryColor,
  );
  static const TextStyle kProductCardContentStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: AppColors.kPrimaryColor,
  );

  static const TextStyle kOrderItemHeaderTitleStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: AppColors.kPrimaryColor,
  );
  static const TextStyle kOrderItemCardTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: AppColors.kPrimaryColor,
  );
  static const TextStyle kOrderItemCardContentStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: AppColors.kPrimaryColor,
  );
  static const TextStyle kWrongOrderItemCardTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: AppColors.kSecondAccentColor,
  );
  static const TextStyle kWrongOrderItemCardContentStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: AppColors.kSecondAccentColor,
  );

  static const TextStyle kSearchBarTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.kLightPrimaryColor,
  );
  static TextStyle kSearchBarHintStyle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColors.kLightPrimaryColor.withAlpha(180),
  );

  static const TextStyle kOrderPromptTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.kLightPrimaryColor,
  );
  static TextStyle kOrderPromptHintStyle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColors.kLightPrimaryColor.withAlpha(180),
  );
}
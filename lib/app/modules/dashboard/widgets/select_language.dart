import 'package:flutter/material.dart';
import 'package:ghost_office/app/data/config/app_colors.dart';

import '../../../data/enums/language_enum.dart';
import '../../../utils/app_text_style.dart';

/// Select Language widget
class SelectLanguage extends StatelessWidget {
  /// Select Language widget constructor
  const SelectLanguage({
    required this.onSelect,
    super.key,
  });

  /// Controller for language selection
  final void Function(LanguageEnum) onSelect;

  @override
  Widget build(BuildContext context) => PopupMenuButton<LanguageEnum>(
        color: AppColors.kffffff,
        icon: const Icon(Icons.language),
        onSelected: onSelect,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<LanguageEnum>>[
          PopupMenuItem<LanguageEnum>(
            value: LanguageEnum.english,
            child: Text(
              'English',
              style: AppTextStyle.openRunde(
                fontSize: 16,
                color: AppColors.k000000,
              ),
            ),
          ),
          PopupMenuItem<LanguageEnum>(
            value: LanguageEnum.hindi,
            child: Text(
              'हिन्दी',
              style: AppTextStyle.openRunde(
                fontSize: 16,
                color: AppColors.k000000,
              ),
            ),
          ),
        ],
      );
}

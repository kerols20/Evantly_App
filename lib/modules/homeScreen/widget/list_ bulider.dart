import 'package:evanly/core/constant/app_color.dart';
import 'package:flutter/material.dart';

import '../../create_Evant/widget_selcetd-tab.dart';

class TabWidget extends StatelessWidget {
  final EvantCatrory eventCategory;
  final bool isSelected;

  const TabWidget({
    super.key,
    required this.eventCategory,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? app_color.appColorGeneral : app_color.appColorsWhite,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: app_color.appColorGeneral),
      ),
      child: Row(
        children: [
          Icon(
            eventCategory.evantCategoryIcon,
            color: isSelected ? app_color.appColorsWhite : app_color.appColorsWhite,
          ),
          SizedBox(width: 5),
          Text(
            eventCategory.evantCategoryName,
            style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? app_color.appColorsWhite
                    : app_color.appColorGeneral),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpicCategoryDropdown<T> extends StatelessWidget {
  const EpicCategoryDropdown({
    super.key,
    required this.label,
    required this.selectedItem,
    required this.items,
    required this.onChanged,
    required this.displayItemName,
    this.isExpanded = true,
    this.leadingIconBuilder,
  });

  final String label;
  final T selectedItem;
  final List<T> items;
  final Function(T) onChanged;
  final String Function(T) displayItemName;
  final bool isExpanded;
  final Widget Function(T)? leadingIconBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Define colors based on theme
    final primaryColor = theme.colorScheme.primary;
    final backgroundColor =
        isDarkMode ? theme.colorScheme.surface : theme.colorScheme.background;
    final dropdownColor =
        isDarkMode
            ? theme.colorScheme.surfaceVariant
            : theme.colorScheme.surface;
    final textColor =
        isDarkMode
            ? theme.colorScheme.onSurface
            : theme.colorScheme.onBackground;
    final borderColor =
        isDarkMode
            ? theme.colorScheme.outline.withOpacity(0.3)
            : primaryColor.withOpacity(0.2);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Label background
          Positioned(
            left: 16.w,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              color: backgroundColor,
              child: Text(
                label,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Dropdown
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  isExpanded: isExpanded,
                  value: selectedItem,
                  icon: Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    padding: EdgeInsets.all(8.r),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: primaryColor,
                    ),
                  ),
                  dropdownColor: dropdownColor,
                  borderRadius: BorderRadius.circular(12.r),
                  elevation: 8,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  onChanged: (value) {
                    if (value != null) {
                      onChanged(value);
                    }
                  },
                  items:
                      items.map<DropdownMenuItem<T>>((T item) {
                        return DropdownMenuItem<T>(
                          value: item,
                          child: Row(
                            children: [
                              if (leadingIconBuilder != null) ...[
                                leadingIconBuilder!(item),
                                SizedBox(width: 12.w),
                              ],
                              Expanded(
                                child: Text(
                                  displayItemName(item),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                  menuMaxHeight: 300.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

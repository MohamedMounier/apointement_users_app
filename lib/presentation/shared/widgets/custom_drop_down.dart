import 'package:appointment_users/presentation/shared/resources/app_colors.dart';
import 'package:flutter/material.dart';


class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.label,
      required this.selectedItem,
      required this.items,
      required this.onChanged,
      required this.displayItemName,
      this.dropDownColor,
      this.iconColor,
      this.labelColor,
      this.backGroundColor,
      this.choicesColor,
      this.chosenValueColor, this.isExpanded});

  final String label;
  final T selectedItem;
  final List<T> items;
  final Function(T) onChanged;
  final String Function(T) displayItemName;
  final Color? dropDownColor;
  final Color? labelColor;
  final Color? iconColor;
  final Color? choicesColor;
  final Color? backGroundColor;
  final Color? chosenValueColor;
  final bool? isExpanded;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: isExpanded ?? false,
      alignment: Alignment.bottomCenter,
      iconEnabledColor: labelColor ?? AppColors.primary,
      dropdownColor: dropDownColor ?? Colors.white,
      decoration: InputDecoration(
        fillColor: backGroundColor ?? Colors.white,
        filled: true,
        border: const OutlineInputBorder(),
        isDense: true,
        label: Text(label),
        labelStyle: TextStyle(color: labelColor ?? AppColors.primary),
      ),
      hint: const Text("Select"),
      value: selectedItem,
      icon:  Icon(Icons.arrow_drop_down,color: iconColor??Colors.white,),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: chosenValueColor ?? AppColors.primary),
      onChanged: (value) => onChanged(value as T),
      items: items.map<DropdownMenuItem<T>>((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            displayItemName(item),
            style: TextStyle(color: choicesColor ?? AppColors.primary),
          ),
        );
      }).toList(),
    );
  }
}

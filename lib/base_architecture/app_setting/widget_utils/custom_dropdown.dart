import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/core/master_object.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final void Function(MasterObject? value) onSelect;
  final List<DropdownMenuItem<MasterObject>>? items;
  final MasterObject selectValue;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.onSelect,
    this.items,
    required this.selectValue,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<MasterObject>(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: widget.items,
          value: widget.selectValue,
          onChanged: widget.onSelect,
          buttonStyleData: ButtonStyleData(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black26),
              color: Colors.white,
            ),
          ),

          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          onMenuStateChange: (isOpen) {
            if (isOpen) {
              // Dropdown menu ပွင့်သွားတဲ့အခါ
              print("Dropdown menu is now open!");
            } else {
              // Dropdown menu ပိတ်သွားတဲ့အခါ
              print("Dropdown menu is now closed!");
            }
          },
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}

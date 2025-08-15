import 'package:flutter/material.dart';

class FilterChipsRow extends StatefulWidget {
  @override
  _FilterChipsRowState createState() => _FilterChipsRowState();
}

class _FilterChipsRowState extends State<FilterChipsRow> {
  String selected = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterChipWidget(
          label: 'This Month',
          isSelected: selected == 'This Month',
          onTap: () => setState(() => selected = 'This Month'),
        ),
        const SizedBox(width: 8),
        FilterChipWidget(
          label: 'All Time',
          isSelected: selected == 'All Time',
          onTap: () => setState(() => selected = 'All Time'),
        ),
        const SizedBox(width: 8),
        FilterDropdownButton(), // Separate widget for dropdown
      ],
    );
  }
}
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Color(0xFF1D8AA2) : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
class FilterDropdownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white30),
      ),
      child: Row(
        children: const [
          Text('All', style: TextStyle(color: Colors.white)),
          SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}

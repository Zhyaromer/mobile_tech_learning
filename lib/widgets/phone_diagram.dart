import 'package:flutter/material.dart';
import '../data/components_data.dart';
import '../theme/app_theme.dart';

// An intentionally simplified diagram, built entirely with Flutter widgets.
class PhoneDiagram extends StatelessWidget {
  const PhoneDiagram({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  Widget _part(int index, String label, {double height = 56}) {
    final selected = selectedIndex == index;
    return Semantics(
      selected: selected,
      button: true,
      label: 'Explore ${phoneComponents[index].name}',
      child: Material(
        color: selected ? AppTheme.amber : const Color(0xFF223F65),
        borderRadius: BorderRadius.circular(13),
        child: InkWell(
          key: ValueKey('phone-part-$index'),
          onTap: () => onSelected(index),
          borderRadius: BorderRadius.circular(13),
          child: Container(
            constraints: BoxConstraints(minHeight: height),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: selected ? AppTheme.amber : const Color(0xFF44618A),
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  phoneComponents[index].icon,
                  size: 20,
                  color: selected ? AppTheme.navy : const Color(0xFFDCE8FC),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: selected ? AppTheme.navy : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      width: 268,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: AppTheme.navy,
        borderRadius: BorderRadius.circular(38),
        border: Border.all(color: const Color(0xFF344D72), width: 4),
        boxShadow: [
          BoxShadow(
            color: AppTheme.navy.withValues(alpha: .15),
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 46,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFF496084),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _part(5, 'Camera')),
              const SizedBox(width: 7),
              Expanded(child: _part(6, 'Speaker')),
              const SizedBox(width: 7),
              Expanded(child: _part(8, 'Sensors')),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: _part(0, 'Touchscreen', height: 74),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _part(2, 'CPU')),
              const SizedBox(width: 8),
              Expanded(child: _part(3, 'RAM')),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _part(1, 'Battery', height: 82)),
              const SizedBox(width: 8),
              Expanded(child: _part(4, 'Storage', height: 82)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _part(9, 'SIM card')),
              const SizedBox(width: 8),
              Expanded(child: _part(7, 'Microphone')),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: 65,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    ),
  );
}

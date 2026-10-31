import 'package:flutter/material.dart';
import '../data/components_data.dart';
import '../widgets/common_widgets.dart';
import '../widgets/phone_diagram.dart';

class PhoneExplorerScreen extends StatefulWidget {
  const PhoneExplorerScreen({super.key});
  @override
  State<PhoneExplorerScreen> createState() => _PhoneExplorerScreenState();
}

class _PhoneExplorerScreenState extends State<PhoneExplorerScreen> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    final component = phoneComponents[_selected];
    final details = Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'COMPONENT ${(_selected + 1).toString().padLeft(2, '0')} / 10',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 11,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                IconTile(
                  icon: component.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    component.name,
                    key: const ValueKey('component-title'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Text('What it does', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 6),
            Text(component.function),
            const SizedBox(height: 18),
            Text(
              'Why it matters',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 6),
            Text(component.importance),
            const SizedBox(height: 20),
            InfoCard(
              title: 'Try picturing this',
              text: component.example,
              icon: Icons.lightbulb_outline_rounded,
            ),
          ],
        ),
      ),
    );
    return PageBody(
      children: [
        const PageHeading(
          eyebrow: 'An inside look',
          title: 'Small parts. Big possibilities.',
          description: 'Tap a part of the phone to discover what it does.',
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final phone = Column(
              children: [
                PhoneDiagram(
                  selectedIndex: _selected,
                  onSelected: (index) => setState(() => _selected = index),
                ),
                const SizedBox(height: 18),
                Text(
                  'Simplified diagram · parts are not to scale',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            );
            if (constraints.maxWidth >= 700) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: phone),
                  const SizedBox(width: 24),
                  Expanded(child: details),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [phone, const SizedBox(height: 24), details],
            );
          },
        ),
        const SectionHeading(title: 'Explore every component'),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < phoneComponents.length; i++)
              ChoiceChip(
                label: Text(phoneComponents[i].name),
                selected: _selected == i,
                onSelected: (_) => setState(() => _selected = i),
              ),
          ],
        ),
      ],
    );
  }
}

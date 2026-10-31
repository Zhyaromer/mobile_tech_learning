import 'package:flutter/material.dart';
import '../data/modules_data.dart';
import '../widgets/common_widgets.dart';
import '../widgets/module_card.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});
  @override
  Widget build(BuildContext context) => PageBody(
    children: [
      const PageHeading(
        eyebrow: 'The learning library',
        title: 'Follow your curiosity.',
        description:
            'Eight bite-sized modules. Start at the beginning or choose a topic that interests you.',
      ),
      LayoutBuilder(
        builder: (context, constraints) {
          final columns =
              constraints.maxWidth >= 680 &&
                  MediaQuery.textScalerOf(context).scale(1) < 1.5
              ? 2
              : 1;
          final width = (constraints.maxWidth - (columns - 1) * 16) / columns;
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (var i = 0; i < modules.length; i++)
                SizedBox(
                  width: width,
                  child: ModuleCard(module: modules[i], number: i + 1),
                ),
            ],
          );
        },
      ),
    ],
  );
}

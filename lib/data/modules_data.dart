import 'package:flutter/material.dart';
import '../models/module_model.dart';
import 'lessons_data.dart';

const modules = <LearningModule>[
  LearningModule(
    id: 'intro',
    title: 'Introduction to Mobile Technology',
    description: 'Get to know the powerful computer in your pocket.',
    icon: Icons.phone_android_rounded,
    color: Color(0xFF246BFD),
    lessons: introductionLessons,
  ),
  LearningModule(
    id: 'history',
    title: 'History of Mobile Phones',
    description: 'From the first handheld calls to the smartphone era.',
    icon: Icons.history_rounded,
    color: Color(0xFF9361D9),
    lessons: historyLessons,
  ),
  LearningModule(
    id: 'hardware',
    title: 'Mobile Hardware Components',
    description: 'Discover the parts that bring your phone to life.',
    icon: Icons.memory_rounded,
    color: Color(0xFF138778),
    lessons: hardwareLessons,
  ),
  LearningModule(
    id: 'os',
    title: 'Mobile Operating Systems',
    description: 'Meet the software that keeps everything working.',
    icon: Icons.layers_rounded,
    color: Color(0xFFE28338),
    lessons: operatingSystemLessons,
  ),
  LearningModule(
    id: 'networks',
    title: 'Mobile Networks (2G, 3G, 4G, 5G)',
    description: 'Follow the signals that keep us connected.',
    icon: Icons.cell_tower_rounded,
    color: Color(0xFF367FBC),
    lessons: networkLessons,
  ),
  LearningModule(
    id: 'apps',
    title: 'Mobile Applications',
    description: 'Understand apps, platforms, and what happens behind a tap.',
    icon: Icons.apps_rounded,
    color: Color(0xFFB0609A),
    lessons: appLessons,
  ),
  LearningModule(
    id: 'security',
    title: 'Mobile Security',
    description: 'Build smarter habits for a safer digital life.',
    icon: Icons.shield_outlined,
    color: Color(0xFF548538),
    lessons: securityLessons,
  ),
  LearningModule(
    id: 'future',
    title: 'Future of Mobile Technology',
    description: 'Explore new ideas and a more sustainable mobile future.',
    icon: Icons.auto_awesome_rounded,
    color: Color(0xFF635DCF),
    lessons: futureLessons,
  ),
];

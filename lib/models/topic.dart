import 'package:flutter/material.dart';

class LessonSection {
  final String title;
  final String content;
  final IconData icon;

  LessonSection({
    required this.title,
    required this.content,
    required this.icon,
  });
}

class Topic {
  final String id;
  final String title; // Marathi title
  final String englishTitle;
  final String gradeCategory; // e.g. "१–२", "३–५", "६–८", "९–१०"
  final String summary;
  final IconData icon;
  final Color themeColor;
  final String bannerTag;
  final List<LessonSection> sections;
  final String dailyActionTip; // "पर्यावरण मित्र कृती"
  final int pointsReward;

  Topic({
    required this.id,
    required this.title,
    required this.englishTitle,
    required this.gradeCategory,
    required this.summary,
    required this.icon,
    required this.themeColor,
    required this.bannerTag,
    required this.sections,
    required this.dailyActionTip,
    this.pointsReward = 50,
  });
}

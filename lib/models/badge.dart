import 'package:flutter/material.dart';

class EcoBadge {
  final String id;
  final String titleMarathi;
  final String descriptionMarathi;
  final IconData icon;
  final Color color;
  final int requiredPoints;
  final bool isUnlocked;

  EcoBadge({
    required this.id,
    required this.titleMarathi,
    required this.descriptionMarathi,
    required this.icon,
    required this.color,
    required this.requiredPoints,
    this.isUnlocked = false,
  });

  EcoBadge copyWith({
    String? id,
    String? titleMarathi,
    String? descriptionMarathi,
    IconData? icon,
    Color? color,
    int? requiredPoints,
    bool? isUnlocked,
  }) {
    return EcoBadge(
      id: id ?? this.id,
      titleMarathi: titleMarathi ?? this.titleMarathi,
      descriptionMarathi: descriptionMarathi ?? this.descriptionMarathi,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      requiredPoints: requiredPoints ?? this.requiredPoints,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}

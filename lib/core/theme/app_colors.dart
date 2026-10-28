import 'package:flutter/material.dart';

/// Premium Dark Navy & Violet Color Palette for FocusFlow
class AppColors {
  AppColors._();

  // Primary Palette
  static const Color primary = Color(0xFF8B5CF6); // Electric Violet
  static const Color primaryLight = Color(0xFFA78BFA);
  static const Color primaryDark = Color(0xFF6D28D9);

  // Secondary & Accents
  static const Color secondary = Color(0xFF38BDF8); // Cyan Glow
  static const Color secondaryDark = Color(0xFF0284C7);
  static const Color accentRose = Color(0xFFF43F5E); // Priority / Urgent
  static const Color accentAmber = Color(0xFFF59E0B); // In Progress / Streak
  static const Color accentEmerald = Color(0xFF10B981); // Completed / Success

  // Dark Navy Backgrounds & Surfaces
  static const Color background = Color(0xFF0B0F19); // Ultra-deep Navy
  static const Color surface = Color(0xFF13192B); // Midnight Navy Card
  static const Color surfaceVariant = Color(0xFF1B243D); // Elevated Surface
  static const Color surfaceHighlight = Color(0xFF263255); // Highlighted borders/hover

  // Dividers & Outlines
  static const Color border = Color(0xFF242F4D);
  static const Color borderSubtle = Color(0xFF1A2238);

  // Typography Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textTertiary = Color(0xFF64748B);
  static const Color textDisabled = Color(0xFF475569);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF182038), Color(0xFF11172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF38BDF8), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient timerGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

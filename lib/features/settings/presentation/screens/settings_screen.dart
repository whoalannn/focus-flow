import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/sample_data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _dailyGoal = SampleData.targetDailyHours;
  bool _enableAmbientSound = false;
  bool _enableNotifications = true;
  bool _enableHaptics = true;
  String _selectedAmbient = 'Rainfall';

  final List<String> _ambients = ['Rainfall', 'White Noise', 'Forest Stream', 'Lo-Fi Chill'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings & Preferences'),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            // 1. Student Profile Header Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: AppColors.cardGradient,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryLight,
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'AR',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          SampleData.userName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          SampleData.userMajor,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentAmber.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            '🔥 6-Day Study Streak Active',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.accentAmber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 2. Study Target Configuration
            _buildSectionHeader('Study Targets'),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Daily Target Hours',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '${_dailyGoal.toStringAsFixed(1)} hrs / day',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: _dailyGoal,
                    min: 1.0,
                    max: 10.0,
                    divisions: 18,
                    activeColor: AppColors.primaryLight,
                    inactiveColor: AppColors.surfaceVariant,
                    onChanged: (val) {
                      setState(() => _dailyGoal = val);
                    },
                  ),
                  const Text(
                    'Setting a realistic daily goal keeps focus consistent across exam semesters.',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 3. Audio & Notifications
            _buildSectionHeader('Focus Environment & Alerts'),
            Material(
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.border),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text(
                      'Study Reminders',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text(
                      'Receive daily motivational prompts before study sessions',
                      style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                    ),
                    value: _enableNotifications,
                    activeThumbColor: AppColors.primaryLight,
                    onChanged: (val) => setState(() => _enableNotifications = val),
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text(
                      'Haptic Feedback',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text(
                      'Vibrate phone upon timer start, pause, and completion',
                      style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                    ),
                    value: _enableHaptics,
                    activeThumbColor: AppColors.primaryLight,
                    onChanged: (val) => setState(() => _enableHaptics = val),
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text(
                      'Ambient White Noise',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Background audio during focus timer ($_selectedAmbient)',
                      style: const TextStyle(fontSize: 12, color: AppColors.textTertiary),
                    ),
                    value: _enableAmbientSound,
                    activeThumbColor: AppColors.primaryLight,
                    onChanged: (val) => setState(() => _enableAmbientSound = val),
                  ),
                  if (_enableAmbientSound) ...[
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sound Theme:',
                            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                          ),
                          DropdownButton<String>(
                            value: _selectedAmbient,
                            dropdownColor: AppColors.surfaceVariant,
                            underline: const SizedBox.shrink(),
                            style: const TextStyle(
                              color: AppColors.primaryLight,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            items: _ambients.map((s) {
                              return DropdownMenuItem(value: s, child: Text(s));
                            }).toList(),
                            onChanged: (val) {
                              if (val != null) setState(() => _selectedAmbient = val);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 4. College Project Submission Info Card
            _buildSectionHeader('Project & Submission Info'),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: const Column(
                children: [
                  _InfoRow(label: 'Application', value: 'FocusFlow Study Planner'),
                  SizedBox(height: 8),
                  _InfoRow(label: 'Version', value: '1.0.0 (Release Candidate)'),
                  SizedBox(height: 8),
                  _InfoRow(label: 'Framework', value: 'Flutter 3.47.8 • Dart 3.13.7'),
                  SizedBox(height: 8),
                  _InfoRow(label: 'Target Platform', value: 'Android (API 34-37)'),
                  SizedBox(height: 8),
                  _InfoRow(label: 'Architecture', value: 'Clean Feature-First Modular'),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryLight,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

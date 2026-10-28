import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum FocusMode {
  pomodoro(name: 'Pomodoro', durationMinutes: 25),
  deepWork(name: 'Deep Work', durationMinutes: 50),
  shortBreak(name: 'Short Break', durationMinutes: 5),
  longBreak(name: 'Long Break', durationMinutes: 15);

  final String name;
  final int durationMinutes;
  const FocusMode({required this.name, required this.durationMinutes});
}

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  FocusMode _selectedMode = FocusMode.pomodoro;
  late int _totalSeconds;
  late int _remainingSeconds;
  Timer? _timer;
  bool _isRunning = false;
  int _completedSessions = 4;
  String _selectedSubject = 'Data Structures & Algorithms';

  final List<String> _subjects = [
    'Data Structures & Algorithms',
    'Operating Systems',
    'Discrete Mathematics',
    'Software Engineering',
    'Database Systems',
  ];

  @override
  void initState() {
    super.initState();
    _resetTimer(mode: _selectedMode);
  }

  void _resetTimer({FocusMode? mode}) {
    _timer?.cancel();
    final targetMode = mode ?? _selectedMode;
    setState(() {
      _selectedMode = targetMode;
      _totalSeconds = targetMode.durationMinutes * 60;
      _remainingSeconds = _totalSeconds;
      _isRunning = false;
    });
  }

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
    } else {
      setState(() => _isRunning = true);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds > 0) {
          setState(() {
            _remainingSeconds--;
          });
        } else {
          _timer?.cancel();
          setState(() {
            _isRunning = false;
            if (_selectedMode == FocusMode.pomodoro ||
                _selectedMode == FocusMode.deepWork) {
              _completedSessions++;
            }
          });
          _showCompletionDialog();
        }
      });
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.celebration_rounded, color: AppColors.accentAmber),
            SizedBox(width: 8),
            Text('Session Completed!'),
          ],
        ),
        content: Text(
          'Great job! You wrapped up your ${_selectedMode.name} session on $_selectedSubject.',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _resetTimer();
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSecs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSecs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final progress = _totalSeconds > 0
        ? (_remainingSeconds / _totalSeconds).clamp(0.0, 1.0)
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Timer'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primaryLight,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  '$_completedSessions Done',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              // 1. Mode Selector Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: FocusMode.values.map((mode) {
                    final isSelected = _selectedMode == mode;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text('${mode.name} (${mode.durationMinutes}m)'),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            _resetTimer(mode: mode);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),

              // 2. Active Subject Selector Pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedSubject,
                    dropdownColor: AppColors.surface,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.primaryLight,
                    ),
                    isDense: true,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (val) {
                      if (val != null) setState(() => _selectedSubject = val);
                    },
                    items: _subjects.map((sub) {
                      return DropdownMenuItem(
                        value: sub,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.school_outlined,
                              size: 16,
                              color: AppColors.primaryLight,
                            ),
                            const SizedBox(width: 8),
                            Text(sub),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // 3. Central Circular Countdown Display
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer subtle glow
                    Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: _isRunning
                                ? AppColors.primary.withValues(alpha: 0.25)
                                : Colors.transparent,
                            blurRadius: 40,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    // Background track
                    SizedBox(
                      width: 240,
                      height: 240,
                      child: CircularProgressIndicator(
                        value: 1.0,
                        strokeWidth: 12,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.surfaceVariant,
                        ),
                      ),
                    ),
                    // Progress indicator
                    SizedBox(
                      width: 240,
                      height: 240,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 12,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _selectedMode == FocusMode.shortBreak ||
                                  _selectedMode == FocusMode.longBreak
                              ? AppColors.secondary
                              : AppColors.primaryLight,
                        ),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    // Time text
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _formatTime(_remainingSeconds),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1.0,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _isRunning ? 'FOCUSING' : 'READY',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                            color: _isRunning
                                ? AppColors.primaryLight
                                : AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 44),

              // 4. Timer Controls (Play/Pause, Reset)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Reset Button
                  IconButton.filledTonal(
                    onPressed: () => _resetTimer(),
                    icon: const Icon(Icons.refresh_rounded),
                    color: AppColors.textSecondary,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.surfaceVariant,
                      padding: const EdgeInsets.all(16),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Main Play / Pause Button
                  GestureDetector(
                    onTap: _toggleTimer,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.45),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Icon(
                        _isRunning
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Quick skip / complete button
                  IconButton.filledTonal(
                    onPressed: () {
                      _timer?.cancel();
                      setState(() {
                        _remainingSeconds = 0;
                        _isRunning = false;
                      });
                      _showCompletionDialog();
                    },
                    icon: const Icon(Icons.skip_next_rounded),
                    color: AppColors.textSecondary,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.surfaceVariant,
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // 5. Motivational Tip Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.tips_and_updates_outlined,
                      color: AppColors.accentAmber,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Tip: Put your phone on "Do Not Disturb" during deep focus to eliminate notification micro-distractions.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

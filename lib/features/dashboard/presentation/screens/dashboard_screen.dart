import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/task_model.dart';
import '../../../../data/sample_data.dart';
import '../widgets/daily_goal_card.dart';
import '../widgets/quick_timer_banner.dart';
import '../widgets/task_preview_card.dart';

class DashboardScreen extends StatefulWidget {
  final VoidCallback onNavigateToFocus;
  final VoidCallback onNavigateToTasks;

  const DashboardScreen({
    super.key,
    required this.onNavigateToFocus,
    required this.onNavigateToTasks,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<TaskModel> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = SampleData.getInitialTasks();
  }

  void _toggleTask(int index, bool? value) {
    setState(() {
      _tasks[index].isCompleted = value ?? false;
    });
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _tasks.where((t) => t.isCompleted).length;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // App Bar / Greeting Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // User Avatar
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryLight,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'AR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_getGreeting()}, Alex 👋',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Computer Science • 3rd Year',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Notification badge
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          color: AppColors.textPrimary,
                          size: 22,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No new study reminders'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Main Dashboard Body
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // 1. Daily Study Goal Card
                  DailyGoalCard(
                    completedHours: SampleData.completedDailyHours,
                    targetHours: SampleData.targetDailyHours,
                    streakDays: SampleData.currentStreakDays,
                  ),

                  const SizedBox(height: 20),

                  // 2. Start Focus Session Banner
                  QuickTimerBanner(
                    onStartFocus: widget.onNavigateToFocus,
                  ),

                  const SizedBox(height: 24),

                  // 3. Quick Performance Metrics
                  Row(
                    children: [
                      _buildMetricTile(
                        icon: Icons.timer_outlined,
                        iconColor: AppColors.secondary,
                        label: 'Focus Time',
                        value: '3.5 hrs',
                      ),
                      const SizedBox(width: 12),
                      _buildMetricTile(
                        icon: Icons.check_circle_outline_rounded,
                        iconColor: AppColors.accentEmerald,
                        label: 'Tasks Done',
                        value: '$completedCount / ${_tasks.length}',
                      ),
                      const SizedBox(width: 12),
                      _buildMetricTile(
                        icon: Icons.bolt_rounded,
                        iconColor: AppColors.accentAmber,
                        label: 'Efficiency',
                        value: '94%',
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // 4. Today's Tasks Section Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Today's Tasks",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceVariant,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$completedCount/${_tasks.length}',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: widget.onNavigateToTasks,
                        child: const Row(
                          children: [
                            Text(
                              'View all',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios_rounded, size: 12),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // 5. Tasks List (First 4 for Dashboard)
                  ..._tasks.take(4).map((task) {
                    final index = _tasks.indexOf(task);
                    return TaskPreviewCard(
                      task: task,
                      onToggle: (val) => _toggleTask(index, val),
                    );
                  }),

                  const SizedBox(height: 24),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricTile({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

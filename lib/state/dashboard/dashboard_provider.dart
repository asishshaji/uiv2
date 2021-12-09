import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uiv2/repositories/dashboard_repo.dart';

import 'dashboard_state.dart';
part 'dashboard_state_notifier.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) => DashboardNotifier(
    dashboardRepository: ref.watch(_dashboardRepositoryProvider),
  ),
);

final _dashboardRepositoryProvider = Provider<DashboardRepository>(
  (ref) => DashboardRepository(),
);

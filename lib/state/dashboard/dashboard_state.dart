import 'package:uiv2/models/dashboard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uiv2/models/recentorders.dart';
import 'package:uiv2/models/salesprofit.dart';
part 'dashboard_state.freezed.dart';

extension DashboardGetters on DashboardState {
  bool get isLoading => this is _DashboardStateLoading;
}

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _DashboardStateInitial;
  const factory DashboardState.loading() = _DashboardStateLoading;

  const factory DashboardState.data({
    required Dashboard dashboard,
    required SalesProfit salesGraphData,
    required List<RecentOrder> recentOrders,
  }) = _DashboardStateData;

  const factory DashboardState.error([String? error]) = _DashboardStateError;
}

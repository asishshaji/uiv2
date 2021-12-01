part of 'dashboard_provider.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({
    required DashboardRepository dashboardRepository,
  })  : _dashboardRepository = dashboardRepository,
        super(const DashboardState.initial());

  final DashboardRepository _dashboardRepository;

  Future<void> getDashboardData() async {
    state = const DashboardState.loading();
    try {
      final dashboard = await _dashboardRepository.getDashboardData();
      final salesData = await _dashboardRepository.getSalesProfitData();
      final recentOrders = await _dashboardRepository.getRecentOrders();
      state = DashboardState.data(
        dashboard: dashboard,
        salesGraphData: salesData,
        recentOrders: recentOrders,
      );
    } catch (e) {
      state = const DashboardState.error('Error getting data');
    }
  }

  Future<int?> createProduct(var p) async {
    return await _dashboardRepository.createProduct(p);
  }

  Future<int?> updateProduct(var p) async {
    return await _dashboardRepository.updateProduct(p);
  }
}

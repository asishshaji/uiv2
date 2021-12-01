import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:uiv2/models/dashboard.dart';
import 'package:uiv2/models/recentorders.dart';
import 'package:uiv2/models/salesprofit.dart';

class DashboardRepository {
  final dio = Dio();
  final dashboardUrl = "http://0.0.0.0:9090/dashboard";
  final productUrl = "http://0.0.0.0:9090/product";
  final orderUrl = "http://0.0.0.0:9090/order";

  Future<Dashboard> getDashboardData() async {
    final DateTime now = DateTime.now();

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String todayFormatted = formatter.format(now);
    final DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    final String tomorrowFormatted = formatter.format(tomorrow);

    try {
      final result = await dio.get(dashboardUrl +
          "?start_date=" +
          todayFormatted +
          "&end_date=" +
          tomorrowFormatted);
      if (result.statusCode == 200) {
        return Dashboard.fromJson(result.data["message"]);
      } else {
        throw Exception();
      }
    } catch (err) {
      print(err);

      throw Exception(err);
    }
  }

  Future<SalesProfit> getSalesProfitData() async {
    final DateTime now = DateTime.now().add(const Duration(days: 1));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String todayFormatted = formatter.format(now);
    final DateTime old = DateTime(now.year, now.month, now.day - 6);
    final String oldFormatted = formatter.format(old);
    try {
      final result = await dio.get(
        dashboardUrl +
            "/chart" +
            "?start_date=" +
            oldFormatted +
            "&end_date=" +
            todayFormatted,
      );
      print(result.data["message"]);
      return SalesProfit.fromJson(result.data["message"]);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<List<RecentOrder>> getRecentOrders() async {
    try {
      final result = await dio.get(orderUrl);

      List<RecentOrder> recentOrders = [];
      for (dynamic d in result.data["message"]) {
        recentOrders.add(RecentOrder.fromJson(d));
      }
      return recentOrders;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<int?> createProduct(var p) async {
    try {
      final result = await dio.post(
        productUrl,
        data: p,
      );

      return result.statusCode;
    } catch (e) {}
  }

  Future<int?> updateProduct(var p) async {
    try {
      final result = await dio.put(
        productUrl,
        data: p,
      );

      return result.statusCode;
    } catch (e) {}
  }
}

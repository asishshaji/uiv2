import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uiv2/constants.dart';
import 'package:uiv2/screens/order.dart';
import 'package:uiv2/state/dashboard/dashboard_provider.dart';
import 'package:uiv2/widgets/stats.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(dashboardNotifierProvider.notifier).getDashboardData();
    });
    final now = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: SizedBox(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(FontAwesomeIcons.receipt),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OrderScreen()));
            },
          ),
        ),
      ),
      appBar: appBar(now),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                rowStats(),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 82, bottom: 20),
                    child: const Text(
                      "വിൽപ്പന ഗ്രാഫ്",
                      style: TextStyle(
                        fontFamily: "Mal",
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff2c4260),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: const EdgeInsets.only(bottom: 80),
                    width: screenWidth / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 5),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: const GraphWidget2(),
                        color: const Color(0xff2c4260),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 10,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: screenWidth / 4,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "ലാഭം",
                  style: TextStyle(
                    fontFamily: "Mal",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const GraphWidget(),
                      color: const Color(0xff2c4260),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "അടുത്തിടെ വിറ്റതു",
                  style: TextStyle(
                    fontFamily: "Mal",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const RecentOrdersWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar(DateTime now) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 80,
        ),
        child: Text(
          "Dashboard",
          style: GoogleFonts.dmSans(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          height: 30,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              DateFormat.yMMMMd('en_US').format(now),
              style: GoogleFonts.dmSans(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 8,
          ),
          child: CircularProfileAvatar(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf8kOwIhJJkqgqdTIzdm3XFiAxg3ccsjpCGbk6-dtZ38CudFYYkZhQYzQ8voR0Frq76Tw&usqp=CAU",
            backgroundColor: Colors.white,
            elevation: 5,
            radius: 30,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
      ],
    );
  }

  Column rowStats() {
    return Column(
      children: const [
        Stats(),
        SizedBox(height: 50),
      ],
    );
  }
}

BarTouchData get barTouchData => BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: const EdgeInsets.all(0),
        tooltipMargin: 20,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.y.round().toString(),
            const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

FlBorderData get borderData => FlBorderData(
      show: false,
    );

class RecentOrdersWidget extends ConsumerWidget {
  const RecentOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat formatter = DateFormat('MMMEd');
    final state = ref.watch(dashboardNotifierProvider);

    return state.when(
        initial: () => const Text("A"),
        loading: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
        data: (d, e, r) => ListView.builder(
              itemBuilder: (context, idx) => ListTile(
                title: Text(
                  r[idx].phone_number,
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  Constants.currency + " " + r[idx].profit.toString(),
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                  ),
                ),
                trailing: Text(
                  formatter.format(DateTime.parse(r[idx].created_at)),
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                  ),
                ),
              ),
              itemCount: r.length,
            ),
        error: (error) => Text(error.toString()));
  }
}

class GraphWidget extends ConsumerWidget {
  const GraphWidget({Key? key}) : super(key: key);
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat formatter = DateFormat('E, d');
    final state = ref.watch(dashboardNotifierProvider);

    return state.when(
      initial: () => const Text("A"),
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      data: (d, e, r) => BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (context, value) => const TextStyle(
                color: Color(0xff7589a2),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              margin: 20,
              getTitles: (double value) {
                return formatter.format(DateTime.parse(e.dates[value.toInt()]));
              },
            ),
            leftTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
          ),
          barTouchData: barTouchData,
          borderData: borderData,
          gridData: FlGridData(show: false),
          barGroups: e.profit_list
              .asMap()
              .entries
              .map((a) => BarChartGroupData(
                    x: a.key,
                    barRods: [
                      BarChartRodData(
                          y: a.value,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ))
              .toList(),
          alignment: BarChartAlignment.spaceAround,
          maxY: 4000,
        ),
      ),
      error: (error) => Center(
        child: Text(
          error.toString(),
          style: GoogleFonts.dmSans(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class GraphWidget2 extends ConsumerWidget {
  const GraphWidget2({Key? key}) : super(key: key);
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat formatter = DateFormat('MMMEd');
    final state = ref.watch(dashboardNotifierProvider);

    return state.when(
      initial: () => const Text("A"),
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      data: (d, e, r) => BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (context, value) => const TextStyle(
                color: Color(0xff7589a2),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              margin: 20,
              getTitles: (double value) {
                return formatter.format(DateTime.parse(e.dates[value.toInt()]));
              },
            ),
            leftTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
          ),
          barTouchData: barTouchData,
          borderData: borderData,
          gridData: FlGridData(show: false),
          barGroups: e.sales_list
              .asMap()
              .entries
              .map((a) => BarChartGroupData(
                    x: a.key,
                    barRods: [
                      BarChartRodData(
                          y: a.value,
                          colors: [Colors.lightBlueAccent, Colors.greenAccent])
                    ],
                    showingTooltipIndicators: [0],
                  ))
              .toList(),
          alignment: BarChartAlignment.spaceAround,
          maxY: 10000,
        ),
      ),
      error: (error) => Center(
        child: Text(
          error.toString(),
          style: GoogleFonts.dmSans(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uiv2/constants.dart';
import 'package:uiv2/state/dashboard/dashboard_provider.dart';
import 'package:uiv2/widgets/dashboard_card.dart';

class Stats extends ConsumerWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardNotifierProvider);

    return state.when(
      initial: () => const Text(
        'Press the button to start',
        textAlign: TextAlign.center,
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data, salesData, recentOrders) => Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: [
            DashboardGradientCard(
              title: data.orders.toString(),
              desc: "ഇന്ന് വിറ്റതു",
              icon: FontAwesomeIcons.boxOpen,
              colors: const [
                Colors.blueAccent,
                Colors.black,
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            DashboardGradientCard(
              title: Constants.currency + " " + data.profit.toString(),
              desc: "ഇന്നത്തെ ലാഭം",
              icon: FontAwesomeIcons.moneyBill,
              colors: const [
                Colors.redAccent,
                Colors.red,
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            DashboardGradientCard(
              title: Constants.currency + " " + data.sales.toString(),
              desc: "ഇന്നത്തെ വിൽപ്പന",
              icon: FontAwesomeIcons.moneyBillWave,
              colors: const [
                Colors.lightGreen,
                Colors.green,
              ],
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      error: (error) => const Text('Error Occured!'),
    ); // Hello world
  }
}

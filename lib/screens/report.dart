import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uiv2/models/dashboard.dart';
import 'package:uiv2/repositories/dashboard_repo.dart';
import 'package:uiv2/widgets/dashboard_card.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late DateTime startDate;
  late DateTime endDate;

  DashboardRepository dashboardRepository = DashboardRepository();
  Dashboard? dashboard;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) async {
    startDate = args.value.startDate;
    endDate = args.value.endDate;

    // yyyy-MM-dd

    DateFormat formatter = DateFormat('yyyy-MM-dd');

    dashboard = await dashboardRepository.getDashboardData(
        formatter.format(startDate), formatter.format(endDate));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("g"),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(
              height: height / 3,
              width: width,
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 350,
                    width: 350,
                    child: SfDateRangePicker(
                      onSelectionChanged: _onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.range,
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardGradientCard(
                          title: dashboard == null
                              ? "0"
                              : dashboard!.orders.toString(),
                          desc: "ഇന്ന് വിറ്റതു",
                          icon: FontAwesomeIcons.boxOpen,
                          colors: const [
                            Colors.blueAccent,
                            Colors.black,
                          ],
                        ),
                        DashboardGradientCard(
                          title: dashboard == null
                              ? "0"
                              : dashboard!.profit.toString(),
                          desc: "ഇന്നത്തെ ലാഭം",
                          icon: FontAwesomeIcons.moneyBill,
                          colors: const [
                            Colors.redAccent,
                            Colors.red,
                          ],
                        ),
                        DashboardGradientCard(
                          title: dashboard == null
                              ? "0"
                              : dashboard!.sales.toString(),
                          desc: "ഇന്നത്തെ വിൽപ്പന",
                          icon: FontAwesomeIcons.moneyBillWave,
                          colors: const [
                            Colors.lightGreen,
                            Colors.green,
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: width,
              color: Colors.red,
              child: Text("ASDSD"),
            ))
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uiv2/constants.dart';
import 'package:uiv2/models/dashboard.dart';
import 'package:uiv2/models/recentorders.dart';
import 'package:uiv2/repositories/dashboard_repo.dart';
import 'package:uiv2/widgets/dashboard_card.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  DateTime? startDate;
  DateTime? endDate;

  DashboardRepository dashboardRepository = DashboardRepository();
  Dashboard? dashboard;
  List<RecentOrder> recentOrders = [];

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) async {
    startDate = args.value.startDate;
    endDate = args.value.endDate;

    DateFormat formatter = DateFormat('yyyy-MM-dd');
    if (startDate != null && endDate != null) {
      dashboard = await dashboardRepository.getDashboardData(
          formatter.format(startDate!), formatter.format(endDate!));
      recentOrders = await dashboardRepository.getOrdersByDateRange(
          formatter.format(startDate!), formatter.format(endDate!));

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final DateFormat formatter = DateFormat('MMMEd');
    final DateFormat timeFormat = DateFormat.jm();
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
                    width: 280,
                    child: SfDateRangePicker(
                      onSelectionChanged: _onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.range,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
                child: SizedBox(
              width: width,
              child: recentOrders.isEmpty
                  ? const Center(
                      child: Text("ഈ തീയതിയിൽ ഡാറ്റയില",
                          style: TextStyle(
                              fontFamily: "Mal", fontWeight: FontWeight.bold)),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: DataTable(
                        columns: const [
                          DataColumn(
                              label: Text(
                            "ഐഡി",
                            style: TextStyle(
                                fontFamily: "Mal", fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text("ഫോൺ നമ്പർ",
                                  style: TextStyle(
                                      fontFamily: "Mal",
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text(
                            "വാങ്ങിയ സമയം ",
                            style: TextStyle(
                                fontFamily: "Mal", fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text("ലാഭം",
                                  style: TextStyle(
                                      fontFamily: "Mal",
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: recentOrders
                            .map((e) => DataRow(cells: [
                                  DataCell(
                                    Text(e.order_id.toString()),
                                  ),
                                  DataCell(
                                    Text(e.phone_number.toString()),
                                  ),
                                  DataCell(
                                    Row(
                                      children: [
                                        Text(
                                          formatter.format(
                                              DateTime.parse(e.created_at)),
                                          style: GoogleFonts.openSans(
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(", "),
                                        Text(
                                          timeFormat.format(
                                              DateTime.parse(e.created_at)
                                                  .toLocal()),
                                          style: GoogleFonts.openSans(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataCell(
                                    Text(Constants.currency +
                                        " " +
                                        e.profit.toString()),
                                  ),
                                ]))
                            .toList(),
                      ),
                    ),
            ))
          ],
        ));
  }
}

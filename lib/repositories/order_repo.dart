import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:uiv2/constants.dart';
import 'package:uiv2/models/order.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:uiv2/models/orderitem.dart';
import 'package:uiv2/models/product.dart';

class OrderRepository {
  final Dio dio = Dio();
  final orderUrl = "http://0.0.0.0:9090/order";

  Future<String> createOrderAndPrintReceipt(Order order) async {
    try {
      final result = await dio.post(orderUrl, data: order);
      print(result);
    } catch (e) {
      if (e is DioError) {
        return e.response!.data["message"];
      }
    }

    return "";
  }

  Future<void> printReceipt(String phoneNumber, List<Product> selectedProducts,
      Order o, double totalCost) async {
    final font = await PdfGoogleFonts.hindBold();
    var data = await rootBundle.load("assets/Manjari-Regular.ttf");
    var myFont = pw.Font.ttf(data);
    var myStyle = pw.TextStyle(font: myFont);

    final names = [[]];
    List<OrderItem> items = o.order_items;
    for (var p in selectedProducts) {
      final units = items
          .map((e) => [e.units, e.p_id])
          .where((element) => element[1] == p.id);
      String type = p.type == "P" ? "Pkt" : "kg";
      names.add([
        p.name,
        p.sell_price,
        units.first.first.toString() + "" + type,
      ]);
    }

    final doc = pw.Document();

    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a6,
        build: (context) => [
              buildTitle(myStyle),
              buildInvoice(names),
              buildTotal(totalCost, font),
            ]));

    try {
      await Printing.sharePdf(
          bytes: await doc.save(), filename: 'my-document.pdf');
    } catch (e) {
      print(e);
    }
  }

  static pw.Widget buildTitle(pw.TextStyle style) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    final String today = formatter.format(now);
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Center(
            child: pw.Padding(
          padding: const pw.EdgeInsets.only(top: 10, bottom: 20),
          child: pw.Text("തളിർ", style: style.copyWith(fontSize: 20)),
        )),
        pw.Padding(
            padding: const pw.EdgeInsets.only(top: 10, bottom: 10),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(today),
                pw.Text(currentTime.toString()),
              ],
            ))
      ],
    );
  }

  static pw.Widget buildInvoice(List<List> names) {
    final headers = ["Name", "Price", "Units"];

    return pw.Table.fromTextArray(
      headers: headers,
      data: names,
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.grey100),
      cellHeight: 30,
      border: null,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerRight,
        2: pw.Alignment.centerRight,
      },
    );
  }

  pw.Widget buildTotal(double totalCost, pw.Font font) {
    return pw.Container(
      alignment: pw.Alignment.centerRight,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Container(height: 1, color: PdfColors.grey400),
          pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
          pw.Container(height: 1, color: PdfColors.grey400),
          pw.Row(children: [
            pw.Text(
              "Total",
              style: pw.TextStyle(
                font: font,
              ),
            ),
            pw.Expanded(
                child: pw.Spacer(
              flex: 4,
            )),
            pw.Text(Constants.currency + " " + totalCost.toString(),
                style: pw.TextStyle(font: font)),
          ]),
        ],
      ),
    );
  }
}

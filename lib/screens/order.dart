import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:uiv2/constants.dart';
import 'package:uiv2/models/order.dart';
import 'package:uiv2/models/orderitem.dart';
import 'package:uiv2/models/product.dart';
import 'package:uiv2/repositories/order_repo.dart';
import 'package:uiv2/repositories/product_repo.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Product> products = [];
  List<Product> selectedProducts = [];

  ProductRepository productRepository = ProductRepository();

  Future<void> getProducts() async {
    final data = await productRepository.getProducts();
    setState(() {
      products = data;
    });
  }

  Map<int?, double?> orderItems = Map();
  String phoneNumber = "";
  double totalCost = 0;
  OrderRepository orderRepository = OrderRepository();

  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            List<OrderItem> oItems = List.empty(growable: true);
            orderItems.forEach((key, value) {
              oItems.add(OrderItem(p_id: key!, units: value!));
            });
            Order o = Order(order_items: oItems, phone_number: phoneNumber);
            String errorMessage =
                await orderRepository.createOrderAndPrintReceipt(o);
            if (errorMessage.isEmpty) {
              orderRepository.printReceipt(
                  phoneNumber, selectedProducts, o, totalCost);
              Toast.show(Constants.printingMsg, context);
            } else {
              Toast.show(errorMessage, context);
            }
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                Constants.snackBarMsg,
                style: const TextStyle(fontFamily: "Mal"),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "പ്രിന്റ് രസീത്",
          style: TextStyle(
            fontFamily: "Mal",
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 100,
          right: 100,
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'ഫോൺ നമ്പർ ',
                    labelText: 'ഫോൺ നമ്പർ  *',
                    hintStyle: TextStyle(fontFamily: "Mal", fontSize: 20),
                    labelStyle: TextStyle(fontFamily: "Mal", fontSize: 18),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ഉപഭോക്താവിന്റെ ഫോൺ നമ്പർ നൽകുക';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    phoneNumber = val;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(alignment: Alignment.topRight, child: addButton(context)),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columns: const [
                      DataColumn(
                          label: Text('ഐഡി',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: "Mal"))),
                      DataColumn(
                          label: Text('ഉത്പന്നത്തിന്റെ പേര്',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: "Mal"))),
                      DataColumn(
                          label: Text('വില',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: "Mal"))),
                      DataColumn(
                          label: Text('അളവ്‌',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: "Mal"))),
                      DataColumn(
                          label: Text('',
                              style:
                                  TextStyle(fontSize: 20.0, fontFamily: "Mal")))
                    ],
                    rows: selectedProducts
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.id.toString())),
                              DataCell(Text(e.name.toString())),
                              DataCell(Text(Constants.currency +
                                  " " +
                                  e.sell_price.toString())),
                              DataCell(TextField(
                                keyboardType: e.type.toString() == "R"
                                    ? TextInputType.number
                                    : const TextInputType.numberWithOptions(
                                        decimal: false),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(
                                        top: 20), // add padding to adjust text
                                    hintText: e.type.toString() == "P"
                                        ? "Packets"
                                        : "Kg"),
                                onChanged: (v) {
                                  if (orderItems.containsKey(e.id)) {
                                    orderItems.update(
                                        e.id,
                                        (value) =>
                                            v == "" ? 0 : double.parse(v));
                                  } else {
                                    orderItems.putIfAbsent(e.id,
                                        () => v == "" ? 0 : double.parse(v));
                                  }

                                  totalCost = 0;
                                  orderItems.forEach((k, v) {
                                    totalCost += products
                                            .where((element) => element.id == k)
                                            .first
                                            .sell_price! *
                                        v!;
                                  });

                                  setState(() {});
                                },
                              )),
                              DataCell(IconButton(
                                icon: const Icon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  selectedProducts.remove(e);
                                  setState(() {});
                                },
                              )),
                            ]))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "അടയ്ക്കേണ്ട തുക",
                          style: TextStyle(fontFamily: "Mal", fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          Constants.currency + " " + totalCost.toString(),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox addButton(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                List<Product> searchResultProducts = [];

                return StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    title: const Center(
                      child: Text(
                        'ഉൽപ്പന്നങ്ങൾ',
                        style: TextStyle(
                          fontFamily: "Mal",
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    content: SizedBox(
                      height: 600,
                      width: 600,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextField(
                              controller: _textController,
                              decoration: const InputDecoration(
                                hintText: 'Search Here...',
                              ),
                              onChanged: (value) {
                                searchResultProducts.clear();
                                if (value.isEmpty) {
                                  setState(() {});
                                  return;
                                }
                                for (var element in products) {
                                  if (element.name!
                                      .toLowerCase()
                                      .contains(value.toLowerCase())) {
                                    searchResultProducts.add(element);
                                  }
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: searchResultProducts.isNotEmpty
                                ? ListView.builder(
                                    itemCount: searchResultProducts.length,
                                    itemBuilder: (context, i) {
                                      return ListTile(
                                          title: Text(searchResultProducts[i]
                                              .name
                                              .toString()),
                                          subtitle: Text(searchResultProducts[i]
                                              .units
                                              .toString()),

                                          // ignore: avoid_print
                                          onTap: () {
                                            if (!selectedProducts.contains(
                                                searchResultProducts[i])) {
                                              selectedProducts
                                                  .add(searchResultProducts[i]);
                                            }
                                            setState(() {});
                                          });
                                    })
                                : ListView.builder(
                                    itemCount: products.length,
                                    itemBuilder: (context, i) {
                                      return ListTile(
                                          title: Text(
                                            products[i].name.toString(),
                                          ),
                                          subtitle: Text(
                                              products[i].units.toString()),
                                          // ignore: avoid_print
                                          onTap: () {
                                            if (!selectedProducts
                                                .contains(products[i])) {
                                              selectedProducts.add(products[i]);
                                            }
                                            setState(() {});
                                          });
                                    }),
                          )
                        ],
                      ),
                    ),
                  );
                });
              }).then((value) => setState(() {}));
        },
        child: const Text(
          "ഉൽപ്പന്നം ചേർക്കുക",
          style: TextStyle(fontFamily: "Mal", fontSize: 20),
        ),
      ),
    );
  }
}

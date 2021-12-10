import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toast/toast.dart';
import 'package:uiv2/models/product.dart';
import 'package:uiv2/state/dashboard/dashboard_provider.dart';

class CUDialog extends ConsumerStatefulWidget {
  final Product product;
  final bool create;
  const CUDialog({Key? key, required this.product, required this.create})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CUDialogState();
}

class _CUDialogState extends ConsumerState<CUDialog> {
  final _formKey = GlobalKey<FormState>();

  _dismissDialog(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AlertDialog(
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          'ഉൽപ്പന്നം ചേർക്കുക',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Mal",
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            var width = MediaQuery.of(context).size.width;

            return Container(
              width: width / 3,
              height: 420,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'ഉത്പന്നത്തിന്റെ പേര്',
                                labelText: 'ഉത്പന്നത്തിന്റെ പേര്',
                                labelStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              initialValue: widget.product.name,
                              onChanged: (e) {
                                widget.product.name = e.toString();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'വാങ്ങിയ വില ₹',
                                labelText: 'വാങ്ങിയ വില ₹',
                                labelStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              initialValue: widget.product.buy_price.toString(),
                              onChanged: (e) {
                                widget.product.buy_price =
                                    e == "" ? 0 : double.parse(e.toString());
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'വിൽക്കുന്ന വില ₹',
                                labelText: 'വിൽക്കുന്ന വില ₹',
                                labelStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              initialValue:
                                  widget.product.sell_price.toString(),
                              onChanged: (e) {
                                widget.product.sell_price =
                                    e == "" ? 0 : double.parse(e.toString());
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, top: 5),
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              value: widget.product.type,
                              onChanged: (String? val) {
                                widget.product.type = val;
                                setState(() {});
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  child: Text(
                                    "പാക്കറ്റ് ",
                                    style: TextStyle(
                                      fontFamily: "Mal",
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  value: "P",
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    "കിലോ ",
                                    style: TextStyle(
                                      fontFamily: "Mal",
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  value: "R",
                                ),
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'യൂണിറ്റുകൾ',
                                labelText: 'യൂണിറ്റുകൾ',
                                labelStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: "Mal",
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              initialValue: widget.product.units.toString(),
                              onChanged: (e) {
                                widget.product.units =
                                    e == "" ? 0 : double.parse(e.toString());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                              child: const Text(
                                "സേവ് ",
                                style: TextStyle(
                                    fontFamily: "Mal",
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              onPressed: () async {
                                if (widget.create) {
                                  await ref
                                      .read(dashboardNotifierProvider.notifier)
                                      .createProduct(widget.product);
                                } else {
                                  await ref
                                      .read(dashboardNotifierProvider.notifier)
                                      .updateProduct(widget.product);
                                }
                                // if (code == 200) {
                                // Toast.show("Product updated", context,
                                //     gravity: Toast.BOTTOM);
                                Navigator.pop(context);
                                // } else {
                                //   Toast.show(
                                //     "ഉൽപ്പന്നം സൃഷ്ടിക്കാൻ കഴിഞ്ഞില്ല",
                                //     context,
                                //     gravity: Toast.BOTTOM,
                                //     backgroundColor: Colors.red,
                                //   );
                                ref
                                    .read(dashboardNotifierProvider.notifier)
                                    .getDashboardData();
                                // }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                              ),
                              child: const Text("Close"),
                              onPressed: () {
                                _dismissDialog(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

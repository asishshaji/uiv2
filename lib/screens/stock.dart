import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiv2/models/product.dart';
import 'package:uiv2/repositories/product_repo.dart';
import 'package:uiv2/screens/create_update.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  List<Product> products = [];
  List<Product> searchResultProducts = [];

  ProductRepository productRepository = ProductRepository();
  final TextEditingController _textController = TextEditingController();

  Future<void> getProducts() async {
    final data = await productRepository.getProducts();
    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  hintText: 'ഉൽപ്പന്നത്തിന്റെ പേര് നൽകുക',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
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
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Product p = Product();
                  p.buy_price = 0;
                  p.sell_price = 0;
                  p.type = "P";
                  p.units = 0;
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => CUDialog(
                        product: p,
                        create: true,
                      ),
                    ),
                  )
                      .then((value) {
                    getProducts();
                  });
                },
                child: const Text(
                  "ഉൽപ്പന്നം ചേർക്കുക",
                  style: TextStyle(
                    fontFamily: "Mal",
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              Expanded(
                child: searchResultProducts.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView.builder(
                            itemCount: searchResultProducts.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                trailing: Row(
                                  children: [
                                    IconButton(
                                      iconSize: 18,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => CUDialog(
                                              product: searchResultProducts[i],
                                              create: false,
                                            ),
                                          ),
                                        );
                                        getProducts();
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 18,
                                      onPressed: () async {
                                        await productRepository.deleteProduct(
                                            searchResultProducts[i].id!);
                                        getProducts();
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.trash,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  searchResultProducts[i].name.toString(),
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  searchResultProducts[i].units.toString() +
                                      (searchResultProducts[i]
                                                  .type
                                                  .toString() ==
                                              "P"
                                          ? " Packets"
                                          : " Kg"),
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                trailing: SizedBox(
                                  width: 80,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        iconSize: 18,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => CUDialog(
                                                product: products[i],
                                                create: false,
                                              ),
                                            ),
                                          );
                                          getProducts();
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.edit,
                                          color: Colors.black,
                                        ),
                                      ),
                                      IconButton(
                                        iconSize: 18,
                                        onPressed: () async {
                                          await productRepository
                                              .deleteProduct(products[i].id!);
                                          getProducts();
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.trash,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text(
                                  products[i].name.toString(),
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  products[i].units.toString() +
                                      (products[i].type.toString() == "P"
                                          ? " Packets"
                                          : " Kg"),
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                  ),
                                ),
                                // ignore: avoid_print
                              );
                            }),
                      ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

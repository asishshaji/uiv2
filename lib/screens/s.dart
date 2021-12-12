recentOrders
                            .map(
                              (e) => DataRow(
                                onSelectChanged: (_) async {
                                  orderPreview = await orderRepository
                                      .getOrderDetailsById(e.order_id);
                                  setState(() {});
                                  print(orderPreview);
                                },
                                cells: [
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
                                ],
                              ),
                            )
                            .toList()
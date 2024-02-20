import 'package:flutter/material.dart';

class HotDeals extends StatefulWidget {
  final int count;
  final List<Map<String, dynamic>> items;
  final String title;
  final String subTitle;
  final double size;
  final double cardHeight;
  const HotDeals(
      {super.key,
      required this.count,
      required this.items,
      required this.title,
      required this.subTitle,
      required this.size,
      required this.cardHeight});

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      // hot deals
      height: widget.size,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.subTitle,
          ),
          Expanded(
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: widget.cardHeight,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: widget.count,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 250,
                    height: 450,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                            widget.items[index]['publication']['media'][0]
                                ['uri'],
                          ),
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('images/default.webp');
                          },
                        ),
                        Text(
                          widget.items[index]['publication']['productName'],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.items[index]['publication']['priceInfo']
                                        ['couponDiscountRate'] !=
                                    null
                                ? Text(
                                    '${widget.items[index]['publication']['priceInfo']['couponDiscountRate']}%',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : widget.items[index]['publication']
                                            ['priceInfo']['discountRate'] !=
                                        null
                                    ? Text(
                                        '${widget.items[index]['publication']['priceInfo']['discountRate']}%',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                            Text(
                              "${widget.items[index]['publication']['priceInfo']['price']}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "원",
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.items[index]['publication']['applyCoupon']
                                ? const Text(
                                    'Coupon',
                                    style: TextStyle(color: Colors.red),
                                  )
                                : const SizedBox.shrink(),

                            // rating
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.black87,
                                  size: 12,
                                ),
                                Text(
                                  widget.items[index]['publication']['rating']
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

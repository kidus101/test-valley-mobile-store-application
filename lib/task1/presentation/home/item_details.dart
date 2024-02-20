import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final List items;
  const ItemDetails({super.key, required this.items});


  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Container(
      // hot deals
      height: size.height * 1.7,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'HOT DEAL',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "HAPPY HOUR",
          ),
          Expanded(
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: size.height * 0.38,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 250,
                    height: 450,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(widget.items[index]['publication']['media'][0]['uri']),
                        ),
                        Text(
                          widget.items[index]['publication']['productName'],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.items[index]['publication']['priceInfo']['couponDiscountRate'] != null
                                ? Text(
                                    '${widget.items[index]['publication']['priceInfo']['couponDiscountRate']}%',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : widget.items[index]['publication']['priceInfo']['discountRate'] != null
                                    ? Text(
                                        '${widget.items[index]['publication']['priceInfo']['discountRate']}%',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                            Text(
                              widget.items[index]['publication']['priceInfo']['price']
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
                  );
                }),
          ),
        ],
      ),
    );
  }
}
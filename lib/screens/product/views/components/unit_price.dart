import 'package:flutter/material.dart';

import '../../../../constants.dart';

class UnitPrice extends StatelessWidget {
  const UnitPrice({
    super.key,
    this.priceAfterDiscount,
  });

  final dynamic priceAfterDiscount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Unit price",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: defaultPadding / 1),
        Text.rich(
          TextSpan(
            text:
                "\$${priceAfterDiscount!}  ",
            style: Theme.of(context).textTheme.titleLarge,

          ),
        )
      ],
    );
  }
}

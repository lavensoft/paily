import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class PaymentAccountInputForm extends StatelessWidget {
  const PaymentAccountInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      children: [
        bankSelect(context),
        numberInput(context),
        nameInput(context),
      ],
    );
  }

  Widget bankSelect(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 249, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        )
      ),
      child: Row(
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: CachedNetworkImage(
              imageUrl: 'https://ibrand.vn/wp-content/uploads/2022/10/NDTH-Vietcombank-3-min.png',
              width: 48,
              height: 48,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vietcombank', 
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'NH THCP Ngoai Thuong VN', 
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ),
          Icon(
            HugeIcons.strokeRoundedArrowRight01,
            size: 21,
          )
        ],
      ),
    );
  }

  Widget numberInput(BuildContext context) {
    final theme = Theme.of(context);
    TextEditingController controller = TextEditingController();

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        controller.addListener(() {
          setState(() {});
        });

        return Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 12,
            top: 6,
            bottom: 6,
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(246, 246, 249, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintStyle: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.blueGrey,
                    ),
                    hintText: 'Account number',
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (controller.text.isNotEmpty)
                IconButton(
                  icon: Icon(
                    HugeIcons.strokeRoundedCancel01,
                  ),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              Icon(
                HugeIcons.strokeRoundedContact,
                size: 21,
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget nameInput(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 12,
        top: 6,
        bottom: 6,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 249, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
            Expanded(
            child: TextField(
              enabled: false,
              style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.black,
              ),
              decoration: InputDecoration(
              hintStyle: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.blueGrey,
              ),
              hintText: 'Account name',
              border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
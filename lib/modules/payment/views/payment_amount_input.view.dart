import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_typography.theme.dart';
import 'package:paily/shared/widgets/button.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class PaymentAmountInputView extends StatelessWidget {
  const PaymentAmountInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            title: 'Payment amount input',
          ),
          bottomNavigationBar: bottomBar(context),
          body: Padding(
            padding: AppPaddingTheme.viewPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                bankSelect(context),
                inputForm(context),
              ]
            )
          ),
        ),
      )
    );
  }

  Widget bottomBar(BuildContext context) {
    return Padding(
      padding: AppPaddingTheme.viewPadding,
      child: Column(
        spacing: 21,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(246, 246, 249, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 15,
              ),
              hintText: 'Transaction remark',
              hintStyle: AppTypography.bodyText.copyWith(
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                HugeIcons.strokeRoundedMessage02
              )
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Button(
              'Next', 
              onPressed: () {}
            )
          )
        ],
      )
    );
  }

  Widget inputForm(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextField(
              inputFormatters: <TextInputFormatter>[
                CurrencyTextInputFormatter.currency(
                  locale: 'vi',
                  decimalDigits: 0,
                  symbol: 'đ',
                ),
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '0 đ',
                hintStyle: AppTypography.largeTitle3.copyWith(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: AppTypography.largeTitle3,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            '\$ 23.000.000',
            style: AppTypography.headline,
          )
        ],
      )
    );
  }

  Widget bankSelect(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 249, 1),
        borderRadius: BorderRadius.circular(15)
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
                  style: AppTypography.bodyText.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'NH THCP Ngoai Thuong VN', 
                  style: AppTypography.bodyText.copyWith(
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
}
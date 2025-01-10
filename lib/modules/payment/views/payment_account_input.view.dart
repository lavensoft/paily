import 'package:flutter/material.dart';
import 'package:paily/modules/payment/widgets/payment_account_input_appbar.widget.dart';
import 'package:paily/modules/payment/widgets/payment_account_input_form.widget.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/button.widget.dart';

class PaymentAccountInputView extends StatelessWidget {
  const PaymentAccountInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PaymentAccountInputAppBar(),
          bottomNavigationBar: Padding(
            padding: AppPaddingTheme.viewPadding,
            child: Button(
              'Next',
              onPressed: () {},
            ),
          ),
          body: SingleChildScrollView(
            padding: AppPaddingTheme.viewPadding,
            child: Column(
              children: [
                PaymentAccountInputForm(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
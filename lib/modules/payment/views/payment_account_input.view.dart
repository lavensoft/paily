import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/payment/views/payment_amount_input.view.dart';
import 'package:paily/modules/payment/widgets/payment_account_input_appbar.widget.dart';
import 'package:paily/modules/payment/widgets/payment_account_input_form.widget.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';

class PaymentAccountInputView extends ConsumerWidget {
  const PaymentAccountInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PaymentAccountInputAppBar(),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: AppPaddingTheme.contentPadding,
                  child: Column(
                    children: [
                      PaymentAccountInputForm(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: AppPaddingTheme.contentPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    child: Text('Next'),
                    onPressed: () {
                      Navigator
                        .of(context)
                        .push(
                          CupertinoPageRoute(builder: (context) => PaymentAmountInputView())
                        );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/bank/models/bank.model.dart';
import 'package:paily/modules/payment/providers/payment.provider.dart';
import 'package:paily/modules/payment/views/payment_confirm.view.dart';
import 'package:paily/modules/wallet/models/wallet_transaction.model.dart';
import 'package:paily/shared/helpers/formatter.helper.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class PaymentAmountInputView extends ConsumerWidget {
  const PaymentAmountInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payment = ref.watch(paymentNotifierProvider);
    final paymentNotifier = ref.watch(paymentNotifierProvider.notifier);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(
            title: 'Payment amount input',
          ),
          body: Padding(
            padding: AppPaddingTheme.contentPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                bankSelect(context, payment.toBank!.bank!),
                inputForm(context, ref, payment, paymentNotifier),
                bottomBar(context, ref),
              ]
            )
          ),
        ),
      )
    );
  }

  Widget bankSelect(BuildContext context, Bank bank) {
    final theme = Theme.of(context);

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
              imageUrl: bank.iconImageUrl,
              width: 48,
              height: 48,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bank.shortName, 
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  bank.name, 
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
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
            hintStyle: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              HugeIcons.strokeRoundedMessage02
            ),
          ),
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) {
            ref
              .watch(paymentNotifierProvider.notifier)
              .updateNote(value);
          },
        ),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            child: Text('Next'), 
            onPressed: () {
              Navigator
                .of(context)
                .push(
                  CupertinoPageRoute(builder: (context) => PaymentConfirmView())
                );
            }
          )
        )
      ],
    );
  }

  Widget inputForm(BuildContext context, WidgetRef ref, WalletTransaction payment, PaymentNotifier paymentNotifier) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextField(
              autofocus: true,
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
                hintStyle: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                if (value.isEmpty) {
                  paymentNotifier.updateAmount(0);
                  return;
                }

                double amount = double.parse(
                  value
                    .replaceAll('đ', '')
                    .replaceAll('.', '')
                    .replaceAll(',', '')
                );
                paymentNotifier.updateAmount(amount);
              },
            ),
          ),
          Text(
            '≈ \$${
              FormatHelper.formatNumber(payment.amountLocalCur ?? 0)
            }',
            style: theme.textTheme.bodyLarge,
          )
        ],
      )
    );
  }

  // KeyboardActionsConfig _buildConfig(BuildContext context) {
  //   final FocusNode _amountNode = FocusNode();

  //   return KeyboardActionsConfig(
  //     keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
  //     keyboardBarColor: Colors.grey[200],
  //     nextFocus: true,
  //     actions: [
  //         KeyboardActionsItem(
  //         focusNode: _amountNode,
  //         toolbarButtons: [
  //           //button 1
  //           (node) {
  //             return GestureDetector(
  //               onTap: () => node.unfocus(),
  //               child: Container(
  //                 color: Colors.white,
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Text(
  //                   "CLOSE",
  //                   style: TextStyle(color: Colors.black),
  //                 ),
  //               ),
  //             );
  //           },
  //           //button 2
  //           (node) {
  //             return GestureDetector(
  //               onTap: () => node.unfocus(),
  //               child: Container(
  //                 color: Colors.black,
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Text(
  //                   "DONE",
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //             );
  //           }
  //         ],
  //       ),
  //     ],
  //   );
  // }
}
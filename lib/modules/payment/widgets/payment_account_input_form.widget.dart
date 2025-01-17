import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/bank/models/bank_beneficiary.model.dart';
import 'package:paily/modules/bank/providers/bank.provider.dart';
import 'package:paily/modules/payment/providers/payment.provider.dart';
import 'package:paily/modules/payment/widgets/bank_select_bottom_sheet.widget.dart';
import 'package:paily/modules/wallet/models/wallet_transaction.model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentAccountInputForm extends HookConsumerWidget {
  const PaymentAccountInputForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentNotifier = ref.watch(paymentNotifierProvider.notifier);
    final payment = ref.watch(paymentNotifierProvider);

    return Column(
      spacing: 3,
      children: [
        bankSelect(
          context, 
          ref,
          paymentNotifier,
          payment,
        ),
        numberInput(
          context,
          paymentNotifier,
          payment,
        ),
        nameInput(
          context,
          paymentNotifier,
          payment,
        ),
      ],
    );
  }

  Widget bankSelect(BuildContext context, WidgetRef ref, PaymentNotifier paymentNotifier, WalletTransaction payment) {
    final theme = Theme.of(context);
    final bank = ref.watch(listBankProvider);

    Widget input(
      String imageUrl,
      String shortName,
      String name,
    ) {
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
              child: Visibility(
                visible: imageUrl.isNotEmpty,
                replacement: Container(),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 48,
                  height: 48,
                )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shortName, 
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    name, 
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

    bank.whenData((value) {
      if (payment.toBank?.bank == null && value.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          paymentNotifier.updateToBank(
            payment.toBank?.copyWith(bank: value.first) ?? BankBeneficiary(bank: value.first)
          );
        });
      }
    });

    return switch(bank) {
      AsyncError() => Text('Error'),
      AsyncData(:final value) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BankSelectBottomSheet(
                banks: value,
                onSelected: (selected) {
                  paymentNotifier.updateToBank(
                    payment.toBank?.copyWith(bank: selected) ?? BankBeneficiary(bank: selected)
                  );
                },
              );
            },
          );
        },
        child: input(
          payment.toBank?.bank?.iconImageUrl ?? '',
          payment.toBank?.bank?.shortName ?? '',
          payment.toBank?.bank?.name ?? '',
        ),
      ),
      _ => Skeletonizer(
        child: input('', 'Bank', 'Bank name')
      ),
    };
  }

  Widget numberInput(BuildContext context, PaymentNotifier paymentNotifier, WalletTransaction payment) {
    final theme = Theme.of(context);
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
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
                  controller: TextEditingController(text: payment.toBank?.accountNumber),
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
                  keyboardType: TextInputType.number,
                  onTapOutside: (e) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    paymentNotifier.updateToBank(
                      payment.toBank?.copyWith(accountNumber: value) ?? BankBeneficiary(accountNumber: value)
                    );
                  },
                ),
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
  
  Widget nameInput(BuildContext context, PaymentNotifier paymentNotifier, WalletTransaction payment) {
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
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              onTapOutside: (e) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                paymentNotifier.updateToBank(
                  payment.toBank?.copyWith(accountName: value) ?? BankBeneficiary(accountName: value)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/modules/bank/models/bank.model.dart';
import 'package:paily/modules/bank/models/bank_beneficiary.model.dart';
import 'package:paily/modules/bank/providers/bank.provider.dart';
import 'package:paily/modules/payment/widgets/bank_select_bottom_sheet.widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentAccountInputForm extends HookConsumerWidget {
  const PaymentAccountInputForm({super.key, this.onChanged});

  final Function(BankBeneficiary)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beneficiary = useState<BankBeneficiary>(BankBeneficiary());

    return Column(
      spacing: 3,
      children: [
        bankSelect(
          context, 
          ref,
          (selected) {
            beneficiary.value = beneficiary.value.copyWith(bank: selected);
            onChanged?.call(beneficiary.value);
          },
        ),
        numberInput(
          context,
          (value) {
            beneficiary.value = beneficiary.value.copyWith(accountNumber: value);
            onChanged?.call(beneficiary.value);
          },
        ),
        nameInput(
          context,
          (value) {
            beneficiary.value = beneficiary.value.copyWith(accountName: value);
            onChanged?.call(beneficiary.value);
          },
        ),
      ],
    );
  }

  Widget bankSelect(BuildContext context, WidgetRef ref, Function(Bank) onSelected) {
    final theme = Theme.of(context);
    final bank = ref.watch(listBankProvider);
    final selectedBank = useState<Bank?>(null);

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
      selectedBank.value ??= value.first;
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
                  selectedBank.value = selected;
                },
              );
            },
          );
        },
        child: input(
          selectedBank.value?.iconImageUrl ?? '',
          selectedBank.value?.shortName ?? '',
          selectedBank.value?.name ?? '',
        ),
      ),
      _ => Skeletonizer(
        child: input('', 'Bank', 'Bank name')
      ),
    };
  }

  Widget numberInput(BuildContext context, Function(String)? onChanged) {
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
                    onChanged?.call(value);
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
  
  Widget nameInput(BuildContext context, Function(String)? onChanged) {
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
              onTapOutside: (e) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                onChanged?.call(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/modules/bank/models/bank.model.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';

class BankSelectBottomSheet extends StatelessWidget {
  const BankSelectBottomSheet({super.key, required this.banks, this.onSelected});

  final List<Bank> banks;
  final Function(Bank)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddingTheme.contentPadding,
      child: ListView.builder(
        itemCount: banks.length,
        itemBuilder: (context, index) {
          final bank = banks[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: CachedNetworkImage(
                imageUrl: bank.iconImageUrl,
              ),
            ),
            title: Text(bank.shortName),
            subtitle: Text(bank.name),
            onTap: () {
              onSelected?.call(bank);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
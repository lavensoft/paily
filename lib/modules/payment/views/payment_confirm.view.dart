import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class PaymentConfirmView extends StatefulWidget {
  const PaymentConfirmView({super.key});

  @override
  _PaymentConfirmViewState createState() => _PaymentConfirmViewState();
}

class _PaymentConfirmViewState extends State<PaymentConfirmView> {
  int _selectedCardIndex = -1;

  void _onCardSelected(int index) {
    setState(() {
      _selectedCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Scaffold(
        appBar: ViewAppBar(
          title: 'Payment Confirm',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SectionGroup(
                title: 'Wallet & Card',
                itemBuilder: (context, index) {
                  return WalletCard(
                    index: index,
                    isSelected: index == _selectedCardIndex,
                    onSelect: _onCardSelected,
                    image: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fflags%2FUSDT%20Background.jpg?alt=media&token=2317cdf9-fc22-4610-ac22-c2e8dde5cfac',
                    title: 'USDT',
                    balance: '100.00',
                  );
                },
              ),
              SectionGroup(
                title: 'Transaction Details',
                child: Text('A'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onSelect;
  final String image;
  final String title;
  final String balance;

  const WalletCard({
    super.key, 
    required this.index,
    required this.isSelected,
    required this.onSelect,
    required this.image,
    required this.title,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.yellow : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          spacing: 12,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              width: 30,
              height: 30,
            ),
            Column(
              children: [
                Text(title),
                Text(balance),
              ],
            )
          ],
        ),
      ),
    );
  }
}
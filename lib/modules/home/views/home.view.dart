import 'package:flutter/material.dart';
import 'package:paily/modules/home/widgets/balance_card.widget.dart';
import 'package:paily/modules/home/widgets/home_header.widget.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/head_search_bar.widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppPaddingTheme.viewPadding),
          child: Column(
            children: [
              HeadSearchBar(),
              BalanceCard()
            ],
          ),
        ),
      ),
    );
  }
}
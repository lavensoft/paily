import 'package:flutter/material.dart';
import 'package:paily/modules/home/widgets/balance_card.widget.dart';
import 'package:paily/modules/home/widgets/home_header.widget.dart';
import 'package:paily/modules/home/widgets/mini_app_button.widget.dart';
import 'package:paily/modules/home/widgets/section_group.widget.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/action_banner.widget.dart';
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

              SizedBox(height: 15,),
              BalanceCard(),

              SizedBox(height: 24,),
              ActionBanner(
                title: 'Hello',
                description: 'This is a description',
                onClose: () {},
                onTryItOut: () {},
                backgroundImage: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fflags%2FUSDT%20Background.jpg?alt=media&token=2317cdf9-fc22-4610-ac22-c2e8dde5cfac',
              ),

              SizedBox(height: 24,),
              SectionGroup(
                title: 'Recent Transactions',
                child: Row(
                  children: [
                    MiniAppButton(
                      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
                      label: 'Mini app', 
                      onTap: () {  },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
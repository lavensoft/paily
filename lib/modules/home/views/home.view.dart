import 'package:flutter/material.dart';
import 'package:paily/modules/home/widgets/balance_card.widget.dart';
import 'package:paily/modules/home/widgets/home_header.widget.dart';
import 'package:paily/modules/home/widgets/mini_app_button.widget.dart';
import 'package:paily/modules/store/views/store.view.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/action_banner.widget.dart';
import 'package:paily/shared/widgets/head_search_bar.widget.dart';
import 'package:paily/shared/widgets/image_card.widget.dart';
import 'package:paily/shared/widgets/product_card.widget.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: Padding(
        padding: AppPaddingTheme.viewPadding,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: HeadSearchBar(),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: BalanceCard(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 24),
                child: ActionBanner(
                  title: 'Hello',
                  description: 'This is a description',
                  onClose: () {},
                  onTryItOut: () {},
                  backgroundImage: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fflags%2FUSDT%20Background.jpg?alt=media&token=2317cdf9-fc22-4610-ac22-c2e8dde5cfac',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 24),
                child: SectionGroup(
                  title: 'Services',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MiniAppButton(
                        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
                        label: 'Mini app', 
                        onTap: () {  },
                      ),
                      MiniAppButton(
                        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
                        label: 'Mini app', 
                        onTap: () {  },
                      ),
                      MiniAppButton(
                        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
                        label: 'Mini app', 
                        onTap: () {  },
                      ),
                      MiniAppButton(
                        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fmini-apps%2FCGV%20App%20Icon.png?alt=media&token=e7a676e6-80ad-4e92-a61d-dfb892262879', 
                        label: 'Mini app', 
                        onTap: () {  },
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                margin: EdgeInsets.only(top: 24),
                child: SectionGroup(
                  title: 'Services',
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return ImageCard(
                      imageUrl: 'https://vietnamhoneymoontravel.com/wp-content/uploads/2021/09/Introduction-to-Danang-The-Most-Livable-City-in-Vietnam.jpg', 
                      title: 'Hello', 
                      description: 'This is a description',
                      width: 240,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreView(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                margin: EdgeInsets.only(top: 24),
                child: SectionGroup(
                  title: 'Services',
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imageUrl: 'https://vietnamhoneymoontravel.com/wp-content/uploads/2021/09/Introduction-to-Danang-The-Most-Livable-City-in-Vietnam.jpg', 
                      title: 'Hello', 
                      description: 'This is a description',
                      width: 240,
                      height: 300,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/home/widgets/balance_card.widget.dart';
import 'package:paily/modules/home/widgets/home_header.widget.dart';
import 'package:paily/modules/home/widgets/mini_app_button.widget.dart';
import 'package:paily/modules/mini_app/providers/mini_app.provider.dart';
import 'package:paily/modules/store/providers/store.provider.dart';
import 'package:paily/modules/store/views/store.view.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/action_banner.widget.dart';
import 'package:paily/shared/widgets/head_search_bar.widget.dart';
import 'package:paily/shared/widgets/image_card.widget.dart';
import 'package:paily/shared/widgets/product_card.widget.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storeServiceProvider);
    final miniApp = ref.watch(miniAppServiceProvider);

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
                  child: switch(miniApp) {
                    AsyncData(:final value) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: value.map((app) {
                        return MiniAppButton(
                          imageUrl: app.iconImageUrl, 
                          label: app.name, 
                          onTap: () {  },
                        );
                      }).toList(),
                    ),
                    AsyncError() => Text('Error'),
                    _ => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return MiniAppButton(
                          loading: true,
                        );
                      }),
                    ),
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                margin: EdgeInsets.only(top: 24),
                child: switch(store) {
                  AsyncData(:final value) => SectionGroup(
                    title: 'Services',
                    itemCount: value.length,
                    itemBuilder: (context, i) {
                      return ImageCard(
                        imageUrl: value[i].imageUrls[0], 
                        title: value[i].name, 
                        description: value[i].description,
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
                  AsyncError() => Text('Error'),
                  _ => SectionGroup(
                    title: 'Services',
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ImageCard(
                        loading: true,
                        width: 240,
                      );
                    },
                  ),
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                margin: EdgeInsets.only(top: 24),
                child: switch(store) {
                  AsyncData(:final value) => SectionGroup(
                  title: 'Services',
                  itemCount: value.length,
                  itemBuilder: (context, i) {
                    return ProductCard(
                      imageUrl: value[i].imageUrls[0], 
                      title: value[i].name, 
                      description: value[i].description,
                      width: 240,
                    );
                  },
                ),
                  AsyncError() => Text('Error'),
                  _ => SectionGroup(
                    title: 'Services',
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        loading: true,
                        width: 240,
                      );
                    },
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
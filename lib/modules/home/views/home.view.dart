import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paily/modules/home/widgets/balance_card.widget.dart';
import 'package:paily/modules/home/widgets/home_header.widget.dart';
import 'package:paily/modules/home/widgets/mini_app_button.widget.dart';
import 'package:paily/modules/mini_app/providers/mini_app.provider.dart';
import 'package:paily/modules/payment/views/payment_account_input.view.dart';
import 'package:paily/modules/store/enums/store_type.enum.dart';
import 'package:paily/modules/store/providers/store.provider.dart';
import 'package:paily/modules/store/views/store.view.dart';
import 'package:paily/modules/wallet/providers/wallet.provider.dart';
import 'package:paily/shared/widgets/action_banner.widget.dart';
import 'package:paily/shared/widgets/image_card.widget.dart';
import 'package:paily/shared/widgets/product_card.widget.dart';
import 'package:paily/shared/widgets/section_group.widget.dart';
import 'package:paily/shared/widgets/sliver_section.widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storeServiceProvider);
    final miniApp = ref.watch(miniAppServiceProvider);
    final walletTotalBalance = ref.watch(walletTotalBalanceProvider);

    return Scaffold(
      appBar: HomeHeader(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          // SliverSection(
          //   child: HeadSearchBar()
          // ),
          SliverSection(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: switch(walletTotalBalance) {
                AsyncData(:final value) => BalanceCard(
                  localBalance: value.localBalance,
                  foreignBalance: value.foreignBalance,
                  localCurrencySymbol: value.localCurrencySymbol,
                  foreignCurrencySymbol: value.foreignCurrencySymbol,
                ),
                AsyncError() => Text('Error'),
                _ => BalanceCard(
                  loading: true,
                ),
              },
            ),
          ),
          SliverSection(
            child: Container(
              margin: EdgeInsets.only(top: 24),
              child: ActionBanner(
                title: 'Say hello to USDC',
                description: 'Now you can top up and pay through USDC quickly and easily',
                onClose: () {},
                onTryItOut: () {
                  Navigator
                    .of(context)
                    .push(
                      CupertinoPageRoute(
                        builder: (context) => PaymentAccountInputView(),
                      )
                    );
                },
                backgroundImage: 'https://firebasestorage.googleapis.com/v0/b/paily-app.firebasestorage.app/o/assets%2Fbanners%2FUSDC%20Banner.png?alt=media&token=6d3eecab-9fb4-4e5c-8ce1-d19f2f8742fa',
              ),
            ),
          ),
          SliverSection(
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
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming soon'),
                            ),
                          );
                        },
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
          SliverSection(
            child: Container(
              height: 300,
              margin: EdgeInsets.only(top: 24),
              child: switch(store) {
                AsyncData(:final value) => SectionGroup(
                  title: 'Landscape',
                  itemCount: value.where((item) => item.type == EStoreType.landscape).length,
                  itemBuilder: (context, i) {
                    final item = value.where((item) => item.type == EStoreType.landscape).toList()[i];
                    return ImageCard(
                      imageUrl: item.imageUrls[0], 
                      title: item.name, 
                      description: item.description,
                      width: 240,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreView(store: item,),
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
          SliverSection(
            child: Container(
              height: 300,
              margin: EdgeInsets.only(top: 24),
              child: switch(store) {
                AsyncData(:final value) => SectionGroup(
                  title: 'Park',
                  itemCount: value.where((item) => item.type == EStoreType.park).length,
                  itemBuilder: (context, i) {
                    final item = value.where((item) => item.type == EStoreType.park).toList()[i];
                    return ImageCard(
                      imageUrl: item.imageUrls[0], 
                      title: item.name, 
                      description: item.description,
                      width: 240,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreView(store: item,),
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
          SliverSection(
            child: Container(
              height: 300,
              margin: EdgeInsets.only(top: 24),
              child: switch(store) {
                AsyncData(:final value) => SectionGroup(
                title: 'Hotel',
                itemCount: value.where((item) => item.type == EStoreType.hotel).length,
                itemBuilder: (context, i) {
                    final item = value.where((item) => item.type == EStoreType.hotel).toList()[i];
                  return ProductCard(
                    imageUrl: item.imageUrls[0], 
                    title: item.name, 
                    description: item.description,
                    width: 240,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreView(store: item,),
                        ),
                      );
                    },
                  );
                },
              ),
                AsyncError() => Text('Error'),
                _ => SectionGroup(
                  title: 'Hotel',
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
          SliverSection(
            child: Container(
              height: 300,
              margin: EdgeInsets.only(top: 24, bottom: 48),
              child: switch(store) {
                AsyncData(:final value) => SectionGroup(
                title: 'Restaurant',
                itemCount: value.where((item) => item.type == EStoreType.restaurant).length,
                itemBuilder: (context, i) {
                    final item = value.where((item) => item.type == EStoreType.restaurant).toList()[i];
                  return ProductCard(
                    imageUrl: item.imageUrls[0], 
                    title: item.name, 
                    description: item.description,
                    width: 240,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreView(store: item,),
                        ),
                      );
                    },
                  );
                },
              ),
                AsyncError() => Text('Error'),
                _ => SectionGroup(
                  title: 'Restaurant',
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
    );
  }
}
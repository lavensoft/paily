import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:paily/modules/mini_app/views/mini_app.view.dart';
import 'package:paily/modules/store/enums/store_type.enum.dart';
import 'package:paily/modules/store/models/store.model.dart';
import 'package:paily/shared/helpers/formatter.helper.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/inline_button.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: ViewAppBar(
        title: store.name,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppPaddingTheme.contentPadding,
          child: FilledButton(
            onPressed: () async {
              if (store.miniAppUrl != null) {
                Navigator
                  .of(context)
                  .push(
                    CupertinoModalPopupRoute(
                      builder: (context) => MiniAppView(
                        url: store.miniAppUrl!,
                              name: store.name
                      )
                    )
                  );
              } else if (store.website != null) {
                await launchUrl(Uri.parse(store.website!));
              }
            }, 
            child: Text(
              switch(store.type) {
                EStoreType.landscape => 'Navigate',
                EStoreType.park => 'Buy ticket',
                EStoreType.hotel => 'Book now',
                EStoreType.restaurant => 'Book now',
              } +
              (store.priceFromLocalCur != null ? ' from \$${FormatHelper.formatNumber(store.priceFromLocalCur)}' : ''),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:  CachedNetworkImage(
              imageUrl: store.imageUrls[0],
              height: 390,
              fit: BoxFit.cover,
            ),
          ),
      
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddingTheme.contentPadding,
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 9,
                    children: [
                      Flexible(
                        child: Text(
                          store.name,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Badge(
                        label: Text('Openning'),
                        backgroundColor: CupertinoColors.activeGreen.withOpacity(.09),
                        textColor: CupertinoColors.activeGreen,
                      ),
                    ],
                  ),
                  Text(
                    store.description,
                    style: theme.textTheme.bodyMedium!.copyWith(  
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddingTheme.contentPadding.copyWith(
                top: 0,
              ),
              child: Row(
                spacing: 12,
                children: [
                  Visibility(
                    visible: store.miniAppUrl != null,
                    child: Expanded(
                      child: InlineButton(
                        onPressed: () {
                          Navigator
                            .of(context)
                            .push(
                              CupertinoModalPopupRoute(
                                builder: (context) => MiniAppView(
                                  url: store.miniAppUrl!,
                                  name: store.name
                                )
                              )
                            );
                        }, 
                        label: Text('Mini-app'),
                        icon: Icon(
                          HugeIcons.strokeRoundedWebDesign01
                        ),
                      )
                    ),
                  ),
                  Visibility(
                    visible: store.website != null,
                    child: Expanded(
                      child: InlineButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(store.website!));
                        }, 
                        label: Text('Website'),
                        icon: Icon(
                          HugeIcons.strokeRoundedGlobe02
                        ),
                      )
                    ),
                  ),
                ],
              ),
            )
          ),
      
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddingTheme.contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Utilities',
                    style: theme.textTheme.titleMedium,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      HugeIcons.strokeRoundedWifi01,
                      size: 21,
                    ),
                    title: Text('Free Internet'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      HugeIcons.strokeRoundedParkingAreaSquare,
                      size: 21,
                    ),
                    title: Text('Free parking'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      HugeIcons.strokeRoundedCreditCard,
                      size: 21,
                    ),
                    title: Text('Accept credit card'),
                  )
                ],
              ),
            ),
          ),
      
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddingTheme.contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  switch(store.type) {
                    EStoreType.landscape => 'Service',
                    EStoreType.park => 'Service',
                    EStoreType.hotel => 'Room',
                    EStoreType.restaurant => 'Menu',
                  },
                  style: theme.textTheme.titleMedium,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: store.services?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item =  store.services![index];

                      return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: CachedNetworkImage(
                        imageUrl: item.imageUrl,
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Text('\$${item.priceLocalCur}'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
      
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddingTheme.contentPadding,
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    store.address,
                    style: theme.textTheme.bodyMedium!.copyWith(  
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonalIcon(
                      onPressed: () async {
                        await MapsLauncher.launchCoordinates(store.lat, store.lng);
                      }, 
                      label: Text('Navigate'),
                      icon: Icon(
                        HugeIcons.strokeRoundedNavigation01
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/widgets/inline_button.widget.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: ViewAppBar(
        title: 'Ba Na Hills',
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppPaddingTheme.contentPadding.copyWith(
            bottom: 0,
          ),
          child: FilledButton(
            onPressed: () {}, 
            child: Text('Booking from \$10.00'),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:  CachedNetworkImage(
              imageUrl: 'https://vietnam.travel/sites/default/files/inline-images/shutterstock_1346056832.jpg',
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
                      Text(
                        'Ba Na Hills',
                        style: theme.textTheme.titleMedium,
                      ),
                      Badge(
                        label: Text('Openning'),
                        backgroundColor: CupertinoColors.activeGreen.withOpacity(.09),
                        textColor: CupertinoColors.activeGreen,
                      ),
                    ],
                  ),
                  Text(
                    'Theme parks may not be to every traveller’s taste. But Ba Na Hills is a must-visit for everyone. The French village is a replica of a medieval town, complete with European-style buildings, an impressive cathedral, and a quaint village square.',
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
                  Expanded(
                    child: InlineButton(
                      onPressed: () {}, 
                      label: Text('Mini-app'),
                      icon: Icon(
                        HugeIcons.strokeRoundedWebDesign01
                      ),
                    )
                  ),
                  Expanded(
                    child: InlineButton(
                      onPressed: () {}, 
                      label: Text('Website'),
                      icon: Icon(
                        HugeIcons.strokeRoundedGlobe02
                      ),
                    )
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
                    title: Text('Wifi'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      HugeIcons.strokeRoundedKitchenUtensils,
                      size: 21,
                    ),
                    title: Text('Kitchen'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      HugeIcons.strokeRoundedLaptop,
                      size: 21,
                    ),
                    title: Text('Private space to work'),
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
                    'Services',
                    style: theme.textTheme.titleMedium,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: CachedNetworkImage(
                        imageUrl: 'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-superJumbo.jpg',
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('King Room'),
                    subtitle: Text('\$10.00'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: CachedNetworkImage(
                        imageUrl: 'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-superJumbo.jpg',
                        width: 63,
                        height: 63,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('King Room'),
                    subtitle: Text('\$10.00'),
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
                    '15 Nai Nghia 1',
                    style: theme.textTheme.bodyMedium!.copyWith(  
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: () {}, 
                    label: Text('Navigate'),
                    icon: Icon(
                      HugeIcons.strokeRoundedNavigation01
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
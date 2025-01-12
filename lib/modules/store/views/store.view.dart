import 'package:cached_network_image/cached_network_image.dart';
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
          padding: AppPaddingTheme.viewPadding.copyWith(
            top: 0,
            bottom: 0,
          ),
          child: FilledButton(
            onPressed: () {}, 
            child: Text('Navigate')
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
              padding: AppPaddingTheme.viewPadding,
              child: Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ba Na Hills',
                    style: theme.textTheme.titleMedium,
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
              padding: AppPaddingTheme.viewPadding.copyWith(
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
        ],
      ),
    );
  }

}